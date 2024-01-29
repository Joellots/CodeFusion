import 'dart:js_interop';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import '../models/allcomponent_item_model.dart';
import 'package:codefusion/presentation/search_screen/models/search_model.dart';
import 'package:podcast_search/podcast_search.dart' as podcast_search;
part 'search_event.dart';
part 'search_state.dart';

/// A bloc that manages the state of a Search according to the event that is dispatched to it.
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchInitialEvent>(_onInitialize);
    on<SearchInputEvent>(_onSearchInput);
  }

  // Add this method to fill the allcomponentItemList
  List<AllcomponentItemModel> fillAllcomponentItemList() {
    return [
      AllcomponentItemModel(),
      // Add other items as needed
    ];
  }

  List<Map<String, dynamic>> getPodcastList() {
    // Access podcastList and return it
    // Assuming podcastList is a List<Map<String, dynamic>> in your SearchModel
    return state.searchModelObj?.podcastList ?? [];
  }

  _onInitialize(SearchInitialEvent event, Emitter<SearchState> emit,) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
      searchModelObj: state.searchModelObj?.copyWith(
        allcomponentItemList: fillAllcomponentItemList(),
      ),
    ));
  }

  // Handle the new SearchInputEvent
  _onSearchInput(
      SearchInputEvent event,
      Emitter<SearchState> emit,
      ) async {
    try {
      var searchResult = await podcast_search.Search().search(
        event.searchInput,
        country: podcast_search.Country.unitedKingdom,
        limit: 10,
      );

      List<Map<String, dynamic>> podcastList = searchResult.items
          .map(
            (result) =>
        {
          'trackName': result.trackName ?? 'Default Title',
          'artistName': result.artistName ?? 'Default Author',
          'genre': result.genre ?? 'Default Genre',
          'country': result.country ?? 'Default Country',
          'releaseDate': result.releaseDate?.toIso8601String() ??
              'Default Release Date',
          'trackViewUrl': result.trackViewUrl?.toString() ??
              'Default Track View URL',
          'collectionViewUrl': result.collectionViewUrl?.toString() ??
              'Default Collection View URL',
        },
      )
          .toList();

      SearchModel updatedModel = state.searchModelObj?.copyWith(
        searchInput: event.searchInput,
        podcastList: podcastList,
      ) ?? SearchModel(
        searchInput: event.searchInput,
        podcastList: podcastList,
      );
      print(state.searchModelObj.toString());
      emit(state.copyWith(searchModelObj: updatedModel));
    } catch (error) {
      print('Error during podcast search: $error');
    }
  }
}
