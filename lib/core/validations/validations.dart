abstract class Validations {
  static isEmailValid(String email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (email.isEmpty) {
      return "Please enter your email";
    }
    return emailRegex.hasMatch(email) ? null : "Please enter a valid email";
  }

  static isPasswordValid(String password) {
    if (password.isEmpty) {
      return "Please enter your password";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}
