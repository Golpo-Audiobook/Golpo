import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:golpo/API/musify.dart';
import 'package:golpo/extensions/l10n.dart';
import 'package:golpo/extensions/screen_size.dart';
import 'package:golpo/main.dart';
import 'package:golpo/screens/playlists_page.dart';
import 'package:golpo/services/update_manager.dart';
import 'package:golpo/style/app_themes.dart';
import 'package:golpo/widgets/catagory_circle.dart';
import 'package:golpo/widgets/custom_search_bar.dart';
import 'package:golpo/widgets/marque.dart';
import 'package:golpo/widgets/playlist_cube.dart';
import 'package:golpo/widgets/playlist_slider.dart';
import 'package:golpo/widgets/song_bar.dart';
import 'package:golpo/widgets/spinner.dart';
import 'package:golpo/widgets/topten.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchBar = TextEditingController();

  Future<void> search() async {
    setState(() {});
  }

  @override
  void dispose() {
    _searchBar.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (!isFdroidBuild) {
      checkAppUpdates(context);
      checkNecessaryPermissions(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        
      ), */
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /* CustomSearchBar(
              onSubmitted: (String value) {
                search();
              },
              controller: _searchBar,
              //focusNode: _inputNode,
              labelText: '${context.l10n!.search}...',
            ), */
            _buildPlaylistSlider(),
            //_buildSuggestedCatagory(),
            _buildTopTenplaylist(),
            _buildMostPlayed(),
            _buildSuggestedPlaylists(),
            _buildRecommendedSongsAndArtists(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedPlaylists() {
    return FutureBuilder(
      future: getPlaylists(playlistsNum: 10),
      builder: _buildSuggestedPlaylistsWidget,
    );
  }

  Widget _buildSuggestedPlaylistsWidget(
    BuildContext context,
    AsyncSnapshot<List<dynamic>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoadingWidget();
    } else if (snapshot.hasError) {
      logger.log(
        'Error in _buildSuggestedPlaylistsWidget',
        snapshot.error,
        snapshot.stackTrace,
      );
      return _buildErrorWidget(context);
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const SizedBox.shrink();
    }

    final _suggestedPlaylists = snapshot.data!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenSize.width / 1.4,
                child: MarqueeWidget(
                  child: Text(
                    context.l10n!.suggestedPlaylists,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              /*
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistsPage(),
                    ),
                  );
                },
                icon: Icon(
                  FluentIcons.more_horizontal_24_regular,
                  color: colorScheme.primary,
                ),
              ), 
              */
            ],
          ),
        ),
        SizedBox(
          height: context.screenSize.height * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemCount: _suggestedPlaylists.length,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final playlist = _suggestedPlaylists[index];
              return PlaylistCube(
                id: playlist['ytid'],
                image: playlist['image'].toString(),
                title: playlist['title'].toString(),
                isAlbum: playlist['isAlbum'],
                size: context.screenSize.height * 0.15,
              );
            },
          ),
        ),
      ],
    );
  }

//catagory

  Widget _buildSuggestedCatagory() {
    return FutureBuilder(
      future: getAllcatagory(playlistsNum: 10),
      builder: _buildSuggestedCatagoryWidget,
    );
  }

  Widget _buildSuggestedCatagoryWidget(
    BuildContext context,
    AsyncSnapshot<List<dynamic>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoadingWidget();
    } else if (snapshot.hasError) {
      logger.log(
        'Error in _buildSuggestedCatagoryWidget',
        snapshot.error,
        snapshot.stackTrace,
      );
      return _buildErrorWidget(context);
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const SizedBox.shrink();
    }

    final _suggestedCatagory = snapshot.data!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenSize.width / 1.4,
                child: MarqueeWidget(
                  child: Text(
                    context.l10n!.allCatagory,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistsPage(),
                    ),
                  );
                },
                icon: Icon(
                  FluentIcons.more_horizontal_24_regular,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.screenSize.height * 0.10,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemCount: _suggestedCatagory.length,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final playlist = _suggestedCatagory[index];
              return CatagoryCircle(
                id: playlist['ytid'],
                image: playlist['image'].toString(),
                title: playlist['title'].toString(),
                isAlbum: playlist['isAlbum'],
                size: context.screenSize.height * 0.10,
              );
            },
          ),
        ),
      ],
    );
  }

//Most Played

  Widget _buildMostPlayed() {
    return FutureBuilder(
      future: getmostPlayed(playlistsNum: 10),
      builder: _buildMostPlayedWidget,
    );
  }

  Widget _buildMostPlayedWidget(
    BuildContext context,
    AsyncSnapshot<List<dynamic>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoadingWidget();
    } else if (snapshot.hasError) {
      logger.log(
        'Error in _buildMostPlayedWidget',
        snapshot.error,
        snapshot.stackTrace,
      );
      return _buildErrorWidget(context);
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const SizedBox.shrink();
    }

    final _mostPlayed = snapshot.data!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenSize.width / 1.4,
                child: MarqueeWidget(
                  child: Text(
                    context.l10n!.mostPlayed,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              /*
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistsPage(),
                    ),
                  );
                },
                icon: Icon(
                  FluentIcons.more_horizontal_24_regular,
                  color: colorScheme.primary,
                ),
              ), 
              */
            ],
          ),
        ),
        SizedBox(
          height: context.screenSize.height * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemCount: _mostPlayed.length,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final playlist = _mostPlayed[index];
              return CatagoryCircle(
                id: playlist['ytid'],
                image: playlist['image'].toString(),
                title: playlist['title'].toString(),
                isAlbum: playlist['isAlbum'],
                size: context.screenSize.height * 0.15,
              );
            },
          ),
        ),
      ],
    );
  }

