import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';

class FindUserByIdUseCase extends UseCase<List<User>, int> {
  final UserRepository _postRepository;

  FindUserByIdUseCase(this._postRepository);

  @override
  Future<List<User>> call({required int params}) {
    return _postRepository.findUserById(params);
  }
}
