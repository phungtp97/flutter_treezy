import '../../core/base/base.dart';
import 'history_command.dart';
import 'history_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HistoryBloc extends BaseBloc<HistoryState, HistoryCommand> {
  HistoryBloc() : super(HistoryState());
}
