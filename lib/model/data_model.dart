// import 'package:assignment/model/times.dart';

class DataModel {
  DataModel({
    required this.id,
    required this.name,
    required this.categories,
    required this.profileImageUrl,
    required this.images,
    required this.operationTime,
    required this.address,
    required this.rating,
  });

  int id;
  String name;
  List<String> categories;
  String profileImageUrl;
  List<String> images;
  List<OperationTime> operationTime;
  String address;
  double rating;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        name: json["name"],
        categories: List<String>.from(json["categories"]),
        profileImageUrl: json["profile_image_url"],
        images: List<String>.from(json["images"]),
        // operationTime: List<OperationTime>.from(json['operation_time']),
        operationTime: (json['operation_time'] as List)
            .map((i) => OperationTime.fromJson(i))
            .toList(),
        address: json["address"],
        rating: json["rating"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categories": categories,
        "profile_image_url": profileImageUrl,
        "images": images,
        "operation_time": operationTime,
        "address": address,
        "rating": rating,
      };
}

class OperationTime {
  String day;
  String timeOpen;
  String timeClose;

  OperationTime({
    required this.day,
    required this.timeOpen,
    required this.timeClose,
  });

  factory OperationTime.fromJson(Map<String, dynamic> json) => OperationTime(
        day: json["day"],
        timeOpen: json["time_open"],
        timeClose: json["time_close"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "time_open": timeOpen,
        "time_close": timeClose,
      };
}
