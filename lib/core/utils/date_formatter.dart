import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatDate(DateTime date) {
    return DateFormat(
      'dd/MM/yyyy',
    ).format(date);
  }

  static String formatTime(DateTime time) {
    return DateFormat(
      'hh:mm a',
    ).format(time);
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat(
      'dd/MM/yyyy - hh:mm a',
    ).format(dateTime);
  }

  static String formatReadableDate(DateTime date) {
    return DateFormat(
      'EEE, dd MMM yyyy',
    ).format(date);
  }
}