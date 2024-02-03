import 'package:flutter/material.dart';
import 'package:golpo/API/musify.dart';
import 'package:golpo/extensions/l10n.dart';
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
      body: ListView.builder(
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
    );
  }
}
