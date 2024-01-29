import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userreview_item_model.dart';
import 'package:codefusion/presentation/comments_screen/models/comments_model.dart';
part 'comments_event.dart';
part 'comments_state.dart';

/// A bloc that manages the state of a Comments according to the event that is dispatched to it.
class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc(CommentsState initialState) : super(initialState) {
    on<CommentsInitialEvent>(_onInitialize);
  }

  List<UserreviewItemModel> fillUserreviewItemList() {
    return [
      UserreviewItemModel(userName: "John Smith"),
      UserreviewItemModel(userName: "Lola Bilecco"),
      UserreviewItemModel(userName: "Anna Trate")
    ];
  }

  _onInitialize(
    CommentsInitialEvent event,
    Emitter<CommentsState> emit,
  ) async {
    emit(state.copyWith(
        titleTableController: TextEditingController(),
        commentController: TextEditingController()));
    emit(state.copyWith(
        commentsModelObj: state.commentsModelObj
            ?.copyWith(userreviewItemList: fillUserreviewItemList())));
  }
}
