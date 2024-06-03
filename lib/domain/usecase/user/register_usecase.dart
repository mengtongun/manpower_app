import '../../../core/domain/usecase/use_case.dart';
import '../../entity/user/user.dart';
import '../../repository/user/user_repository.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_usecase.g.dart';

@JsonSerializable()
class RegisterParams {
  final String username;
  final String email;
  final String password;

  RegisterParams(
      {required this.username, required this.email, required this.password});

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}

class RegisterUseCase implements UseCase<User?, RegisterParams> {
  final UserRepository _userRepository;

  RegisterUseCase(this._userRepository);

  @override
  Future<User?> call({required RegisterParams params}) async {
    return _userRepository.register(params);
  }
}
