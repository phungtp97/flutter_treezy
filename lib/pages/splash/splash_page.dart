import '../../blocs/splash/splash.dart';
import '../../core/base/base.dart';
import '../../ui.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseUiState<SplashPage, SplashBloc> {
  @override
  void initState() {
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorKit.primaryBackground,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(width: 200, height: 200, child: Assets.svg.icBrand.svg(height: 200, width: 200)),
        ),
      ),
    );
  }

  @override
  void commandListener(Command c) {
    if (c is SplashCommandNavLogin) {
      pushAndRemoveUntil(Routes.home);
    }
  }
}
