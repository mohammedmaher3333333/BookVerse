import 'package:book_verse/constant.dart';
import 'package:book_verse/core/utils/app_router.dart';
import 'package:book_verse/core/widgets/custom_error_widget.dart';
import 'package:book_verse/core/widgets/custom_loading_indicator.dart';
import 'package:book_verse/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_verse/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              kNoBookCover,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
