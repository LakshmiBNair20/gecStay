// To parse this JSON data, do
//
//     final hostelResponseModel = hostelResponseModelFromJson(jsonString);

import 'dart:convert';

HostelResponseModel hostelResponseModelFromJson(String str) =>
    HostelResponseModel.fromJson(json.decode(str));

String hostelResponseModelToJson(HostelResponseModel data) =>
    json.encode(data.toJson());

class HostelResponseModel {
  String description;
  String hostelName;
  String hostelId;
  Location location; // Nested Location object
  String ownerName;
  String distFromCollege;
  String isMessAvailable;
  String isMensHostel;
  String phoneNumber;
  String rent;
  String rooms;
  String vacancy;
  List<String> hostelImages; // List of image URLs
  String hostelOwnerUserId;
  String rating;
  Approval approval;

  HostelResponseModel(
      {required this.description,
      required this.hostelName,
      required this.location,
      required this.hostelId,
      required this.ownerName,
      required this.distFromCollege,
      required this.isMessAvailable,
      required this.isMensHostel,
      required this.phoneNumber,
      required this.rent,
      required this.rooms,
      required this.vacancy,
      required this.hostelImages,
      required this.hostelOwnerUserId,
      required this.rating,
      required this.approval});

  factory HostelResponseModel.fromJson(Map<String, dynamic> json) =>
      HostelResponseModel(
        description: json["description"],
        hostelName: json["hostel_name"],
        hostelId: json['hostelId'],
        location: Location.fromJson(json["location"]),
        ownerName: json["owner_name"],
        distFromCollege: json["dist_from_college"],
        isMessAvailable: json["isMess_available"],
        isMensHostel: json["isMensHostel"],
        phoneNumber: json["phone_number"],
        rent: json["rent"],
        rooms: json["rooms"],
        vacancy: json["vacancy"],
        hostelImages: List<String>.from(json["imageList"].map((x) => x)),
        hostelOwnerUserId: json['hostelOwnerUserId'],
        rating: json['rating'],
        approval: Approval.fromJson(json["approval"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "hostel_name": hostelName,
        "location": location.toJson(),
        "hostelId": hostelId,
        "owner_name": ownerName,
        "dist_from_college": distFromCollege,
        "isMess_available": isMessAvailable,
        "isMensHostel": isMensHostel,
        "phone_number": phoneNumber,
        "rent": rent,
        "rooms": rooms,
        "vacancy": vacancy,
        "imageList": List<dynamic>.from(hostelImages.map((x) => x)),
        "hostelOwnerUserId": hostelOwnerUserId,
        "rating": rating,
        "approval": approval.toJson(),
      };

  static HostelResponseModel fromMap(Map<String, dynamic> map) {
    return HostelResponseModel(
      description: map["description"] ?? "", // Provide a default value if null
      hostelName: map["hostel_name"] ?? "",
      hostelId: map["hostelId"] ?? "",
      location:
          Location.fromJson(map["location"] ?? {}), // Handle null location
      ownerName: map["owner_name"] ?? "",
      distFromCollege: map["dist_from_college"] ?? "",
      isMessAvailable: map["isMess_available"] ?? "",
      isMensHostel: map["isMensHostel"] ?? "",
      phoneNumber: map["phone_number"] ?? "",
      rent: map["rent"] ?? "",
      rooms: map["rooms"] ?? "",
      vacancy: map["vacancy"] ?? "",
      hostelImages: List<String>.from(
          map["imageList"]?.map((x) => x) ?? []), // Handle null imageList
      hostelOwnerUserId: map["hostelOwnerUserId"] ?? "",
      rating: map["rating"] ?? "0.0", // Default rating if null
      approval:
          Approval.fromJson(map["approval"] ?? {}), // Handle null approval
    );
  }
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble() ?? 0.0,
        longitude: json["longitude"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Approval {
  String reason;
  String type;

  Approval({
    required this.reason,
    required this.type,
  });

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        reason: json["reason"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "type": type,
      };
}
