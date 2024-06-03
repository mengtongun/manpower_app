class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://localhost:8000";

  static const String version = "/v1/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // get employees endpoints
  static const String getEmployees = baseUrl + version + "/employees";

  // patch employee endpoints
  static const String pathEmployee = baseUrl + version + "/employees";

  // get employee export csv
  static const String exportEmployee = baseUrl + version + "/employees/csv";

  // login endpoint
  static const String login = baseUrl + "/auth/login";

  // register endpoint
  static const String register = baseUrl + "/auth/register";
}
