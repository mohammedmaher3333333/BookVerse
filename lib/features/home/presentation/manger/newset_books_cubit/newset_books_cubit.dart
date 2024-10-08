import 'package:book_verse/features/home/data/models/book_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewSetBooks();
    result.fold(
      (failure) => emit(NewsetBooksFailure(failure.errMessage)),
      (books) => emit(NewsetBooksSuccess(books)),
    );
  }
}
