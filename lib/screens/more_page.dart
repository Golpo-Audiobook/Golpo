// ignore_for_file: unused_import

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:golpo/API/version.dart';
import 'package:golpo/extensions/l10n.dart';
import 'package:golpo/main.dart';
import 'package:golpo/screens/about_page.dart';
import 'package:golpo/screens/playlists_page.dart';
import 'package:golpo/screens/recently_played_page.dart';
import 'package:golpo/screens/search_page.dart';
import 'package:golpo/screens/user_liked_playlists_page.dart';
import 'package:golpo/screens/user_liked_songs_page.dart';
import 'package:golpo/screens/user_offline_songs_page.dart';
import 'package:golpo/services/data_manager.dart';
import 'package:golpo/services/settings_manager.dart';
import 'package:golpo/services/update_manager.dart';
import 'package:golpo/style/app_colors.dart';
import 'package:golpo/style/app_themes.dart';
import 'package:golpo/utilities/flutter_toast.dart';
import 'package:golpo/utilities/url_launcher.dart';
import 'package:golpo/widgets/setting_bar.dart';
import 'package:golpo/widgets/setting_switch_bar.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n!.more,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // CATEGORY: BECOME A SPONSOR
            Text(
              context.l10n!.becomeSponsor,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                color: colorScheme.primary,
                child: ListTile(
                  leading: const Icon(
                    FluentIcons.premium_24_filled,
                    color: Colors.white,
                  ),
                  title: Text(
                    context.l10n!.sponsorProject,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => {
                    launchURL(
                      Uri.parse('https://golpoaudiobooks.com/premium'),
                    ),
                  },
                ),
              ),
            ),
            // CATEGORY: PAGES
            Text(
              context.l10n!.settings,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),

            SettingBar(
              context.l10n!.recentlyPlayed,
              FluentIcons.history_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecentlyPlayed(),
                  ),
                ),
              },
            ),
            /*
            SettingBar(
              context.l10n!.playlists,
              FluentIcons.list_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlaylistsPage(),
                  ),
                ),
              },
            ), 
            SettingBar(
              context.l10n!.userLikedSongs,
              FluentIcons.heart_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserLikedSongsPage(),
                  ),
                ),
              },
            ),
            SettingBar(
              context.l10n!.userOfflineSongs,
              FluentIcons.cellular_off_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserOfflineSongsPage(),
                  ),
                ),
              },
            ), 

            SettingBar(
              context.l10n!.userLikedPlaylists,
              FluentIcons.heart_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserLikedPlaylistsPage(),
                  ),
                ),
              },
            ),*/
/*
            // CATEGORY: SETTINGS
            Text(
              context.l10n!.settings,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
*/
//  Accent Color & Theme
/*
            SettingBar(
              context.l10n!.accentColor,
              FluentIcons.color_24_filled,
              () => {
                showModalBottomSheet(
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: availableColors.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (availableColors.length > index)
                                    GestureDetector(
                                      onTap: () {
                                        addOrUpdateData(
                                          'settings',
                                          'accentColor',
                                          availableColors[index].value,
                                        );
                                        golpo.updateAppState(
                                          context,
                                          newAccentColor:
                                              availableColors[index],
                                          useSystemColor: false,
                                        );
                                        showToast(
                                          context,
                                          context.l10n!.accentChangeMsg,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Material(
                                        elevation: 4,
                                        shape: const CircleBorder(),
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor:
                                              themeMode == ThemeMode.light
                                                  ? availableColors[index]
                                                      .withAlpha(150)
                                                  : availableColors[index],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              },
            ),
            SettingBar(
              context.l10n!.themeMode,
              FluentIcons.weather_sunny_28_filled,
              () => {
                showModalBottomSheet(
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    final availableModes = [
                      ThemeMode.system,
                      ThemeMode.light,
                      ThemeMode.dark,
                    ];
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: availableModes.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    availableModes[index].name,
                                  ),
                                  onTap: () {
                                    addOrUpdateData(
                                      'settings',
                                      'themeMode',
                                      availableModes[index].name,
                                    );
                                    golpo.updateAppState(
                                      context,
                                      newThemeMode: availableModes[index],
                                    );

                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              },
            ),

            */

