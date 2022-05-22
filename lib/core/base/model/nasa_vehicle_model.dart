// To parse this JSON data, do
//
//     final nasaVehicleModel = nasaVehicleModelFromJson(jsonString);

import 'dart:convert';

List<List<NasaVehicleModel>> searchStoreFromJson(String str) =>
    List<List<NasaVehicleModel>>.from(json.decode(str).map(
        (x) => List<NasaVehicleModel>.from(x.map((x) => NasaVehicleModel.fromJson(x)))));

String searchStoreToJson(List<List<NasaVehicleModel>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class NasaVehicleModel {
    NasaVehicleModel({
        this.photos,
    });

    List<Photo>? photos;

    factory NasaVehicleModel.fromJson(Map<String, dynamic> json) => NasaVehicleModel(
        photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "photos": photos == null ? null : List<dynamic>.from(photos!.map((x) => x.toJson())),
    };
}

class Photo {
    Photo({
        this.id,
        this.sol,
        this.camera,
        this.imgSrc,
        this.earthDate,
        this.rover,
    });

    int? id;
    int? sol;
    Camera? camera;
    String? imgSrc;
    DateTime? earthDate;
    Rover? rover;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"] == null ? null : json["id"],
        sol: json["sol"] == null ? null : json["sol"],
        camera: json["camera"] == null ? null : Camera.fromJson(json["camera"]),
        imgSrc: json["img_src"] == null ? null : json["img_src"],
        earthDate: json["earth_date"] == null ? null : DateTime.parse(json["earth_date"]),
        rover: json["rover"] == null ? null : Rover.fromJson(json["rover"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "sol": sol == null ? null : sol,
        "camera": camera == null ? null : camera!.toJson(),
        "img_src": imgSrc == null ? null : imgSrc,
        "earth_date": earthDate == null ? null : "${earthDate!.year.toString().padLeft(4, '0')}-${earthDate!.month.toString().padLeft(2, '0')}-${earthDate!.day.toString().padLeft(2, '0')}",
        "rover": rover == null ? null : rover!.toJson(),
    };
}

class Camera {
    Camera({
        this.id,
        this.name,
        this.roverId,
        this.fullName,
    });

    int? id;
    String? name;
    int? roverId;
    String? fullName;

    factory Camera.fromJson(Map<String, dynamic> json) => Camera(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        roverId: json["rover_id"] == null ? null : json["rover_id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "rover_id": roverId == null ? null : roverId,
        "full_name": fullName == null ? null : fullName,
    };
}

class Rover {
    Rover({
        this.id,
        this.name,
        this.landingDate,
        this.launchDate,
        this.status,
    });

    int? id;
    String? name;
    DateTime? landingDate;
    DateTime? launchDate;
    String? status;

    factory Rover.fromJson(Map<String, dynamic> json) => Rover(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        landingDate: json["landing_date"] == null ? null : DateTime.parse(json["landing_date"]),
        launchDate: json["launch_date"] == null ? null : DateTime.parse(json["launch_date"]),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "landing_date": landingDate == null ? null : "${landingDate!.year.toString().padLeft(4, '0')}-${landingDate!.month.toString().padLeft(2, '0')}-${landingDate!.day.toString().padLeft(2, '0')}",
        "launch_date": launchDate == null ? null : "${launchDate!.year.toString().padLeft(4, '0')}-${launchDate!.month.toString().padLeft(2, '0')}-${launchDate!.day.toString().padLeft(2, '0')}",
        "status": status == null ? null : status,
    };
}
