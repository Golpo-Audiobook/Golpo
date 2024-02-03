import 'package:flutter/material.dart';
import 'package:golpo/screens/home_page.dart';
import 'package:golpo/screens/more_page.dart';
import 'package:golpo/screens/playlists_page.dart';
import 'package:golpo/screens/user_liked_playlists_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (_) => HomePage(),
  '/search': (_) => PlaylistsPage(),
  '/userPlaylists': (_) => UserLikedPlaylistsPage(),
  /*
  '/search': (_) => SearchPage(),
  '/userPlaylists': (_) => UserPlaylistsPage(),
  */
  '/more': (_) => MorePage(),
};

final destinations = routes.keys.toList();

Route<dynamic> generateRoute(RouteSettings settings) {
  final builder = routes[settings.name] ??
      (_) => throw Exception('Invalid route: ${settings.name}');
  return MaterialPageRoute(builder: builder);
}
