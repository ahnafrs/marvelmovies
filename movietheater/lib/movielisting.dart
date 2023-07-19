// import 'package:flutter/material.dart';

// class MovieListing extends StatefulWidget {
//   final String email;
//   final String password;

//   const MovieListing({Key? key, required this.email, required this.password})
//       : super(key: key);

//   @override
//   State<MovieListing> createState() => _MovieListingState();
// }

// class _MovieListingState extends State<MovieListing> {
//   List<String> marvelMovies = [
//     'Iron Man',
//     'The Incredible Hulk',
//     'Iron Man 2',
//     'Thor',
//     'Captain America: The First Avenger',
//     'The Avengers',
//     'Iron Man 3',
//     'Thor: The Dark World',
//     'Captain America: The Winter Soldier',
//     'Guardians of the Galaxy',
//     'Avengers: Age of Ultron',
//     'Ant-Man',
//     'Captain America: Civil War',
//     'Doctor Strange',
//     'Guardians of the Galaxy Vol. 2',
//     'Spider-Man: Homecoming',
//     'Thor: Ragnarok',
//     'Black Panther',
//     'Avengers: Infinity War',
//     'Ant-Man and The Wasp',
//     'Captain Marvel',
//     'Avengers: Endgame',
//     'Spider-Man: Far From Home',
//     'Black Widow',
//     'Shang-Chi and the Legend of the Ten Rings',
//     'Eternals',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Marvel Movies'),
//       ),
//       body: Container(
//         color: Colors.amber,
//         child: GridView.builder(
//           padding: const EdgeInsets.all(16.0),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 16.0,
//             crossAxisSpacing: 16.0,
//             childAspectRatio: 0.7,
//           ),
//           itemCount: marvelMovies.length,
//           itemBuilder: (BuildContext context, int index) {
//             String movieTitle = marvelMovies[index];
//             String imageUrl =
//                 'https://placeimg.com/300/450/nature'; // Replace with actual movie images URL

//             return GestureDetector(
//               onTap: () {
//                 // Handle movie selection
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0, 2),
//                       blurRadius: 4.0,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Expanded(
//                       child: ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(8.0),
//                           topRight: Radius.circular(8.0),
//                         ),
//                         child: Image.network(
//                           imageUrl,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         movieTitle,
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'moviedetails.dart';

class Movie {
  final String title;
  final String imageUrl;
  final String details;
  final double rating;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.details,
    required this.rating,
  });
}

class MovieListing extends StatefulWidget {
  const MovieListing(
      {Key? key, required String email, required String password});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  List<Movie> marvelMovies = [
    Movie(
      title: 'Iron Man',
      imageUrl:
          'https://media.comicbook.com/2017/10/iron-man-movie-poster-marvel-cinematic-universe-1038878.jpg', // Replace with actual movie image URL
      details: 'Genius billionaire playboy philanthropist.',
      rating: 7.9,
    ),
    Movie(
      title: 'The Incredible Hulk',
      imageUrl:
          'https://cdn.marvel.com/content/1x/theincrediblehulk_lob_crd_03.jpg', // Replace with actual movie image URL
      details: 'Gamma radiation-induced green monster.',
      rating: 6.7,
    ),
    // Add more movies...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Movies'),
      ),
      body: Container(
        color: Colors.black,
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 0.7,
          ),
          itemCount: marvelMovies.length,
          itemBuilder: (BuildContext context, int index) {
            Movie movie = marvelMovies[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          movie.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetails(movie: movie),
                          ),
                        );
                      },
                      child: const Text('Details'),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Rating: ${movie.rating}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
