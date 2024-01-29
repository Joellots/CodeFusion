// ignore_for_file: must_be_immutable

part of 'comments_bloc.dart';

/// Represents the state of Comments in the application.
class CommentsState extends Equatable {
  CommentsState({
    this.titleTableController,
    this.commentController,
    this.commentsModelObj,
  });

  TextEditingController? titleTableController;

  TextEditingController? commentController;

  CommentsModel? commentsModelObj;

  @override
  List<Object?> get props => [
        titleTableController,
        commentController,
        commentsModelObj,
      ];
  CommentsState copyWith({
    TextEditingController? titleTableController,
    TextEditingController? commentController,
    CommentsModel? commentsModelObj,
  }) {
    return CommentsState(
      titleTableController: titleTableController ?? this.titleTableController,
      commentController: commentController ?? this.commentController,
      commentsModelObj: commentsModelObj ?? this.commentsModelObj,
    );
  }
}
