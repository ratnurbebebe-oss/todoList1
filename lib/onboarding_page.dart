import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _StateOnboardingPage();
}

class _StateOnboardingPage extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  final List<Map<String, String>> pages = [
    {
      "title": "Добро пожаловать ",
      "Description": "Это наше приложение. Здесь вы сможете удобно работать. ",
    },
    {
      "title": "Будте продуктивнее",
      "descripyion": "Создавайте задачи и следите за своим прогрессом.",
    },
  ];
  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isOboardingViewed", true);
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void nextPage() {
    if (currentPage == pages.length - 1) {
      finishOnboarding();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.mobile_friendly,
                            size: 100,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          pages[index]["title"]??"",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          pages[index]["descreption"]??"",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 25 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: nextPage,
                  child: Text(
                    currentPage == pages.length - 1 ? "начать" : "далее",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
    @override
    void  dispose(){
      _pageController.dispose();
      super.dispose();
    }
  }
}
