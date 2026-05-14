class AppValidator {
  AppValidator._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null) {
      return 'This field is required.';
    } else if (val.trim().isEmpty) {
      return 'This field is required.';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'Please enter valid email.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
    if (val == null) {
      return 'This field is required.';
    } else if (val.isEmpty) {
      return 'This field is required.';
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return 'Please enter strong Password.';
    } else {
      return null;
    }
  }
}
