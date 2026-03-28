class InputValidation {
  const InputValidation._();

  static String? requiredText(
    String value, {
    required String fieldName,
    int minLength = 1,
    int maxLength = 120,
  }) {
    final normalized = value.trim();
    if (normalized.isEmpty) {
      return '$fieldName is required.';
    }
    if (normalized.length < minLength) {
      return '$fieldName is too short.';
    }
    if (normalized.length > maxLength) {
      return '$fieldName is too long.';
    }
    return null;
  }

  static String? nonNegativeInt(
    String value, {
    required String fieldName,
    int max = 10000,
  }) {
    final parsed = int.tryParse(value.trim());
    if (parsed == null) {
      return '$fieldName must be a whole number.';
    }
    if (parsed < 0) {
      return '$fieldName cannot be negative.';
    }
    if (parsed > max) {
      return '$fieldName is out of allowed range.';
    }
    return null;
  }

  static String? nonNegativeDouble(
    String value, {
    required String fieldName,
    double max = 1000,
  }) {
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return '$fieldName must be a number.';
    }
    if (parsed < 0) {
      return '$fieldName cannot be negative.';
    }
    if (parsed > max) {
      return '$fieldName is out of allowed range.';
    }
    return null;
  }
}
