import 'package:flutter/material.dart';
import '../screens/movie_details_screen.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 150,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF1F1F1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 100 + 16.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4D4D4D),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row( // Add row here
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 16),
                              SizedBox(width: 4),
                              Text(
                                movie.voteAverage.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.favorite, color: Colors.red, size: 16),
                              SizedBox(width: 4),
                              Text(
                                movie.popularity.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 4),
                          Text(
                            movie.overview,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
