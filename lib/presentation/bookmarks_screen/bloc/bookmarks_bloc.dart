import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:codefusion/presentation/bookmarks_screen/models/bookmarks_model.dart';
part 'bookmarks_event.dart';
part 'bookmarks_state.dart';

/// A bloc that manages the state of a Bookmarks according to the event that is dispatched to it.
class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksBloc(BookmarksState initialState) : super(initialState) {
    on<BookmarksInitialEvent>(_onInitialize);
  }

  _onInitialize(
    BookmarksInitialEvent event,
    Emitter<BookmarksState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
  }
}
