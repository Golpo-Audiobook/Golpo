import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('ka'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi')
  ];

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @accentChangeMsg.
  ///
  /// In en, this message translates to:
  /// **'Accent color has been changed'**
  String get accentChangeMsg;

  /// No description provided for @accentColor.
  ///
  /// In en, this message translates to:
  /// **'Accent color'**
  String get accentColor;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addToPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Add to playlist'**
  String get addToPlaylist;

  /// No description provided for @addedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Added successfully'**
  String get addedSuccess;

  /// No description provided for @album.
  ///
  /// In en, this message translates to:
  /// **'Album'**
  String get album;

  /// No description provided for @appUpdateIsAvailable.
  ///
  /// In en, this message translates to:
  /// **'App update is available'**
  String get appUpdateIsAvailable;

  /// No description provided for @audioQuality.
  ///
  /// In en, this message translates to:
  /// **'Audio quality'**
  String get audioQuality;

  /// No description provided for @audioQualityMsg.
  ///
  /// In en, this message translates to:
  /// **'Audio quality has been changed'**
  String get audioQualityMsg;

  /// No description provided for @backedupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backed up successfully'**
  String get backedupSuccess;

  /// No description provided for @backupError.
  ///
  /// In en, this message translates to:
  /// **'Error while data backup'**
  String get backupError;

  /// No description provided for @backupUserData.
  ///
  /// In en, this message translates to:
  /// **'Backup user data'**
  String get backupUserData;

  /// No description provided for @becomeSponsor.
  ///
  /// In en, this message translates to:
  /// **'Buy Premium'**
  String get becomeSponsor;

  /// No description provided for @cacheMsg.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheMsg;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @chooseBackupDir.
  ///
  /// In en, this message translates to:
  /// **'Choose Backup Directory'**
  String get chooseBackupDir;

  /// No description provided for @chooseRestoreDir.
  ///
  /// In en, this message translates to:
  /// **'Choose Restore File Directory'**
  String get chooseRestoreDir;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get clearCache;

  /// No description provided for @clearSearchHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear Search History'**
  String get clearSearchHistory;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'Confirmation'**
  String get confirmation;

  /// No description provided for @copyLogs.
  ///
  /// In en, this message translates to:
  /// **'Copy logs'**
  String get copyLogs;

  /// No description provided for @copyLogsNoLogs.
  ///
  /// In en, this message translates to:
  /// **'No logs found to copy'**
  String get copyLogsNoLogs;

  /// No description provided for @copyLogsSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logs copied successfully. '**
  String get copyLogsSuccess;

  /// No description provided for @customPlaylistAddInstruction.
  ///
  /// In en, this message translates to:
  /// **'If you add , fill only YouTube playlist ID field, if you create your own playlist leave YouTube playlist ID empty and fill only: Name, Image link (optional), Description (optional)'**
  String get customPlaylistAddInstruction;

  /// No description provided for @customPlaylistDesc.
  ///
  /// In en, this message translates to:
  /// **'Custom Audiobook description'**
  String get customPlaylistDesc;

  /// No description provided for @customPlaylistImgUrl.
  ///
  /// In en, this message translates to:
  /// **'Custom Audiobook image link'**
  String get customPlaylistImgUrl;

  /// No description provided for @customPlaylistName.
  ///
  /// In en, this message translates to:
  /// **'Custom Audiobook name'**
  String get customPlaylistName;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @downloadAppUpdate.
  ///
  /// In en, this message translates to:
  /// **'Download app update'**
  String get downloadAppUpdate;

  /// No description provided for @downloadCompleted.
  ///
  /// In en, this message translates to:
  /// **'Download completed'**
  String get downloadCompleted;

  /// No description provided for @downloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed'**
  String get downloadFailed;

  /// No description provided for @dynamicColor.
  ///
  /// In en, this message translates to:
  /// **'Dynamic accent color (Android 12+)'**
  String get dynamicColor;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get error;

  /// No description provided for @errorWhileRequestingPerms.
  ///
  /// In en, this message translates to:
  /// **'Error while requesting permissions'**
  String get errorWhileRequestingPerms;

  /// No description provided for @fasterDownloadMsg.
  ///
  /// In en, this message translates to:
  /// **'The faster download mode is in the BETA stage and doesn\'t have a notification for the downloading status.'**
  String get fasterDownloadMsg;

  /// No description provided for @folderRestrictions.
  ///
  /// In en, this message translates to:
  /// **'Due to new restrictions on Android, it is essential to select specific and appropriate folders for different file types. Please ensure that you choose either the \'Documents\' or \'Downloads\' folder for the app backup.'**
  String get folderRestrictions;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageMsg.
  ///
  /// In en, this message translates to:
  /// **'Language has been changed'**
  String get languageMsg;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @lyrics.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get lyrics;

  /// No description provided for @lyricsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'No Text Available'**
  String get lyricsNotAvailable;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get more;

  /// No description provided for @noLikedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t liked any Audiobooks yet'**
  String get noLikedPlaylists;

  /// No description provided for @notYTlist.
  ///
  /// In en, this message translates to:
  /// **'This is not a Valid ID'**
  String get notYTlist;

  /// No description provided for @nothingFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing Found'**
  String get nothingFound;

  /// No description provided for @nowPlaying.
  ///
  /// In en, this message translates to:
  /// **'Now playing'**
  String get nowPlaying;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages;

  /// No description provided for @playlist.
  ///
  /// In en, this message translates to:
  /// **'Audiobook'**
  String get playlist;

  /// No description provided for @playlistUpdated.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Updated Successfully'**
  String get playlistUpdated;

  /// No description provided for @playlists.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get playlists;

  /// No description provided for @provideIdOrNameError.
  ///
  /// In en, this message translates to:
  /// **'Please provide either a ID or a custom Audiobook name'**
  String get provideIdOrNameError;

  /// No description provided for @queueInitText.
  ///
  /// In en, this message translates to:
  /// **'Initialising queue...'**
  String get queueInitText;

  /// No description provided for @recentlyPlayed.
  ///
  /// In en, this message translates to:
  /// **'Recently Played'**
  String get recentlyPlayed;

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended for you'**
  String get recommendedForYou;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @removePlaylistQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this Audiobook?'**
  String get removePlaylistQuestion;

  /// No description provided for @removeSearchQueryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this search query?'**
  String get removeSearchQueryQuestion;

  /// No description provided for @restoreError.
  ///
  /// In en, this message translates to:
  /// **'Error while data restore'**
  String get restoreError;

  /// No description provided for @restoreUserData.
  ///
  /// In en, this message translates to:
  /// **'Restore user data'**
  String get restoreUserData;

  /// No description provided for @restoredSuccess.
  ///
  /// In en, this message translates to:
  /// **'Restored Successfully'**
  String get restoredSuccess;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchHistoryMsg.
  ///
  /// In en, this message translates to:
  /// **'Search history cleared'**
  String get searchHistoryMsg;

  /// No description provided for @settingChangedMsg.
  ///
  /// In en, this message translates to:
  /// **'Setting changed'**
  String get settingChangedMsg;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @songAdded.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Added Successfully!'**
  String get songAdded;

  /// No description provided for @songRemoved.
  ///
  /// In en, this message translates to:
  /// **'Audiobook removed Successfully!'**
  String get songRemoved;

  /// No description provided for @songs.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks'**
  String get songs;

  /// No description provided for @sponsorProject.
  ///
  /// In en, this message translates to:
  /// **'Unlock Premium Features'**
  String get sponsorProject;

  /// No description provided for @suggestedArtists.
  ///
  /// In en, this message translates to:
  /// **'Suggested artists'**
  String get suggestedArtists;

  /// No description provided for @suggestedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Suggested Audiobooks'**
  String get suggestedPlaylists;

  /// No description provided for @mostPlayed.
  ///
  /// In en, this message translates to:
  /// **'Most Played Audiobooks'**
  String get mostPlayed;

  /// No description provided for @topTenlist.
  ///
  /// In en, this message translates to:
  /// **'Top Ten Audiobooks'**
  String get topTenlist;

  /// No description provided for @newRelease.
  ///
  /// In en, this message translates to:
  /// **'New Published'**
  String get newRelease;

  /// No description provided for @allCatagory.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Categories'**
  String get allCatagory;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @understand.
  ///
  /// In en, this message translates to:
  /// **'I understand'**
  String get understand;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'undo'**
  String get undo;

  /// No description provided for @userLikedPlaylists.
  ///
  /// In en, this message translates to:
  /// **'User liked Audiobooks'**
  String get userLikedPlaylists;

  /// No description provided for @userLikedSongs.
  ///
  /// In en, this message translates to:
  /// **'User liked Audiobooks'**
  String get userLikedSongs;

  /// No description provided for @userOfflineSongs.
  ///
  /// In en, this message translates to:
  /// **'User offline Audiobooks'**
  String get userOfflineSongs;

  /// No description provided for @userPlaylists.
  ///
  /// In en, this message translates to:
  /// **'User Audiobooks'**
  String get userPlaylists;

  /// No description provided for @yourFavoriteSongsHere.
  ///
  /// In en, this message translates to:
  /// **'Your favorite Audiobooks are here'**
  String get yourFavoriteSongsHere;

  /// No description provided for @youtubePlaylistID.
  ///
  /// In en, this message translates to:
  /// **'Playlist ID'**
  String get youtubePlaylistID;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'de', 'el', 'en', 'es', 'fr', 'hi', 'ka', 'pl', 'pt', 'ru', 'tr', 'uk', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'el': return AppLocalizationsEl();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'ka': return AppLocalizationsKa();
    case 'pl': return AppLocalizationsPl();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
    case 'uk': return AppLocalizationsUk();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
