import 'package:acm_app/movielist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List trendingMovies = [];
  final String apiKey = 'b1a89d4291a3075fcb9ab85028b26f0c';
  final String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMWE4OWQ0MjkxYTMwNzVmY2I5YWI4NTAyOGIyNmYwYyIsInN1YiI6IjY0Zjk1ZTYxOGUyMGM1MGNkNjJhYWRlMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._hHe07ZZpzAJxM28vhtBfklfFsJ_sgdcRwu5_KydVBg';

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    TMDB tbmdWithCustomLogs = TMDB(ApiKeys(apiKey, apiToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map result = await tbmdWithCustomLogs.v3.trending.getTrending();

    setState(() {
      trendingMovies = result['results'];
    });

    print(trendingMovies);
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Trending Movies"),
          backgroundColor: const Color.fromARGB(255, 185, 134, 240),
          actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
        ),
        backgroundColor: const Color.fromARGB(255, 226, 212, 240),
        body: ListView(children: [MovieList(movieList: trendingMovies)]),
      ),
    );
  }
}
