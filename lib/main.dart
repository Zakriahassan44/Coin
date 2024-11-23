import 'package:coin_identification/theams/theam_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'Model/coin_model.dart';
import 'Provider/favorite_coin_provider.dart';
import 'Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CoinModelAdapter());
  await Hive.openBox<CoinModel>("coinCollection");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteCoinsProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const CoinApp(),
    ),
  );
}

class CoinApp extends StatefulWidget {
  const CoinApp({super.key});

  @override
  _CoinAppState createState() => _CoinAppState();
}

class _CoinAppState extends State<CoinApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    Provider.of<ThemeProvider>(context, listen: false).setSystemTheme(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Coin App',
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).themeData,
          home:  const SplashScreen(),
        );
      },
    );
  }
}

