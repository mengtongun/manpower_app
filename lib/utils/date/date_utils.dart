import 'package:intl/intl.dart';

class FormatDateUtils {
  static DateTime toDateTime(String? dateString) {
    DateFormat format = DateFormat('yyyy-MM-dd');
    if (dateString == null) {
      return DateTime.now();
    }
    return format.parse(dateString);
  }

  static String? toDateString(DateTime? date) {
    if (date == null) {
      return null;
    }
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
