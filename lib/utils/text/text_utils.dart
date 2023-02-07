class TextUtils {
  String makeUpperCaseWord({
    required String text,
  }) {
    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }
}
