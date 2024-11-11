import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/res/data_state.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';
import '../models/addAHabitReqModel.dart';

abstract class HomeService {
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);
}


class HomeServiceImpl extends HomeService {

  @override
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq) async {
    AddAHabitModel.fromEntity(newHabitReq);
    var newHabitReqModel = AddAHabitModel.fromEntity(newHabitReq);
    try {
      await FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid ?? "Unknown users").doc(newHabitReq.habit).set({
        newHabitReq.habit : newHabitReqModel.toJson()
      });

      return const DataSuccess("Sign up was successful");
    } on FirebaseAuthException  catch (e) {

      return DataFailed(
          errorMessage: e.message ?? "Something went wrong"
      );
    }
  }
}
