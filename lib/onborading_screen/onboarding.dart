import 'package:ecommerceapp/pages/loginpage.dart';
import 'package:ecommerceapp/widgets/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  static final PageController _pageController = PageController(initialPage: 0);
  late List<Widget> _onBoardingPages;

  @override
  void initState() {
    super.initState();
    _onBoardingPages = [
      OnBoardingCard(
        image: "assets/images/onboarding/onboarding_1.jpg",
        title: 'Welcome to SneakerSpot',
        description:
            "Discover the ultimate destination for trendy and stylish footwear. Let's step into a world of exclusive collections, personalized recommendations, and unbeatable deals.",
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
      OnBoardingCard(
        image: "assets/images/onboarding/onboarding_2.jpg",
        title: 'Explore Our Collection',
        description:
            "Check out the latest additions to our shoe collection. Browse, select, and purchase your favorite pairs with just a few clicks!",
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
      ),
      OnBoardingCard(
        image: "assets/images/onboarding/onboarding_3.jpg",
        title: 'Log In to Your Account',
        description:
            "Access your personalized shoe collection and shopping experience by logging into your account.",
        buttonText: 'Done',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: orientation == Orientation.portrait ? 50.0 : 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onBoardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onBoardingPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).colorScheme.secondary,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
