import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:golpo/API/musify.dart';
//import 'package:golpo/extensions/l10n.dart';
import 'package:golpo/screens/playlist_page.dart';
import 'package:golpo/style/app_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaylistSlider extends StatelessWidget {
  final String? id;
  final dynamic playlistData;
  final dynamic image;
  final String title;
  final bool onClickOpen;
  final bool showFavoriteButton;
  final IconData cubeIcon;
  final double sizea;
  final double sizeb;
  final double zoomNumber;
  final bool? isAlbum;
  final String? link; // New property for the link

  final likeStatusToIconMapper = {
    true: FluentIcons.heart_16_filled,
    false: FluentIcons.heart_16_regular,
  };

  late final playlistLikeStatus =
      ValueNotifier<bool>(isPlaylistAlreadyLiked(id));

  // ignore: sort_constructors_first
  PlaylistSlider({
    this.id,
    this.playlistData,
    this.image,
    required this.title,
    this.onClickOpen = true,
    this.showFavoriteButton = true,
    this.cubeIcon = FluentIcons.music_note_1_24_regular,
    this.sizea = 220,
    this.sizeb = 330,
    this.zoomNumber = 0,
    this.isAlbum = false,
    this.link, // Added link property
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (onClickOpen && (id != null || playlistData != null)) {
              if (link != null) {
                launchLink(link!);
              } else {
                navigateToPlaylistPage(context);
              }
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: image != null
                ? CachedNetworkImage(
                    key: Key(image.toString()),
                    height: sizea,
                    width: sizeb,
                    imageUrl: image.toString(),
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => noImageCube(),
                  )
                : noImageCube(),
          ),
        ),
      ],
    );
  }

  void navigateToPlaylistPage(BuildContext context) {
    if (id != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlaylistPage(playlistId: id),
        ),
      );
    } else if (playlistData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlaylistPage(playlistData: playlistData),
        ),
      );
    }
  }

  void launchLink(String link) async {
    // ignore: deprecated_member_use
    if (await canLaunch(link)) {
      // ignore: deprecated_member_use
      await launch(link);
    } else {
      // ignore: avoid_print
      print('Error launching link: $link');
    }
  }

  Widget noImageCube() {
    return Container(
      height: sizea,
      width: sizeb,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorScheme.secondary,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              cubeIcon,
              size: 15,
              color: colorScheme.surface,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
