import 'package:flutter_treezy/pages/history/history_page.dart';
import 'package:flutter_treezy/pages/pages.dart';
import 'package:injectable/injectable.dart';
import '../../blocs/home/home.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

@Named(Routes.home)
@Injectable(as: Widget)
class HomePage extends StatefulWidget {
  const HomePage() : super(key: null);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseUiState<HomePage, HomeBloc> {
  final PageController _pageController = PageController();

  ValueNotifier<int> indexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorKit.primaryBackground,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: ColorKit.white1,
            elevation: 0.0,
          )),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [_buildBody(), _buildNavigationBar()],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        FeedPage(),
        MapPage(),
        HistoryPage(),
        ProfilePage(),
      ],
    );
  }

  Widget _buildNavigationBar() {
    return ValueListenableBuilder<int>(
        valueListenable: indexNotifier,
        builder: (context, snapshot, _) {
          return CustomBottomNavBar(
            pageController: _pageController,
            enableMiddleItem: false,
            backgroundColor: Colors.white,
            selectedIndex: snapshot,
            items: [
              CustomBottomNavBarItem(
                normalImage: Assets.svg.icHomeOutlined,
                selectedImage: Assets.svg.icHomeFilled,
                text: localization.tab_bar_feed,
              ),
              CustomBottomNavBarItem(
                normalImage: Assets.svg.icMapOutlined,
                selectedImage: Assets.svg.icMapFilled,
                text: localization.tab_bar_map,
              ),
              CustomBottomNavBarItem(
                normalImage: Assets.svg.icRankingDisabled,
                selectedImage: Assets.svg.icRanking,
                text: localization.tab_bar_rank,
              ),
              CustomBottomNavBarItem(
                normalImage: Assets.svg.icProfileOutlined,
                selectedImage: Assets.svg.icProfileFilled,
                text: localization.tab_bar_profile,
              ),
            ],
            onTabSelected: _onTapped,
            iconMiddleTab: Assets.svg.icCamera,
            initialTab: 0,
          );
        });
  }

  Future<bool> _onTapped(int index) async {
    setTab(index);

    return Future.value(true);
  }

  void setTab(int index) {
    indexNotifier.value = index;
  }

  @override
  void commandListener(Command c) {}
}
