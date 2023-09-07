import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List movieList;

  const MovieList({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Text(
            "Movies You Must Watch",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.movie_creation_rounded,
            size: 40,
          )
        ]),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 800,
          child: ListView.builder(
              itemCount: movieList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 450,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${movieList[index]['poster_path']}"))),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            movieList[index]['name'] ??
                                movieList[index]['title'],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(
                          movieList[index]['overview'] ?? 'loading',
                          textAlign: TextAlign.center,
                        ),
                        // ignore: prefer_interpolation_to_compose_strings
                        Text("Original Language : " +
                            movieList[index]['original_language']),
                        Text(
                          "Rating : ${movieList[index]['vote_average']}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Country : ${movieList[index]['origin_country']}",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
