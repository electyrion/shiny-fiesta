
import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';

class GetUserUseCase extends UseCase<UserList, void> {

  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<UserList> call({required params}) {
    return _userRepository.getUsers();
  }
}