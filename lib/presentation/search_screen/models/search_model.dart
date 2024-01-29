// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'allcomponent_item_model.dart';

/// This class defines the variables used in the [search_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SearchModel extends Equatable {
  SearchModel({
    this.allcomponentItemList = const [],
    this.searchInput = '',
    this.podcastList = const [],
  });

  List<AllcomponentItemModel> allcomponentItemList;
  String searchInput;
  List<Map<String, dynamic>> podcastList;

  SearchModel copyWith({
    List<AllcomponentItemModel>? allcomponentItemList,
    String? searchInput,
    List<Map<String, dynamic>>? podcastList,
  }) {
    return SearchModel(
      allcomponentItemList: allcomponentItemList ?? this.allcomponentItemList,
      searchInput: searchInput ?? this.searchInput,
      podcastList: podcastList ?? this.podcastList,
    );
  }

  @override
  List<Object?> get props => [allcomponentItemList, searchInput, podcastList];
}