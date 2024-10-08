import 'package:book_verse/core/utils/service_locator.dart';
import 'package:book_verse/features/home/data/models/book_model/book_model.dart';
import 'package:book_verse/features/home/data/repos/home_repo_impl.dart';
import 'package:book_verse/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_verse/features/home/presentation/views/book_details_view.dart';
import 'package:book_verse/features/home/presentation/views/home_view.dart';
import 'package:book_verse/features/search/data/repos/search_repo_impl.dart';
import 'package:book_verse/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:book_verse/features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/SearchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>())..fetchSearchBooks(),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
