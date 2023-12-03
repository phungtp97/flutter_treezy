import 'package:injectable/injectable.dart';
import '../../core/base/base.dart';
import 'splash_command.dart';

@injectable
class SplashBloc extends BaseBloc<EmptyState, SplashCommand> {
  SplashBloc() : super(EmptyState());

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    command = SplashCommandNavLogin();
  }
}