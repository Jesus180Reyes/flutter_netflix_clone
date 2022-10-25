import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';

class SearchMovies extends SearchDelegate {
  SearchMovies()
      : super(
          searchFieldLabel: 'Buscar Peliculas o Series',
        );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.cancel)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (var movie in trendingMovies) {
      if (movie.toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movie);
      }
    }
    if (matchQuery.isEmpty) return noData(context);
    return ListView.builder(
      itemCount: matchQuery.length,
      padding: const EdgeInsets.only(bottom: 10),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              "details",
              arguments: {
                "id": matchQuery[index]["id"],
                "name": matchQuery[index]["name"],
                "img": matchQuery[index]["img"],
                "description": matchQuery[index]["description"],
              },
            );
          },
          title: Text(
            matchQuery[index]["name"],
            style: const TextStyle(color: Colors.white),
          ),
          leading: Image(
            image: NetworkImage(matchQuery[index]["img"]),
            height: 500,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var movie in trendingMovies) {
      if (movie.toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movie);
      }
    }
    if (query.isEmpty) return noData(context);
    if (matchQuery.isEmpty) return noData(context);
    return ListView.builder(
      itemCount: matchQuery.length,
      padding: const EdgeInsets.only(bottom: 10),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                "details",
                arguments: {
                  "id": matchQuery[index]["id"],
                  "name": matchQuery[index]["name"],
                  "img": matchQuery[index]["img"],
                  "description": matchQuery[index]["description"],
                },
              );
            },
            title: Text(
              matchQuery[index]["name"],
              style: const TextStyle(color: Colors.white),
            ),
            leading: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                matchQuery[index]["img"],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget noData(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.movie_creation, size: 80, color: Colors.white),
          Text(
            "No hay Argumentos encontrados",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
