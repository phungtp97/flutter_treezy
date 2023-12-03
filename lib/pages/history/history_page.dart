import '../../blocs/blocs.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseUiState<HistoryPage, FeedBloc> with AutomaticKeepAliveClientMixin{
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