import 'package:flutter/material.dart';
import 'package:movies_app/utils/constants.dart';
import '../models/language.dart';
import '../models/movie.dart';
import '../services/api_services.dart';
import '../services/movie_service.dart';
import '../widgets/language_chooser_dialog.dart';
import '../widgets/movie_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
    final movies = await _apiService.getNowPlayingMovies(language: language ?? 'en-US');
    setState(() {
      _movies = movies;
      _filteredMovies = movies;
    });
  }


  void _filterMovies(String query) {
    setState(() {
      _filteredMovies = _movieService.filterMovies(_movies, query);
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

              //The API did not provide appropriate data, so I mock the functionality.  :(
              _fetchMovies(language: "fr-FR");
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => _showLanguageChooser(context),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.medium),
            child: TextField(
              controller: _searchController,
              onChanged: _filterMovies,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: AppColors.hintTextColor),
                prefixIcon: Icon(Icons.search, color: AppColors.hintTextColor),
                filled: true,
                fillColor: AppColors.lightGray,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide.none,
                ),
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
        ? const Center(child: CircularProgressIndicator())
        : Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _filteredMovies.map((movie) {
        return MovieCard(
          movie: movie,
        );
      }).toList(),
    );
  }
}
