import 'package:flutter/material.dart';
import 'package:golpo/API/musify.dart';
import 'package:golpo/extensions/l10n.dart';
import 'package:golpo/style/app_themes.dart';
import 'package:golpo/widgets/song_bar.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n!.recentlyPlayed,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: userRecentlyPlayedLength,
        builder: (_, value, __) => userRecentlyPlayed.isEmpty
            ? Center(
                child: Text(
                  context.l10n!.noPlayedPlaylists,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: userRecentlyPlayed.length,
                itemBuilder: (BuildContext context, int index) {
                  return SongBar(
                    userRecentlyPlayed[index],
                    true,
                  );
                },
              ),
      ),
    );
  }
}
