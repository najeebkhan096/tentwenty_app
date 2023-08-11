import 'dart:convert';

import 'package:tentwenty/modal/genre.dart';
import 'package:tentwenty/modal/movie.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<Movie>> fetchMovies() async {
    final response = await http.post(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=97f155a86d48c865833f69578c7878a1'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['results'];
      return jsonData.map((item) => Movie.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Genre>> fetchGenres() async {


    final url = Uri.parse('https://api.themoviedb.org/3/genre/movie/list?language=en');
    final headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5N2YxNTVhODZkNDhjODY1ODMzZjY5NTc4Yzc4NzhhMSIsInN1YiI6IjY0ZDM1MTNkZDEwMGI2MDBjNWNmMDYxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Wlbt4caywTz76iJhgCotrBpBeVDropuTcfIsTtoSbtQ',
      'accept': 'application/json',
    };
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['genres'];
      return jsonData.map((item) => Genre.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
Future<String?> getTrailerURL({required int ? movieid})async{
    String trailerUrl='';
  const apiKey = '97f155a86d48c865833f69578c7878a1'; // Replace with your TMDb API key


  final url = Uri.https(
    'api.themoviedb.org',
    '/3/movie/$movieid/videos',
    {'api_key': apiKey},
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final trailers = data['results'];

    for (var trailer in trailers) {
      final type = trailer['type'];
      final site = trailer['site'];

      // Filter for trailers of type 'Trailer' and site 'YouTube'
      if (type == 'Trailer' && site == 'YouTube') {
        final key = trailer['key'];
        // final youtubeUrl = 'https://www.youtube.com/watch?v=$key';
        trailerUrl=key;
        return trailerUrl;
        // print('YouTube Official Trailer URL: $youtubeUrl');
      }
    }
  } else {

  }
  return trailerUrl;
}





}








ApiService api_request=ApiService();