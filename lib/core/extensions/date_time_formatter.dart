import 'package:intl/intl.dart';

/// Extension to format DateTime values
extension DateTimeFormatter on DateTime {
  /// Formats the date and time as 'dd/MM/yyyy HH:mm'
  /// Example: 2024-03-23 14:30 -> "23/03/2024 14:30"
  String formatTransactionDateTime() {
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }
}
