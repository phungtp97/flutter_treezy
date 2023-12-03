import '../core/constant.dart';
import '../ui.dart';

class CustomBottomNavBarItem {
  CustomBottomNavBarItem({
    required this.normalImage,
    required this.selectedImage,
    required this.text,
  });

  SvgGenImage normalImage;
  SvgGenImage selectedImage;
  String text;
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key? key,
    this.height = AppConstant.mainBottomTabSize,
    this.iconSize = 24.0,
    this.backgroundColor = ColorKit.primaryBackground,
    this.defaultIconColor = ColorKit.white1,
    this.selectedIconColor = ColorKit.primary2,
    this.onMiddleTabSelected,
    required this.selectedIndex,
    required this.items,
    required this.onTabSelected,
    required this.iconMiddleTab,
    required this.initialTab,
    required this.pageController,
    this.enableMiddleItem = true,
  }) : super(key: key);

  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color defaultIconColor;
  final Color selectedIconColor;
  final List<CustomBottomNavBarItem> items;
  final Future<bool> Function(int) onTabSelected;
  final SvgGenImage iconMiddleTab;
  final VoidCallback? onMiddleTabSelected;
  final int initialTab;
  final bool enableMiddleItem;
  final PageController pageController;
  final int selectedIndex;

  @override
  State<StatefulWidget> createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  //int _selectedIndex = 0;

  void _updateIndex(int index) {
    //final oldIndex = _selectedIndex;

    widget.onTabSelected(index).then((value) {
      if (value) {
        // if ((oldIndex - index).abs() > 1) {
        //   widget.pageController.jumpToPage(index);
        // }
        // else
        {
          widget.pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        }
      }
    });
    // widget.pageController.addListener(() {
    //   if (widget.pageController.page != null) {
    //     double temp = widget.pageController.page!;
    //     print('temp - $temp');
    //     if(temp.roundToDouble() != temp) return;
    //     _selectedIndex = temp.round();
    //     setState(() {});
    //   }
    // });
  }

  @override
  void initState() {
    //_selectedIndex = widget.initialTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    if (widget.enableMiddleItem) {
      items.insert(items.length >> 1, _buildMiddleTabItem());
    }

    return Container(
      color: widget.backgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: double.maxFinite,
                      height: 1,
                      color: ColorKit.primaryBackground))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 9.0, right: 9.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                color: ColorKit.primary1,
              ),
              child: GestureDetector(
                onTap: widget.onMiddleTabSelected,
                child: widget.iconMiddleTab.svg(
                  height: 22,
                  width: 24,
                  color: ColorKit.primary3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required CustomBottomNavBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    // final Color color = _selectedIndex == index
    //     ? widget.selectedIconColor
    //     : widget.defaultIconColor;
    final Color color = widget.defaultIconColor;

    // AssetGenImage image = item.normalImage;
    SvgGenImage image = widget.selectedIndex == index ? item.selectedImage : item.normalImage;

    final bottomPadding = MediaQuery.of(context).padding.bottom / 3;
    return Expanded(
      child: InkWell(
        onTap: () => onPressed(index),
        child: SizedBox(
          height: widget.height + bottomPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image.svg(
                // color: color,
                height: widget.iconSize,
                width: widget.iconSize,
              ),
              const SizedBox(height: 4),
              item.text.textXS(),
              SizedBox(height: bottomPadding)
            ],
          ),
        ),
      ),
    );
  }
}
