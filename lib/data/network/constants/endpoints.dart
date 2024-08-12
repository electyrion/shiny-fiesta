class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://reqres.in/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // users endpoints
  static const String getUsers = baseUrl + "/users?page=";
}