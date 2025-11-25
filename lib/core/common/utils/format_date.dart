import 'package:intl/intl.dart';

String formatDateByUnixTimeToYMMMD(int unixTime) {
  return DateFormat.yMMMd().format(formatDateByUnixTime(unixTime));
}

String formatDateByUnixTimeToHoursMinutes(int unixTime) {
  return DateFormat('HH:mm').format(formatDateByUnixTime(unixTime));
}

DateTime formatDateByUnixTime(int unixTime) {
  return DateTime.fromMillisecondsSinceEpoch((unixTime * 1000)).toLocal();
}
