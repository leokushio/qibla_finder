import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qibla_finder/providers/api_provider.dart';
import 'package:qibla_finder/providers/audio_provider.dart';
import 'package:qibla_finder/providers/permissions_provider.dart';
import 'package:qibla_finder/screens/home_screen/home_screen.dart';
import 'package:qibla_finder/screens/quran_screen/quran_screen.dart';
import 'package:qibla_finder/screens/surah_screen/surah_screen.dart';
import 'package:qibla_finder/theme/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PermissionsProvider()),
      ChangeNotifierProvider(create: (context) => APIProvider()),
      ChangeNotifierProvider(create: (context) => AudioProvider()),
    ],
    
    child: const MainApp())
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PermissionsProvider>().getPermission();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: XAppTheme.appTheme,
      home: const HomeScreen(),
      routes: {
        '/home_screen' : (context) => const HomeScreen(),
        '/quran_screen' :(context) => const QuranScreen(),
        '/surah_screen' : (context) => const SurahScreen(),
      },
    );
  }
}
