extension StringExtension on String {
  String get orEmpty {
    if (this != null) {
      return this;
    } else {
      return '';
    }
  }

  bool get isNotNullOrEmpty {
    if (this != null && isNotEmpty) {
      return true;
    }
    return false;
  }

  bool get isNullOrEmpty {
    if (this == null || isEmpty) {
      return true;
    }
    return false;
  }

  bool get isNull {
    if (this == null) {
      return true;
    }
    return false;
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeFirstOEach {
    if (isNullOrEmpty) {
      return '';
    }
    return split(' ').map((str) => str.capitalize()).join(' ');
  }

  String or(String value) {
    if (isNotNullOrEmpty) {
      return this;
    } else {
      return value;
    }
  }
}
