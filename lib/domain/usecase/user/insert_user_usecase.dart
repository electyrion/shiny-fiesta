import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';

class InsertUserUseCase extends UseCase<int, User> {
  final UserRepository _userRepository;

  InsertUserUseCase(this._userRepository);

  @override
  Future<int> call({required params}) {
    return _userRepository.insert(params);
  }
}
