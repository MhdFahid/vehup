class Vehicle {
  String status;
  VehicleData data;

  Vehicle({required this.status, required this.data});

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      status: json["status"],
      data: VehicleData.fromJson(json["data"]),
    );
  }
}

class VehicleData {
  int id;

  String price;

  List<VehicleImage> images;

  VehicleData({
    required this.id,
    required this.price,
    required this.images,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) {
    return VehicleData(
      id: json["id"],
      price: json["price"],
      images: (json["images"] as List<dynamic>)
          .map((imageJson) => VehicleImage.fromJson(imageJson))
          .toList(),
    );
  }
}

class VehicleImage {
  String imageUrl;

  VehicleImage({
    required this.imageUrl,
  });

  factory VehicleImage.fromJson(Map<String, dynamic> json) {
    return VehicleImage(
      imageUrl: json["image_url"],
    );
  }
}
