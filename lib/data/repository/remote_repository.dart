import 'dart:convert';

import 'package:simple_http/data/model/album.dart';
import 'package:http/http.dart' as http;

class RemoteRepository {
  Future<List<Album>> fetchAlbumAPI() async {
    final baseUrl = "https://jsonplaceholder.typicode.com/albums";
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      print(response.body);
      Iterable it = jsonDecode(response.body);
      List<Album> listResult = it.map((e) => Album.fromJson(e)).toList();
      return listResult;
    } else {
      throw Exception('Error fetching data album');
    }
  }
}
