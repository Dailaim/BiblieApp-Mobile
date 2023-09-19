String? confirmPasswordValidator(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (value != password) {
    return 'Password does not match';
  }
  return null;
}