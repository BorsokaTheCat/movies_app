import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MovieCard(
              movie: Movie(
                  adult: false,
                  backdropPath: "/g2QDxkiMFtYcpnXbmLp3ywhNUBZ.jpg",
                  genreIds: [
                    28,
                    12,
                    878,
                    10749
                  ],
                  id: 786892,
                  originalLanguage: "en",
                  originalTitle: "Furiosa: A Mad Max Saga",
                  overview:"As the world fell, young Fu",
                  popularity:1073.275,
                  posterPath:"/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
                  releaseDate:"2024-05-22",
                  title:"Furiosa: A Mad Max Saga",
                  video:false,
                  voteAverage:  5197.722,
                  voteCount: 519

              )
            ),
            MovieCard(
                movie: Movie(
                    adult: false,
                    backdropPath: "/g2QDxkiMFtYcpnXbmLp3ywhNUBZ.jpg",
                    genreIds: [
                      28,
                      12,
                      878,
                      10749
                    ],
                    id: 786892,
                    originalLanguage: "en",
                    originalTitle: "Furiosa: A Mad Max Saga",
                    overview:"As the world fell, young Fu",
                    popularity:1073.275,
                    posterPath:"/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
                    releaseDate:"2024-05-22",
                    title:"Furiosa: A Mad Max Saga",
                    video:false,
                    voteAverage:  5197.722,
                    voteCount: 519

                )
            ),
            // Add more MovieCards here as needed
          ],
        ),
      ),
    );
  }
}
