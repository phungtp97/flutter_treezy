import '../../blocs/blocs.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends BaseUiState<FeedPage, FeedBloc> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView();
  }

  @override
  void commandListener(Command c) {
    // TODO: implement commandListener
  }

  @override
  bool get wantKeepAlive => true;
}