import 'package:easy_localization/easy_localization.dart';

extension DateTimeFormatter on String {
  String getFormattedDate() {
    try {
      final dateTime = DateTime.parse(this);
      final formatted = DateFormat('MMMM d, y').format(dateTime);
      return formatted;
    } catch (_) {
      return '';
    }
  }
}
