// ignore_for_file: sized_box_for_whitespace

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:golpo/extensions/l10n.dart';
import 'package:golpo/style/app_themes.dart';
import 'package:golpo/utilities/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n!.about,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 17, 8, 17),
              child: Text(
                'Golpo Audiobook',
                style: GoogleFonts.paytoneOne(
                  color: colorScheme.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8, left: 10, right: 10),
              child: Divider(
                color: Colors.white24,
                thickness: 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://raw.githubusercontent.com/golpoaudiobook/cdn/main/uploads/golpo-logo-new-png.png',
                        ),
                      ),
                    ),
                  ),
                  title: const Text(
                    'Team Golpo',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    '',
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          FluentIcons.mail_24_filled,
                          color: colorScheme.primary,
                        ),
                        tooltip: 'Mail',
                        onPressed: () {
                          launchURL(
                            Uri.parse('https://golpobd.com/contact'),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          FluentIcons.globe_24_filled,
                          color: colorScheme.primary,
                        ),
                        tooltip: 'Website',
                        onPressed: () {
                          launchURL(
                            Uri.parse('https://golpobd.com'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

//

            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                  ),
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    '',
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          FluentIcons.globe_24_filled,
                          color: colorScheme.primary,
                        ),
                        tooltip: 'Website',
                        onPressed: () {
                          launchURL(
                            Uri.parse('https://golpobd.com/privacy'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

//

            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                  ),
                  title: const Text(
                    'Terms & Conditions',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    '',
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          FluentIcons.globe_24_filled,
                          color: colorScheme.primary,
                        ),
                        tooltip: 'Website',
                        onPressed: () {
                          launchURL(
                            Uri.parse('https://golpobd.com/terms'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
