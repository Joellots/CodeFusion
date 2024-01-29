// ignore_for_file: must_be_immutable

part of 'bookmarks_bloc.dart';

/// Represents the state of Bookmarks in the application.
class BookmarksState extends Equatable {
  BookmarksState({
    this.searchController,
    this.bookmarksModelObj,
  });

  TextEditingController? searchController;

  BookmarksModel? bookmarksModelObj;

  @override
  List<Object?> get props => [
        searchController,
        bookmarksModelObj,
      ];
  BookmarksState copyWith({
    TextEditingController? searchController,
    BookmarksModel? bookmarksModelObj,
  }) {
    return BookmarksState(
      searchController: searchController ?? this.searchController,
      bookmarksModelObj: bookmarksModelObj ?? this.bookmarksModelObj,
    );
  }
}
