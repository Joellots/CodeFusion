import 'package:podcast_search/podcast_search.dart';
import '../../../core/app_export.dart';
import 'package:codefusion/presentation/search_screen/bloc/search_bloc.dart' as BLOC;

class PodcastService {
  static List<Map<String, dynamic>> getPodcastList(BLOC.SearchBloc searchBloc) {
    searchBloc.add(BLOC.SearchInitialEvent());
    return searchBloc.getPodcastList();
  }
}

class AllcomponentItemModel {
  String? kotlinIconsText;
  String? howToPutTheIconsText;
  String? ratingText;
  String? id;

  String? trackName;
  String? artistName;
  String? genre;
  String? country;
  DateTime? releaseDate;
  Uri? trackViewUrl;
  Uri? collectionViewUrl;

  // Default constructor
  AllcomponentItemModel();

  // Named constructor to create an instance of AllcomponentItemModel from a podcast map
  AllcomponentItemModel.fromPodcastMap(Map<String, dynamic> podcast) {
    trackName = podcast['trackName'] ?? 'Default Track';
    artistName = podcast['artistName'] ?? 'Default Artist';
    genre = podcast['genre']?.join(', ') ?? 'Default Genre';
    country = podcast['country'] ?? 'Default Country';
    releaseDate = podcast['releaseDate'] != null ? DateTime.parse(podcast['releaseDate']) : null;
    trackViewUrl = podcast['trackViewUrl'] != null ? Uri.parse(podcast['trackViewUrl']) : null;
    collectionViewUrl = podcast['collectionViewUrl'] != null ? Uri.parse(podcast['collectionViewUrl']) : null;
  }

  // Named constructor to create a list of AllcomponentItemModel instances from a list of podcast maps
  factory AllcomponentItemModel.fromPodcastList(List<Map<String, dynamic>> podcastList) {
    List<AllcomponentItemModel> podcastModels = podcastList
        .map((podcast) => AllcomponentItemModel.fromPodcastMap(podcast))
        .toList();

    return AllcomponentItemModel();
  }

  void dispose() {
    // Dispose logic if needed
  }
}