// movie_service.dart
import '../models/movie.dart';

class MovieService {
  List<Movie> filterMovies(List<Movie> movies, String query) {
    return movies
        .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
