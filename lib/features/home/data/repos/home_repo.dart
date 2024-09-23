import 'package:book_verse/core/errors/failures.dart';
import 'package:book_verse/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();

  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
}
