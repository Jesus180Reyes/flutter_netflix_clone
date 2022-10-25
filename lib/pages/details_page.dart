import 'package:flutter/material.dart';
import 'package:netflix_clone/themes/apptheme.dart';
import 'package:netflix_clone/widgets/header_text.dart';

import '../widgets/details/bannerdetails.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    //! final movieName =
    // !    (ModalRoute.of(context)!.settings.arguments as Map)["name"].toString();
    final movie = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BannerDescription(movie: movie),
            TitleDetails(movie: movie),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const HeaderText(fontSize: 25, title: "Overview"),
            ),
            DescriptionDetails(movie: movie),
          ],
        ),
      ),
    );
  }
}
