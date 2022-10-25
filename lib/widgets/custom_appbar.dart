import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/search_delegate.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    const url =
        "https://www.edigitalagency.com.au/wp-content/uploads/Netflix-logo-red-black-png.png";
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.08,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, size: 32, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.all(3.0),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(url),
              ),
            ),
            IconButton(
              onPressed: () => showSearch(
                context: context,
                delegate: SearchMovies(),
              ),
              icon: const Icon(Icons.search, size: 32, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
