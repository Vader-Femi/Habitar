import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class DeleteAccountUseCase implements Usecase<DataState,dynamic> {

  final HomeRepository _homeRepository;
  DeleteAccountUseCase(this._homeRepository);

  @override
  Future<DataState> call({dynamic params}) async {
    return _homeRepository.deleteAccount();
  }

}