import 'package:intl/intl.dart';

String SetCurrentDate() {
  return DateFormat.yMMMd().format(DateTime.now().toLocal());
}
