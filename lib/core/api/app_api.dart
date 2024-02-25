import 'dart:convert';

import 'package:clean_architecture_example/features/list_example_clean_arch/data/models/character_response_model.dart';
import 'package:http/http.dart' as http;

class AppApi {

/*
 *Fetch list api data
 * */  
Future<List<CharacterResponseModel>> loadCharacters({ int page = 0}) async{
   final response = await http
      .get(Uri.parse('https://rickandmortyapi.com/api/character/?page=1')); 

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseBody = jsonDecode(response.body);
    //final dataList = responseBody.map((dynamic item) => CharacterResponseModel.fromJson(item));
    final dataList = (responseBody['results'] as List).map((e) => CharacterResponseModel.fromJson(e)).toList();
    //  final l = (response['results'] as List)
    //       .map((e) => CharacterDto.fromMap(e))
    //       .toList();
    return dataList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
}