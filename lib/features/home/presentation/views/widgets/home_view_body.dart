import 'package:book_verse/core/utils/styles.dart';
import 'package:book_verse/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:book_verse/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(height: 50,),
        Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Text(
            'Best Seller',
            style: Styles.titleMedium,
          ),
        ),
      ],
    );
  }
}
