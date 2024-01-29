import '../../../core/app_export.dart';

/// This class is used in the [userreview_item_widget] screen.
class UserreviewItemModel {
  UserreviewItemModel({
    this.userName,
    this.id,
  }) {
    userName = userName ?? "John Smith";
    id = id ?? "";
  }

  String? userName;

  String? id;
}
