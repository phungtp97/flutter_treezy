import '../../core/base/base.dart';
import 'map_command.dart';
import 'map_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MapBloc extends BaseBloc<MapState, MapCommand> {
  MapBloc() : super(MapState());
}
