class AdapterUtils {
  // Helpers para DateTime
  static DateTime dateFromJson(String date) => DateTime.parse(date);
  static String dateToJson(DateTime date) => date.toIso8601String();
}
