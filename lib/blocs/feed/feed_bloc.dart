import '../../core/base/base.dart';
import 'feed_command.dart';
import 'feed_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedBloc extends BaseBloc<FeedState, FeedCommand> {
  FeedBloc() : super(FeedState());
}
