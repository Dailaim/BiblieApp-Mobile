String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your username';
  }
  if (value.length < 6) {
    return 'Username must be at least 6 characters';
  }

  return null;
}
