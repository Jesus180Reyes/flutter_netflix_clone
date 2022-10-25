import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BannerDescription extends StatelessWidget {
  const BannerDescription({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Map movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Hero(
          tag: movie["id"],
          child: Container(
            decoration: const BoxDecoration(),
            width: size.width,
            height: size.height * 0.6,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(movie["img"]),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.black26,
                Colors.black.withOpacity(0.1),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          width: size.width,
          height: size.height * 0.6,
        ),
        SafeArea(
          child: Container(
            width: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 2)),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                size: 25,
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DescriptionDetails extends StatelessWidget {
  final Map movie;
  const DescriptionDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        movie["description"].toString(),
        textAlign: TextAlign.justify,
        style: const TextStyle(
          height: 1.5,
          letterSpacing: 0.3,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

class TitleDetails extends StatelessWidget {
  const TitleDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Map movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      width: size.width - 20,
      child: FadeIn(
        child: Text(
          movie["name"],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
