import 'package:flutter/material.dart';
import 'package:codefusion/presentation/search_screen/search_screen.dart';
import 'package:codefusion/presentation/bookmarks_screen/bookmarks_screen.dart';
import 'package:codefusion/presentation/comments_screen/comments_screen.dart';
import 'package:codefusion/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginPage = '/login_page';

  static const String searchScreen = '/search_screen';

  static const String bookmarksScreen = '/bookmarks_screen';

  static const String commentsScreen = '/comments_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        searchScreen: SearchScreen.builder,
        bookmarksScreen: BookmarksScreen.builder,
        commentsScreen: CommentsScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SearchScreen.builder
      };
}
