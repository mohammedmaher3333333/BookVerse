import 'package:bloc/bloc.dart';
import 'package:book_verse/features/home/data/models/book_model/book_model.dart';
import 'package:meta/meta.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit() : super(NewsetBooksInitial());
}
