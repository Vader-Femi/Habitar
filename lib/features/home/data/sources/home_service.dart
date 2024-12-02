import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitar/common/helpers/get_today_date.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/entities/user.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../../notification/notification.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/usecases/add_habits_batch_to_db.dart';
import '../../domain/usecases/delete_all_habits_in_db.dart';
import '../models/HabitModel.dart';
import '../models/addAHabitReqModel.dart';
import '../models/user_model.dart';

abstract class HomeService {
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);

  Future<DataState> getAllHabits();

  Future<DataState> tickHabit(TodayHabitEntity todayHabitEntity);

  Future<UserEntity> getUser();
}

class HomeServiceImpl extends HomeService {
  @override
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq) async {
    AddAHabitModel.fromEntity(newHabitReq);
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

      var habitModels = <HabitModel>[];
      var snapshot = await FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .get();

      for (var doc in snapshot.docs) {
        var data = doc.data();
        var habit = HabitModel.fromJson(data);
        habitModels.add(habit);
      }

      await sl<DeleteAllHabitsInDBUseCase>().call();
      await sl<AddHabitsBatchToDBUseCase>().call(params: habitModels);

      var notificationService = sl<NotificationService>();
      notificationService.scheduleNotificationsForHabits(
        habitModels
            .map(
              (habitModel) => HabitEntity.fromModel(habitModel),
            )
            .toList(),
      );

      return DataSuccess(habitModels);
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
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

      FirebaseFirestore.instance
          .collection(user.uid)
          .doc(todayHabitEntity.habit.habit)
          .set(
            habitModel
                .copyWith(streak: newStreak, lastDateTicked: newLastDateTicked)
                .toJson(),
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
    } on FirebaseException catch (e) {
      return UserEntity(email: "", username: "", habitsCompleted: "-1");
    }
  }
}
