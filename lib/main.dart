import 'package:animation_test/model/subscription_dm.dart';
import 'package:animation_test/model/user_selected_subs.dart';
import 'package:animation_test/module/home/home_page.dart';
import 'package:animation_test/module/on_boarding/on_boarding_page_controller.dart';
import 'package:animation_test/utils/app_theme/app_theme.dart';
import 'package:animation_test/utils/constants/pref_constant.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'module/home/general/general_page_controller.dart';
import 'module/home/my_subs/my_subs_page_controller.dart';
import 'module/on_boarding/on_boarding_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentsDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive
    ..init(appDocumentsDir.path)
    ..registerAdapter(UserSelectedSubsAdapter())
    ..registerAdapter(SubscriptionDmAdapter());

  final prefs = await SharedPreferences.getInstance();

  final isUserLogin = prefs.getBool(PrefConstant.isUserLogin);
  runApp(MyApp(isUserLogin: isUserLogin ?? false));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.isUserLogin, super.key});

  final bool isUserLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingPageController()),
        ChangeNotifierProvider(create: (context) => GeneralPageController()),
        ChangeNotifierProvider(create: (context) => MySubsPageController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: isUserLogin ? const HomePage() : const OnBoardingPage(),
      ),
    );
  }
}