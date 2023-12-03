import '../../core/base/base.dart';
import 'home_command.dart';
import 'home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends BaseBloc<HomeState, HomeCommand> {
  HomeBloc() : super(HomeState());
}
