import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hirfawy/core/routing/route_names.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/OnBoarding1.png',
      'pageNumber': '01 / 03',
      'title': 'Find the Right\nHandyman',
      'description': 'Browse skilled and verified professionals for your home services. Compare ratings, prices and choose the best one for you.',
    },
    {
      'image': 'assets/images/OnBoarding2.png',
      'pageNumber': '02 / 03',
      'title': 'Book Your Service\nin Minutes',
      'description': 'Choose the service, pick your preferred date and time, and book with just a few taps. It\'s that simple!',
    },
    {
      'image': 'assets/images/OnBoarding3.png',
      'pageNumber': '03 / 03',
      'title': 'Track, Pay & Rate',
      'description': 'Follow your request in real-time, make secure payments, and share your rating after the service is done.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFE9EEF1),
      body: Stack(
        children: [
          // 1. خلفية الصور مع حركة احترافية (Parallax + Zoom Scale + Fade)
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double pageValue = 0.0;
                    if (_pageController.hasClients) {
                      pageValue =
                          (_pageController.page ?? _currentIndex.toDouble()) -
                          index;
                    }

                    // حساب الـ Scale بحيث الصورة تكبر وتصغر بخفة أثناء السحب
                    double scale =
                        1.0 - (pageValue.abs() * 0.15).clamp(0.0, 0.15);
                    // حساب الـ Opacity لتلاشي ناعم جداً بين الصور
                    double opacity = (1.0 - (pageValue.abs() * 0.5)).clamp(
                      0.3,
                      1.0,
                    );

                    return Transform.translate(
                      offset: Offset(pageValue * size.width * 0.4, 0),
                      child: Transform.scale(
                        scale: scale,
                        child: Opacity(opacity: opacity, child: child),
                      ),
                    );
                  },
                  child: Image.asset(
                    _onboardingData[index]['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ),

          // 2. المحتوى العلوي والسفلي فوق الصورة
          SafeArea(
            child: Column(
              children: [
                // الهيدر العلوي
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.015,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF134E48),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SvgPicture.asset(
                              'assets/SVG/home-improvement-house-home-repair-fix-house-svgrepo-com.svg',
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'El-Hirfawy',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF134E48),
                                ),
                              ),
                              Text(
                                'Home Services, Made Easy',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(RouteNames.login);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF26736A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // الكارت السفلي (مع حركة النصوص السلسة)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                    vertical: size.height * 0.025,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.75),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.09),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0.1, 0),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                ),
                              );
                            },
                        child: Column(
                          key: ValueKey<int>(_currentIndex),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _onboardingData[_currentIndex]['pageNumber']!,
                              style: TextStyle(
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF26736A),
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              _onboardingData[_currentIndex]['title']!,
                              style: TextStyle(
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF134E48),
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              _onboardingData[_currentIndex]['description']!,
                              style: TextStyle(
                                fontSize: size.width * 0.035,
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.025),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(3, (index) {
                              bool isActive = _currentIndex == index;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(right: 6),
                                width: isActive ? 24 : 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? const Color(0xFF134E48)
                                      : Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              );
                            }),
                          ),
                          _currentIndex == _onboardingData.length - 1
                              ? ElevatedButton(
                                  onPressed: () {
                                    context.go(RouteNames.login);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF134E48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.08,
                                      vertical: size.height * 0.015,
                                    ),
                                    elevation: 2,
                                  ),
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF134E48),
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(16),
                                    elevation: 2,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
