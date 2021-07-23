class ApiConstant{
  static String _baseUrl_Local = "http://localhost:7000/api/v1";
  static String _baseUrl = "https://offlix-server.herokuapp.com/api/v1";
  static String loginUrl = _baseUrl + "/login";
  static String myProfile = _baseUrl + "/myprofile";
  static String logout = _baseUrl + "/logout";
  static String allUsers = _baseUrl + "/allusers";
  static String block = _baseUrl + "/admin/block";
}

class R{
  static String authToken = "session";
  static String RoleAdmin = "admin";
  static String RoleUser = "user";
}