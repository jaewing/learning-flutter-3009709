import 'dart:convert';
import 'dart:io';

import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<GirlImage>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse('https://gist.githubusercontent.com/hiteshsahu/f58bcca95532fde77fd0d9e94a9c3148/raw/4ef7b30240c781341f1994f12453e9e7a5c2c67d/GirlImages.json');

      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final Map<String,dynamic> decodedResponse = jsonDecode(response.body) as Map<String,dynamic>;
        final List<dynamic> decodedList = decodedResponse['GirlImages'] as List;

        final List<GirlImage> _imageList = decodedList.map((listItem) {
          return GirlImage.fromJson(listItem);
        }).toList();

        print(_imageList[0].imageUrl);
        return _imageList;
      } else {
        throw Exception('API not successful!');
      }
    } on SocketException {
      throw Exception('No internet connection :(');
    } on HttpException {
      throw Exception('Couldnt retrieve the images! Sorry!');
    } on FormatException {
      throw Exception('Bad response format!');
    } catch (e) {
      print(e);
      throw Exception('Unknown error');
    }
  }
}
