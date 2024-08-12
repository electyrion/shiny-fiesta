
import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/user/user_list.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';

import 'package:json_annotation/json_annotation.dart';

part 'get_user_usecase.g.dart';

@JsonSerializable()
class GetUserUseCaseParams {
  final int page;

  GetUserUseCaseParams({required this.page});

  factory GetUserUseCaseParams.fromJson(Map<String, dynamic> json) =>
      _$GetUserUseCaseParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserUseCaseParamsToJson(this);
}

class GetUserUseCase extends UseCase<UserList, GetUserUseCaseParams> {

  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<UserList> call({required GetUserUseCaseParams params}) {
    return _userRepository.getUsers(params);
  }
}