import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/language.dart';
import '../models/movie.dart';
import '../providers/languages_provider.dart';
import '../services/api_services.dart';
import '../services/movie_service.dart';
import '../widgets/language_chooser_dialog.dart';
import '../widgets/movie_card.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ApiService _apiService = ApiService();
  final MovieService _movieService = MovieService(); // New instance of MovieService
  late List<Movie> _movies = [];
  late List<Movie> _filteredMovies = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchMovies({String? language}) async {
    print(language ?? 'en-US');
    final movies = await _apiService.getNowPlayingMovies(language: language ?? 'en-US');
    setState(() {
      _movies = movies;
      _filteredMovies = movies;
    });
  }


  void _filterMovies(String query) {
    setState(() {
      _filteredMovies = _movieService.filterMovies(_movies, query); // Using MovieService to filter movies
    });
  }


  @override
  Widget build(BuildContext context) {

    void _showLanguageChooser(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LanguageChooserDialog(
            onLanguageSelected: (Language selectedLanguage) {
              // Handle the selected language here

              //api gives wrong data, so i moc the functionality  :(
              _fetchMovies(language: "fr-FR");
            },
          ); // Use the LanguageChooserDialog widget
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () => _showLanguageChooser(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterMovies,
              decoration: InputDecoration(
                labelText: 'Search Movies',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          _buildMovieList(),
        ],
      ),
    );
  }

  Widget _buildMovieList() {
    return _filteredMovies.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _filteredMovies.map((movie) {
        return MovieCard(
          title: movie.title,
          overview: movie.overview,
          posterPath: movie.posterPath,
        );
      }).toList(),
    );
  }
}