//

//Slider

  Widget _buildPlaylistSlider() {
    return FutureBuilder(
      future: getslider(playlistsNum: 5),
      builder: _buildPlaylistSliderWidget,
    );
  }

  Widget _buildPlaylistSliderWidget(
    BuildContext context,
    AsyncSnapshot<List<dynamic>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoadingWidget();
    } else if (snapshot.hasError) {
      logger.log(
        'Error in _buildPlaylistSliderWidget',
        snapshot.error,
        snapshot.stackTrace,
      );
      return _buildErrorWidget(context);
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const SizedBox.shrink();
    }

    final _playlistSlider = snapshot.data!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: prefer_const_constructors
        Padding(
          padding: const EdgeInsets.all(20),
          // ignore: prefer_const_constructors
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        SizedBox(
          height: context.screenSize.height * 0.25,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemCount: _playlistSlider.length,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final playlist = _playlistSlider[index];
              return PlaylistSlider(
                id: playlist['ytid'],
                image: playlist['image'].toString(),
                title: playlist['title'].toString(),
                isAlbum: playlist['isAlbum'],
                link: playlist['link'], // Pass the link if available
                sizea: context.screenSize.height * 0.25,
              );
            },
          ),
        ),
      ],
    );
  }

//
// Top 10

  Widget _buildTopTenplaylist() {
    return FutureBuilder(
      future: getTopTen(playlistsNum: 10),
      builder: _buildTopTenplaylistWidget,
    );
  }

  Widget _buildTopTenplaylistWidget(
    BuildContext context,
    AsyncSnapshot<List<dynamic>> snapshot,
  ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoadingWidget();
    } else if (snapshot.hasError) {
      logger.log(
        'Error in _buildTopTenplaylistWidget',
        snapshot.error,
        snapshot.stackTrace,
      );
      return _buildErrorWidget(context);
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const SizedBox.shrink();
    }

    final _topTenplaylist = snapshot.data!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenSize.width / 1.4,
                child: MarqueeWidget(
                  child: Text(
                    context.l10n!.topTenlist,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              /*
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistsPage(),
                    ),
                  );
                },
                icon: Icon(
                  FluentIcons.more_horizontal_24_regular,
                  color: colorScheme.primary,
                ),
              ), 
              */
            ],
          ),
        ),
        SizedBox(
          height: context.screenSize.height * 0.15,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemCount: _topTenplaylist.length,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              final playlist = _topTenplaylist[index];
              return TopTenplaylist(
                id: playlist['ytid'],
                image: playlist['image'].toString(),
                title: playlist['title'].toString(),
                isAlbum: playlist['isAlbum'],
                size: context.screenSize.height * 0.15,
              );
            },
          ),
        ),
      ],
    );
  }

//
//Recomended
//

  Widget _buildRecommendedSongsAndArtists() {
    return FutureBuilder(
      future: getRecommendedSongs(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        final calculatedSize = context.screenSize.height * 0.25;
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return _buildLoadingWidget();
          case ConnectionState.done:
            if (snapshot.hasError) {
              logger.log(
                'Error in _buildRecommendedSongsAndArtists',
                snapshot.error,
                snapshot.stackTrace,
              );
              return _buildErrorWidget(context);
            }
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }
            return _buildRecommendedContent(
              context,
              snapshot.data,
              calculatedSize,
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(35),
        child: Spinner(),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Center(
      child: Text(
        '${context.l10n!.error}!',
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildRecommendedContent(
    BuildContext context,
    List<dynamic> data,
    double calculatedSize,
  ) {
    return Column(
      children: <Widget>[
        /*
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.screenSize.width / 1.4,
                child: MarqueeWidget(
                  child: Text(
                    context.l10n!.suggestedArtists,
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: calculatedSize,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, __) => const SizedBox(width: 15),
            itemCount: 10,
            itemBuilder: (context, index) {
              final artist = data[index]['artist'].split('~')[0];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArtistPage(
                        playlist: {
                          'title': artist,
                        },
                      ),
                    ),
                  );
                },
                child: ArtistCube(artist),
              );
            },
          ),
        ),
        */
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n!.recommendedForYou,
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => setActivePlaylist({
                  'title': context.l10n!.recommendedForYou,
                  'list': data,
                }),
                child: Icon(
                  FluentIcons.play_circle_24_filled,
                  color: colorScheme.primary,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return SongBar(data[index], true);
          },
        ),
      ],
    );
  }
}
