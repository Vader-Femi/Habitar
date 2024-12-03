import 'package:habitar/features/home/domain/entities/user.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/usecase/usecase.dart';

class GetUserUseCase implements Usecase<UserEntity,dynamic> {

  final HomeRepository _homeRepository;
  GetUserUseCase(this._homeRepository);

  @override
  Future<UserEntity> call({dynamic params}) async {
    return _homeRepository.getUser();
  }

}