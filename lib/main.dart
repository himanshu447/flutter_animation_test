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

class OverlappingCardsPage extends StatefulWidget {
  const OverlappingCardsPage({super.key});

  @override
  State<OverlappingCardsPage> createState() => _OverlappingCardsPageState();
}

class _OverlappingCardsPageState extends State<OverlappingCardsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final int _itemCount = 20; // Simulate large list

  final subscriptions = List.generate(
    20,
    (index) => _Subscription(
      name: "Service ${index + 1}",
      price: "\$${(5 + index).toStringAsFixed(2)} / month",
      color: Colors.primaries[index % Colors.primaries.length].shade400,
      logo: "assets/icons/figma.png", // Placeholder
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    )..forward(); // Start animation once
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Animation<Offset> _buildSlideAnimation(int index) {
    final start = index * 0.05;
    final end = start + 0.4;
    return Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          start.clamp(0.0, 1.0),
          end.clamp(0.0, 1.0),
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(
                top: 200,
                left: 16,
                right: 16,
                bottom: 24,
              ),
              itemCount: subscriptions.length,
              itemBuilder: (context, index) {
                final animation = _buildSlideAnimation(index);
                return Transform.translate(
                  offset: Offset(0, -40.0 * index),
                  child: SlideTransition(
                    position: animation,
                    child: _buildCard(subscriptions[index]),
                  ),
                );
              },
            ),
            // Top Add Card
            Padding(padding: const EdgeInsets.all(16), child: _buildAddCard()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(_Subscription sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: sub.color,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sub.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  sub.price,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),
          // Right
          ClipOval(
            child: Image.asset(
              sub.logo,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Add a subscription",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _Subscription {
  final String name;
  final String price;
  final Color color;
  final String logo;

  _Subscription({
    required this.name,
    required this.price,
    required this.color,
    required this.logo,
  });
}
