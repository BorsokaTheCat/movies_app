import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/movie.dart';
import '../models/language.dart';

class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzBjYzg4YmMwMTY4YzRlNWE5Mzg1NzgzZWI5ZmUzZiIsInN1YiI6IjYzYWZlZThmNTc1MzBlMDA4NTAxMjdkMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wrRM0IPSBjbFO-CcvxU5GsyuHeatUlZlpgV5d3TANLw';

  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/discover/movie?language=en-US&page=1'),
      headers: {'Authorization': 'Bearer $apiKey', 'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<dynamic> results = jsonBody['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<List<Language>> getSupportedLanguages() async {
    final response = await http.get(
      Uri.parse('$baseUrl/configuration/languages'),
      headers: {'Authorization': 'Bearer $apiKey', 'accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Language.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load supported languages');
    }
  }
}
