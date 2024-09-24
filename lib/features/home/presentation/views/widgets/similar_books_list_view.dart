import 'package:book_verse/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: CustomBookImage(imageUrl: 'https://t4.ftcdn.net/jpg/01/10/04/51/360_F_110045173_QgmA3gg5OwTlLNQBqmPdFnkh6sPvsvt8.jpg',),
        ),
      ),
    );
  }
}
