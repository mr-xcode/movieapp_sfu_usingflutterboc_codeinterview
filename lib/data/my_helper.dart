import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/genre.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';

Future<List<dynamic>> fetchGenres() async {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=19d6149f34738ec93c495cd0527246ae'); // Replace with your API endpoint
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<dynamic> genres = jsonData['genres'];
    List<Genre> genreList =
        genres.map((movieData) => Genre.fromJson(movieData)).toList();
    return genres;
  } else {
    throw Exception('Request failed with status: ${response.statusCode}');
  }
}

Future<List<dynamic>> fetchNowPlaying() async {
  var url = Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1');

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    List<dynamic> results = jsonData['results'];

    List<Movie> moviesList =
        results.map((movieData) => Movie.fromJson(movieData)).toList();
    return moviesList;
  } else {
    throw Exception('Request failed with status: ${response.statusCode}');
  }
}