/*
            
            SettingBar(
              context.l10n!.language,
              FluentIcons.translate_24_filled,
              () => {
                showModalBottomSheet(
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    final availableLanguages = appLanguages.keys.toList();
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: availableLanguages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    availableLanguages[index],
                                  ),
                                  onTap: () {
                                    addOrUpdateData(
                                      'settings',
                                      'language',
                                      availableLanguages[index],
                                    );
                                    golpo.updateAppState(
                                      context,
                                      newLocale: Locale(
                                        appLanguages[
                                            availableLanguages[index]]!,
                                      ),
                                    );

                                    showToast(
                                      context,
                                      context.l10n!.languageMsg,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              },
            ),
            SettingSwitchBar(
              context.l10n!.dynamicColor,
              FluentIcons.toggle_left_24_filled,
              useSystemColor.value,
              (value) {
                addOrUpdateData(
                  'settings',
                  'useSystemColor',
                  value,
                );
                useSystemColor.value = value;
                golpo.updateAppState(
                  context,
                  newAccentColor: primaryColor,
                  useSystemColor: value,
                );
                showToast(
                  context,
                  context.l10n!.settingChangedMsg,
                );
              },
            ),
            ValueListenableBuilder<bool>(
              valueListenable: sponsorBlockSupport,
              builder: (_, value, __) {
                return SettingSwitchBar(
                  'SponsorBlock',
                  FluentIcons.presence_blocked_24_regular,
                  value,
                  (value) {
                    addOrUpdateData(
                      'settings',
                      'sponsorBlockSupport',
                      value,
                    );
                    sponsorBlockSupport.value = value;
                    showToast(
                      context,
                      context.l10n!.settingChangedMsg,
                    );
                  },
                );
              },
            ),
*/
            SettingBar(
              context.l10n!.audioQuality,
              Icons.music_note,
              () {
                showModalBottomSheet(
                  isDismissible: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    final availableQualities = ['Average', 'Good', 'Best'];

                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.primary,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: availableQualities.length,
                          itemBuilder: (context, index) {
                            final quality = availableQualities[index];
                            final isCurrentQuality =
                                audioQualitySetting.value == quality;

                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                elevation: isCurrentQuality ? 0 : 4,
                                child: ListTile(
                                  title: Text(quality),
                                  onTap: () {
                                    addOrUpdateData(
                                      'settings',
                                      'audioQuality',
                                      quality,
                                    );
                                    audioQualitySetting.value = quality;

                                    showToast(
                                      context,
                                      context.l10n!.audioQualityMsg,
                                    );
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
/*
            // CATEGORY: TOOLS
            Text(
              context.l10n!.tools,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
*/
            SettingBar(
              context.l10n!.clearCache,
              FluentIcons.broom_24_filled,
              () => {
                clearCache(),
                showToast(
                  context,
                  '${context.l10n!.cacheMsg}!',
                ),
              },
            ),
/*
            SettingBar(
              context.l10n!.clearSearchHistory,
              FluentIcons.history_24_filled,
              () => {
                searchHistory = [],
                deleteData('user', 'searchHistory'),
                showToast(context, '${context.l10n!.searchHistoryMsg}!'),
              },
            ),
            SettingBar(
              context.l10n!.backupUserData,
              FluentIcons.cloud_sync_24_filled,
              () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(context.l10n!.folderRestrictions),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            context.l10n!.understand.toUpperCase(),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                ).then(
                  (value) => backupData(context).then(
                    (response) => showToast(context, response),
                  ),
                ),
              },
            ),
            SettingBar(
              context.l10n!.restoreUserData,
              FluentIcons.cloud_add_24_filled,
              () => {
                restoreData(context).then(
                  (response) => showToast(context, response),
                ),
              },
            ),
            if (!isFdroidBuild)
              SettingBar(
                context.l10n!.downloadAppUpdate,
                FluentIcons.arrow_download_24_filled,
                () => {
                  checkAppUpdates(context),
                },
              ),

            // CATEGORY: OTHERS
            Text(
              context.l10n!.others,
              style: TextStyle(
                color: colorScheme.primary,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SettingBar(
              context.l10n!.licenses,
              FluentIcons.document_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LicensePage(
                      applicationName: 'golpo',
                      applicationVersion: appVersion,
                    ),
                  ),
                ),
              },
            ), 
            */
            SettingBar(
              '${context.l10n!.copyLogs} (${logger.getLogCount()})',
              FluentIcons.error_circle_24_filled,
              () async => {showToast(context, await logger.copyLogs(context))},
            ),
            SettingBar(
              context.l10n!.about,
              FluentIcons.book_information_24_filled,
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                ),
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
