import 'package:injectable/injectable.dart';

@Singleton()
class TrackerConfiguration {
  final String trackerId;
  final String env;

  TrackerConfiguration({@Named('trackerId') required this.trackerId, @Named('env') required this.env});
}

class TrackerService {
  final TrackerConfiguration trackerConfiguration;
  final String instanceName;

  TrackerService(this.instanceName, {required this.trackerConfiguration});

  void trackCommand(TrackerParams params) {}

  void trackEvent() {}
}

class TrackerParams {
  final String? eventParams;
  final StackTrace? stackTrace;
  final Object? object;

  TrackerParams({this.eventParams, this.stackTrace, this.object});
}
