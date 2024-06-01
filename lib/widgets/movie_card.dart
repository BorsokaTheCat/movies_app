import 'package:flutter/material.dart';
import '../screens/movie_details_screen.dart';
import '../models/movie.dart'; // Import your Movie class

class MovieCard extends StatelessWidget {
  final Movie movie; // Change the parameter to a Movie object

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
              title: movie.title,
              overview: movie.overview,
              posterPath: movie.posterPath,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: 150, // Adjust height as needed
              margin: EdgeInsets.only(top: 15), // Adjust margin to accommodate image
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
                  SizedBox(width: 100 + 16.0), // Adjust width to accommodate image width and padding
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0), // Adjust vertical padding here
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 18, // Adjust title font size here
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4D4D4D),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row( // Add row here
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 16), // Yellow star icon or emoji
                              SizedBox(width: 4), // Add spacing
                              Text(
                                movie.voteAverage.toString(),
                                style: TextStyle(
                                  fontSize: 14, // Smaller font size
                                  color: Colors.yellow, // Yellow color
                                ),
                              ), // Text next to the star icon
                              SizedBox(width: 8), // Add more spacing
                              Icon(Icons.favorite, color: Colors.red, size: 16), // Red heart icon or emoji
                              SizedBox(width: 4), // Add spacing
                              Text(
                                movie.popularity.toString(),
                                style: TextStyle(
                                  fontSize: 14, // Smaller font size
                                  color: Colors.red, // Red color
                                ),
                              ), // Text next to the heart icon
                            ],
                          ),

                          SizedBox(height: 4), // Smaller bottom padding
                          Text(
                            movie.overview,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400], // Lighter grey color
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
                  width: 100, // Adjust width as needed
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
