import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/res/data_state.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';
import '../models/HabitModel.dart';
import '../models/addAHabitReqModel.dart';

abstract class HomeService {
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);

  Future<DataState> getHabits();
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
}
