import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/sura_content.dart';

import 'package:provider/provider.dart';

import 'hadeth_content.dart';
import 'home_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
    ),
    //ChangeNotifierProvider(create: (context) => SuraDetailsProvider(),),
  ], child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      locale: Locale(provider.languageCode),
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraContent.routeName: (context) => SuraContent(),
        HadethContent.routeName: (context) => HadethContent(),
      },
    );
  }
}
