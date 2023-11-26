class AppUrl {
  AppUrl._();

  // base url
  static const String baseUrl = "https://chat-fwv4.onrender.com/api/";
  static const String imagebaseUrl = "https://fursa-app.io:8000/";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(minutes: 2);

  // connectTimeout
  static const Duration connectionTimeout = Duration(minutes: 2);

  static const String login = 'login';
  static const String signUp = 'register';
  static const String allusers = 'allusers';

}
