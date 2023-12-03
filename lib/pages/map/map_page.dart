import '../../blocs/blocs.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends BaseUiState<MapPage, FeedBloc> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void commandListener(Command c) {
    // TODO: implement commandListener
  }

  @override
  bool get wantKeepAlive => true;
}