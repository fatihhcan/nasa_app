
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/url_constant.dart';
import '../model/nasa_vehicle_model.dart';

List<Photo> nasaCuriosityVehicless = [];
getImagesPagination( int page)async{
   final response = await http.get(
      Uri.parse(
          "${UrlConstant.BASE_URL}/api/v1/rovers/curiosity/photos?sol=$page&api_key=${UrlConstant.API_KEY}"),
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final data = jsonBody['photos'];
      print("NASA VEHICLE BODY Curiosity: ${data}");

      List<Photo> nasaVehiclesList =
          List<Photo>.from(data.map((model) => Photo.fromJson(model)));
      nasaCuriosityVehicless = nasaVehiclesList;
    }

}