class Validator {
  Validator._();

  static String? v(String? value, String title) {
    if (value == null || value.isEmpty) {
      return '$title tidak boleh kosong';
    }

    return null;
  }
}
