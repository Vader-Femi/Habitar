import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitar/features/home/domain/entities/user.dart';
import '../../../../core/res/data_state.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';
import '../models/HabitModel.dart';
import '../models/addAHabitReqModel.dart';
import '../models/user_model.dart';

abstract class HomeService {
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);

  Future<DataState> getHabits();

  Future<DataState> tickHabit(bool isTicked);

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
          .set({newHabitReq.habit: newHabitReqModel.toJson()});

      return const DataSuccess("Successfully Added");
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }

  @override
  Future<DataState> getHabits() async {
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
        var data = doc.data()[doc.id];
        var habit = HabitModel.fromJson(data);
        habitModels.add(habit);
      }

      return DataSuccess(habitModels);
    } on FirebaseException catch (e) {
      return DataFailed(errorMessage: e.message ?? "Something went wrong");
    }
  }

  @override
  Future<DataState> tickHabit(bool isTicked) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user?.uid == null) {
        throw FirebaseException(
            plugin: '', message: "Cannot find user. Please log in again");
      }

      var snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .get();

      var userModel = UserModel.fromJson(snapshot.data() ?? {});

      var newHabitsCompleted = isTicked
          ? (int.parse(userModel.habitsCompleted)) + 1
          : (int.parse(userModel.habitsCompleted)) - 1;

      FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
            userModel
                .copyWith(habitsCompleted: newHabitsCompleted.toString())
                .toJson(),
          );

      return DataSuccess("Total Completed: $newHabitsCompleted");
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
