import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hirfawy/core/routing/route_names.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with TickerProviderStateMixin {
  // تم التعديل لدعم أكثر من AnimationController
  late AnimationController _controller;
  late AnimationController _pulseController; // كونترولر إضافي للبلص (النبض)

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation; // أنيميشن البلص

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // إعداد كونترولر البلص (النبض)
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // يجعل البلص يتردد صعوداً وهبوطاً باستمرار

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    // تعريف تأثير النبض (يكبر ويسغر بنسبة بسيطة جداً ولطيفة)
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go(RouteNames.onboarding);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pulseController
        .dispose(); // التخلص من الـ controller الجديد لمنع تسرب الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFE9EEF1)),
      child: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),

                    // أضفنا ScaleTransition للبلص محيطة بالصورة من غير ما نغير كودك الأصلي
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: Image.asset(
                        'assets/images/Splash.jpg',
                        fit: BoxFit.contain,
                        height: MediaQuery.of(context).size.height * 0.65,
                      ),
                    ),

                    const Spacer(),

                    Container(
                      width: 150,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFF134E48).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: const Duration(seconds: 2),
                          builder: (context, value, child) {
                            return FractionallySizedBox(
                              widthFactor: value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF134E48),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    const Text(
                      'Your home, our priority',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF26736A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
