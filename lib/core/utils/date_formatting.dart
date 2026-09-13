import 'package:intl/intl.dart';

class DateFormatting {
  static final DateFormat _shortDate = DateFormat('MMM d, yyyy');
  static final DateFormat _dateTime = DateFormat('MMM d, yyyy • h:mm a');
  static final DateFormat _timeOnly = DateFormat('h:mm a');

  static String formatDate(DateTime? date) {
    if (date == null) return '—';
    return _shortDate.format(date.toLocal());
  }

  static String formatDateTime(DateTime? date) {
    if (date == null) return '—';
    return _dateTime.format(date.toLocal());
  }

  static String formatTime(DateTime? date) {
    if (date == null) return '—';
    return _timeOnly.format(date.toLocal());
  }

  static String formatIso(String? isoString) {
    if (isoString == null || isoString.isEmpty) return '—';
    try {
      final dt = DateTime.parse(isoString);
      return formatDateTime(dt);
    } catch (_) {
      return isoString;
    }
  }

  static String daysAgo(DateTime? date) {
    if (date == null) return '—';
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes}m ago';
      }
      return '${diff.inHours}h ago';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else {
      return '${diff.inDays} days ago';
    }
  }
}
