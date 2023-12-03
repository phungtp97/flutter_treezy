import '../../core/base/base.dart';
import 'plan_new_command.dart';
import 'plan_new_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class Plan_newBloc extends BaseBloc<Plan_newState, Plan_newCommand> {
  Plan_newBloc() : super(Plan_newState());
}
