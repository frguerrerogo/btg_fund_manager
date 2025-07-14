import 'package:intl/intl.dart';

class AppUtils {
  static String formatCurrency(int value) {
    final formatter = NumberFormat('#,###', 'es_CO');
    return formatter.format(value);
  }
}
