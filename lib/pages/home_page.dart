import 'package:flutter/material.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/pages/loading_page.dart';
import 'package:netflix_clone/views/banner_view.dart';
import 'package:netflix_clone/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (trendingMovies.isEmpty) {
      return const LoadingPage();
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CustomAppbar(),
              BannerView(),
            ],
          ),
        ),
      ),
    );
  }
}
