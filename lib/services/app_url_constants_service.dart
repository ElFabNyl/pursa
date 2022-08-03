class AppUrl {
  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    'Accept': 'application/json',
  };

  static const String baseUrl = 'https://exchange.pursa.co/api/v1/';
  static const String checkEmailExistance = 'check-email';
  static const String codeVerification = 'verifycode';
  static const String login = 'login';
  static const String register = 'complet-profile';
  static const String update = 'update-profile';
}
