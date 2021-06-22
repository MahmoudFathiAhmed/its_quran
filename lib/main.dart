import 'package:flutter/material.dart';
import 'package:its_quran/screens/attachmentsAll.dart';
import 'package:its_quran/screens/midadCloudSystem.dart';

import 'package:its_quran/screens/network_video_player_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:its_quran/screens/home_screen.dart';
import 'package:its_quran/screens/privacyPolicyScreen.dart';
import 'package:its_quran/screens/categsScreen.dart';
import 'package:its_quran/screens/sheikhScreen.dart';
import 'package:its_quran/screens/termsOfUse.dart';

import 'screens/contactUs.dart';
import 'screens/fullCategScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xFFFFC710);
      }
      return Color(0xFFFFC710);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'إنه القرءان',
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      theme: ThemeData(
        primaryColor: Color(0xFF000E1F),
        accentColor: Color(0xFFFFC710),
        fontFamily: 'GE SS',
        textTheme: TextTheme(
          //For ListTile's title
          bodyText1: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
          ),

          //For ordinary text
          bodyText2: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
          //For caption and thin Texts
          caption: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 12.0,
          ),
          //For button Texts
          button: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
          ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              headline1: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          )),
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 1.0,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 6.0,
          ),
        ),
        scrollbarTheme: ScrollbarThemeData(
          isAlwaysShown: true,
          radius: Radius.circular(50.0),
          showTrackOnHover: true,
          thumbColor: MaterialStateProperty.resolveWith(getColor),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          // fillColor: Colors.red,
          fillColor: Color(0xFFF2F2F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFFAFAFAF),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/test': (ctx) => NetworkVideoPlayerScreen(),
        AttachmentsScreen.routeName: (ctx) => AttachmentsScreen(),
        PrivacyPolicyScreen.routeName: (ctx) => PrivacyPolicyScreen(),
        TermsOfUse.routeName: (ctx) => TermsOfUse(),
        CategsScreen.routeName: (ctx) => CategsScreen(),
        MidadCloudSystem.routeName: (ctx) => MidadCloudSystem(),
        ContactScreen.routeName: (ctx) => ContactScreen(),
        SheikhScreen.routeName: (ctx) => SheikhScreen(),
        FullCategScreen.routeName: (ctx) => FullCategScreen(),
      },
    );
  }
}
