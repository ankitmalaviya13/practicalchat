class PrefsKey {
  static const userToken = "user_token";
  static const userid = "user_id";
  static const countryCode = "country_code";
  static const phoneNumber = "phone_number";
  static const isPremium = "is_premium";
  static const profile_pic = "profile_pic";
  static const emailId = "email_id";
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const username = "username";
}


class SocketConstants {
  static const String transportsHeader = 'transports';
  static const String webSocketOption = 'websocket';
  static const String socketUrl = "https://chat-fwv4.onrender.com";


  //Default events
  static const String eventConnect = "connect";
  static const String eventDisconnect = "disconnect";
  static const String eventConnectTimeout = "connect_timeout";
  static const String onSocketError = "onSocketError";

  // listening events
  static const String socket_register = "socket_register";
  static const String socket_register_call = "socket_register_call";
  static const String socket_disconnect = "socket_disconnect";
  static const String online_offline = "online_offline";

  //Video Call  events
  static const String connectCall = "connectCall";
  static const String onCallRequest = "onCallRequest";
  static const String acceptCall = "acceptCall";
  static const String onAcceptCall = "onAcceptCall";
  static const String rejectCall = "rejectCall";
  static const String onRejectCall = "onRejectCall";
}