import 'package:injectable/injectable.dart';

import '../repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryIml extends UserRepository {
  @override
  void refreshUser() {
    // TODO: implement refreshUser
  }
}