import '../../blocs/blocs.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BaseUiState<ProfilePage, FeedBloc> with AutomaticKeepAliveClientMixin{
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