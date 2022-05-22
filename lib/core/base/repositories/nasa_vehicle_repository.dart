import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasa_app/core/base/model/nasa_vehicle_model.dart';
import 'package:nasa_app/core/utils/network_error.dart';

import '../../constants/url_constant.dart';

abstract class NasaVehicleRepository {
  Future<List<Photo>> getNasaSpiritVehicles();
  Future<List<Photo>> getNasaOpportunityVehicles();
  Future<List<Photo>> getNasaCuriosityVehicles(int page);


}

class SampleNasaVehicleRepository implements NasaVehicleRepository {
  final urlSpirit = "${UrlConstant.NASA_SPIRIT_URL}";
  final urlOpportunity = "${UrlConstant.NASA_OPPORTUNITY_URL}";
  final urlCuriosity = "${UrlConstant.NASA_CURIOSITY_URL}";
  List<Photo> nasaSpiritVehicles = [];
  List<Photo> nasaOpportunityVehicles = [];
  List<Photo> nasaCuriosityVehicles = [];

  @override
  Future<List<Photo>> getNasaSpiritVehicles() async {
    
      final response = await http.get(
        Uri.parse(urlSpirit),
      );
      
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final data = jsonBody['photos'];
        print("NASA VEHICLE BODY: ${data}");
        
        List<Photo> nasaVehiclesList = List<Photo>.from(
        data.map((model) => Photo.fromJson(model)));
        nasaSpiritVehicles = nasaVehiclesList;
        return nasaVehiclesList;
      }
      throw NetworkError(response.statusCode.toString(), response.body);
  
  }

    @override
  Future<List<Photo>> getNasaOpportunityVehicles() async {
    if (nasaOpportunityVehicles.isEmpty) {
      final response = await http.get(
        Uri.parse(urlOpportunity),
      );
      
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final data = jsonBody['photos'];
        print("NASA VEHICLE BODY Opportunity: ${data}");
        
        List<Photo> nasaVehiclesList = List<Photo>.from(
        data.map((model) => Photo.fromJson(model)));
        nasaOpportunityVehicles = nasaVehiclesList;
        return nasaVehiclesList;
      }
      throw NetworkError(response.statusCode.toString(), response.body);
    } else {
      return nasaOpportunityVehicles;
    }
  }

     @override
  Future<List<Photo>> getNasaCuriosityVehicles(int page) async {
    if (nasaCuriosityVehicles.isEmpty) {
      final response = await http.get(
        Uri.parse("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=$page&api_key=wIC7cFSNNcJMbmb2fhvkg2QfuuDgNwq3pSOYeGZ7"),
      );
      
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        final data = jsonBody['photos'];
        print("NASA VEHICLE BODY Curiosity: ${data}");
        
        List<Photo> nasaVehiclesList = List<Photo>.from(
        data.map((model) => Photo.fromJson(model)));
        nasaCuriosityVehicles = nasaVehiclesList;
        return nasaVehiclesList;
      }
      throw NetworkError(response.statusCode.toString(), response.body);
    } else {
      return nasaCuriosityVehicles;
    }
  }
  
}
