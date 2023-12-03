import '../../core/base/base.dart';
import 'profile_command.dart';
import 'profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileBloc extends BaseBloc<ProfileState, ProfileCommand> {
  ProfileBloc() : super(ProfileState());
}
