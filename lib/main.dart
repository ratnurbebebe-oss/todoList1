import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_page.dart';
import 'onboarding_page.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs =await SharedPreferences.getInstance();
  final bool isOnboardingViewed=
  prefs.getBool("isOnboardingViewed")??false;
  runApp(
    MyApp(isOnboardingViewed:isOnboardingViewed,
    ),
  );
}
class MyApp extends StatelessWidget{
  final bool isOnboardingViewed;
  const MyApp({
    super.key,
    required this.isOnboardingViewed,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OnBoarding",
      home: isOnboardingViewed
      ?const HomePage()
      : const OnboardingPage(),
    );
  }
}