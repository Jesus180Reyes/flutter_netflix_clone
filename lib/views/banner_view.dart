import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';

import '../widgets/header_text.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        // * Header Text
        const HeaderText(title: "Populares en Netflix"),
        // * Banner Images
        Container(
          height: size.height * 0.3,
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(10),
          child: const _BannerImages(),
        ),
        // * Trending Articles
        const HeaderText(title: "Tendencias", marginTop: 20),
        Container(
          margin: const EdgeInsets.only(top: 12, right: 5, left: 5),
          padding: const EdgeInsets.all(5),
          height: size.height - 540,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingMovies.length,
            itemBuilder: (_, int index) => _MovieSlices(
              heroTag: trendingMovies[index]["id"],
              index: index,
              movies: trendingMovies,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "details",
                  arguments: {
                    ...trendingMovies[index],
                    "name": trendingMovies[index]["name"],
                    "id": trendingMovies[index]["id"],
                    "img": trendingMovies[index]["img"],
                    "description": trendingMovies[index]["description"],
                  },
                );
              },
            ),
          ),
        ),
        const HeaderText(title: "Continuar Viendo", marginTop: 20),
        Container(
          margin: const EdgeInsets.only(top: 12, right: 5, left: 5),
          padding: const EdgeInsets.all(5),
          height: size.height - 540,
          width: size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: continueWatching.length,
            itemBuilder: (_, int index) => _MovieSlices(
              heroTag: continueWatching[index]["id"],
              index: index,
              movies: continueWatching,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "details",
                  arguments: {
                    "name": continueWatching[index]["name"],
                    "id": continueWatching[index]["id"],
                    "img": continueWatching[index]["img"],
                    "description": continueWatching[index]["description"],
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieSlices extends StatelessWidget {
  final int index;
  final List movies;
  final Function onPressed;
  final String heroTag;
  const _MovieSlices({
    Key? key,
    required this.index,
    required this.movies,
    required this.onPressed,
    required this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Hero(
        tag: heroTag,
        child: GestureDetector(
          onTap: () {
            // ignore: unnecessary_null_comparison
            if (onPressed == null) return;

            onPressed();
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10, left: 5),
            // color: Colors.red,
            height: 250,
            width: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  movies[index]["img"],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerImages extends StatelessWidget {
  const _BannerImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 1, viewportFraction: 0.9);
    final size = MediaQuery.of(context).size;

    return PageView.builder(
      controller: controller,
      itemCount: bannerMovies.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInRight(
              from: 80,
              child: Container(
                width: 300,
                height: size.height - 160,
                margin: const EdgeInsets.only(right: 10),
                // color: Colors.green,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(bannerMovies[index]["img"].toString()),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
