class ApiUrls {
  static const String baseUrl = "https://test.vehup.com/api/";

  static String vehicleDetails(int vehicleId) =>
      "$baseUrl/vendor/get-vehicle-details/$vehicleId";
}
