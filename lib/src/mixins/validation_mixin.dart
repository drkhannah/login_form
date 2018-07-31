class ValidationMixin {
  String validateEmail(String value) =>
      value.contains('@') && value.contains('.')
          ? null
          : 'Enter a ligit email address';

  String validatePassword(String value) =>
      value.length >= 4 ? null : 'Password should be at least 4 characters';
}
