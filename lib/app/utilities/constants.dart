class Constants {
  static const String baseUrl = "http://192.168.196.232:3030/api/";

  static const String logIn = "users/login";
  static const String register = 'users/signUp';
  static const String getUsers = 'users/getUsers';
  static const String getUserOfGroup = 'group/getUserOfGroup';
  static const String getGroups = 'group/getGroups';
  static const String createGroup = 'group/createGroup';
  static const String addUserToGroup = 'group/addUserToGroup';

  // =============== Files =====================
  static const String upload = 'file/upload';

  static const String empty = "";

  static const int zero = 0;

  static String? token = "";

  static const int apiTimeOut = 60000;

  static const int pageSize = 50;
}
