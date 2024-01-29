// ignore_for_file: must_be_immutable

part of 'bookmarks_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Bookmarks widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class BookmarksEvent extends Equatable {}

/// Event that is dispatched when the Bookmarks widget is first created.
class BookmarksInitialEvent extends BookmarksEvent {
  @override
  List<Object?> get props => [];
}
