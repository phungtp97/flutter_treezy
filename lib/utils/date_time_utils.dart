import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String formatDateTime(int dateTimeMillis) {
    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dateTimeMillis);
    final difference = now.difference(dateTime);

    if (difference.inDays <= 1) {
      if (difference.inMinutes < 30) {
        return 'a moment ago';
      } else if (difference.inHours <= 4) {
        final hours = difference.inHours;
        return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
      } else {
        return DateFormat('hh:mm a').format(dateTime);
      }
    } else {
      final days = difference.inDays;
      if (days <= 30) {
        return '$days ${days == 1 ? 'day' : 'days'} ago';
      } else if (days <= 365) {
        final months = (days / 30).floor();
        return '$months ${months == 1 ? 'month' : 'months'} ago';
      } else {
        final years = (days / 365).floor();
        return '$years ${years == 1 ? 'year' : 'years'} ago';
      }
    }
  }
}
