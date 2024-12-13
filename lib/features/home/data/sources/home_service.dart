import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitar/common/helpers/get_today_date.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/entities/update_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/entities/user.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../../notification/notification.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/usecases/add_habits_batch_to_db.dart';
import '../../domain/usecases/delete_all_habits_in_db.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/get_habits_from_db.dart';
import '../../domain/usecases/update_habit_in_db.dart';
import '../models/HabitModel.dart';
import '../models/addAHabitReqModel.dart';
import '../models/updateAHabitReqModel.dart';
import '../models/user_model.dart';

abstract class HomeService {
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);

  Future<DataState> getAllHabits();

  Future<void> compareAndUpdateDB(
    List<HabitModel> habitsFromDb,
    List<HabitModel> habitsFromRemote,
  );

  Future<DataState> tickHabit(TodayHabitEntity todayHabitEntity);

  Future<DataState> updateHabit(UpdateAHabitReqEntity updateAHabitReqEntity);

  Future<DataState> deleteHabit(HabitEntity habitEntity);

  Future<UserEntity> getUser();
}

class HomeServiceImpl extends HomeService {
  @override
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq) async {
    var newHabitReqModel = AddAHabitModel.fromEntity(newHabitReq);
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser?.uid ?? "Unknown users")
          .doc(newHabitReq.habit)
          .set(newHabitReqModel.toJson());

      return const DataSuccess("Successfully Added");
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }

  @override
  Future<DataState> getAllHabits() async {
    try {
      if (FirebaseAuth.instance.currentUser?.uid == null) {
        throw FirebaseException(
            plugin: '', message: "Cannot find user. Please log in again");
      }

      var habitsFromRemote = <HabitModel>[];
      var snapshot = await FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .get();

      for (var doc in snapshot.docs) {
        var data = doc.data();
        var habit = HabitModel.fromJson(data);
        habitsFromRemote.add(habit);
      }

      var habitsFromDb = await sl<GetHabitsFromDBUseCase>().call();

      compareAndUpdateDB(
        habitsFromDb,
        habitsFromRemote,
      );

      return DataSuccess(habitsFromRemote);
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }

  @override
  Future<void> compareAndUpdateDB(
    List<HabitModel> habitsFromDb,
    List<HabitModel> habitsFromRemote,
  ) async {
    var habitsFromDbInJson = StringBuffer();
    var habitsFromRemoteInJson = StringBuffer();

    for (var item in habitsFromDb) {
      habitsFromDbInJson.writeln(item.toJson().toString());
    }
    for (var item in habitsFromRemote) {
      habitsFromRemoteInJson.writeln(item.toJson().toString());
    }

    var isEqual = DeepCollectionEquality.unordered().equals(
      habitsFromDbInJson.toString(),
      habitsFromRemoteInJson.toString(),
    );

    if (isEqual == false) {
      await sl<DeleteAllHabitsInDBUseCase>().call();
      await sl<AddHabitsBatchToDBUseCase>().call(params: habitsFromRemote);
      var notificationService = sl<NotificationService>();
      await notificationService.scheduleNotificationsForHabits(
        habitsFromRemote
            .map(
              (habitModel) => HabitEntity.fromModel(habitModel),
            )
            .toList(),
      );
    }
  }

  @override
  Future<DataState> tickHabit(TodayHabitEntity todayHabitEntity) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user?.uid == null) {
        throw FirebaseException(
            plugin: '', message: "Cannot find user. Please log in again");
      }

      // Set New Habit Model
      var habitSnapshot = await FirebaseFirestore.instance
          .collection(user!.uid)
          .doc(todayHabitEntity.habit.habit)
          .get();

      var habitModel = HabitModel.fromJson(habitSnapshot.data() ?? {});
      var newStreak = todayHabitEntity.isSelected
          ? (int.parse(habitModel.streak) + 1).toString()
          : (int.parse(habitModel.streak) - 1).toString();
      var newLastDateTicked = todayHabitEntity.isSelected ? getTodayDate() : "";
      var newHabitModel = habitModel.copyWith(
          streak: newStreak, lastDateTicked: newLastDateTicked);

      // Update remote db
      FirebaseFirestore.instance
          .collection(user.uid)
          .doc(todayHabitEntity.habit.habit)
          .set(
            newHabitModel.toJson(),
          );

      // Also update local db
      await sl<UpdateHabitInDbUseCase>().call(
        params: UpdateAHabitReqModel(
            newHabit: AddAHabitModel.fromHabitModel(newHabitModel),
            oldId: todayHabitEntity.habit.habit),
      );

      // Update User's Total Completed
      var userSnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get();

      var userModel = UserModel.fromJson(userSnapshot.data() ?? {});

      var newTotalHabitsCompleted = todayHabitEntity.isSelected
          ? (int.parse(userModel.habitsCompleted)) + 1
          : (int.parse(userModel.habitsCompleted)) - 1;

      FirebaseFirestore.instance.collection("Users").doc(user.uid).set(
            userModel
                .copyWith(habitsCompleted: newTotalHabitsCompleted.toString())
                .toJson(),
          );

      return DataSuccess("Streak: $newStreak");
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }

  @override
  Future<UserEntity> getUser() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user?.uid == null) {
        throw FirebaseException(
            plugin: '', message: "Cannot find user. Please log in again");
      }

      var snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      var userModel = UserModel.fromJson(snapshot.data() ?? {});

      return UserEntity.fromModel(userModel);
    } on FirebaseException {
      return UserEntity(email: "", username: "", habitsCompleted: "-1");
    }
  }

  @override
  Future<DataState> deleteHabit(HabitEntity habitEntity) async {
    var newHabitReqModel = AddAHabitModel.fromHabitEntity(habitEntity);
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser?.uid ?? "Unknown users")
          .doc(newHabitReqModel.habit)
          .delete();

      await sl<GetHabitsUseCase>().call();

      return const DataSuccess("Successfully Added");
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }

  @override
  Future<DataState> updateHabit(
      UpdateAHabitReqEntity updateAHabitReqEntity) async {
    var firestoreInstance = FirebaseFirestore.instance;
    try {
      await //Get old doc details
          firestoreInstance
              .collection(
                  FirebaseAuth.instance.currentUser?.uid ?? "Unknown users")
              .doc(updateAHabitReqEntity.oldId)
              .get()
              .then(
        (doc) async {
          if (doc.data() != null && doc.exists) {
            var data = doc.data();
            var habit = HabitModel.fromJson(data!);

            //Deletes the old doc
            await firestoreInstance
                .collection(FirebaseAuth.instance.currentUser?.uid ??
                "Unknown users")
                .doc(updateAHabitReqEntity.oldId)
                .delete();

            //Creates new doc with old streak and lastDateTicked
            var newHabitReqModel =
                AddAHabitModel.fromUpdateAHabitReqEntity(updateAHabitReqEntity)
                    .copyWith(
                        streak: habit.streak,
                        lastDateTicked: habit.lastDateTicked);

            await firestoreInstance
                .collection(
                    FirebaseAuth.instance.currentUser?.uid ?? "Unknown users")
                .doc(updateAHabitReqEntity.newHabit.habit)
                .set(newHabitReqModel.toJson());
          }
        },
      );

      await sl<GetHabitsUseCase>().call();

      return const DataSuccess("Successfully Added");
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }
}
