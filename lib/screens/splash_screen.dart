import 'package:flutter/material.dart';
import 'package:oro_2024/screens/phone_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _circleAnimation1;
  late Animation<double> _circleAnimation2;
  late Animation<double> _circleAnimation3;
  late Animation<double> _circleAnimation4;
  late Animation<double> _contentAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _circleAnimation1 = Tween<double>(begin: 0, end: -90).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5),
      ),
    );

    _circleAnimation2 = Tween<double>(begin: -113, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5),
      ),
    );

    _circleAnimation3 = Tween<double>(begin: 0, end: -90).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5),
      ),
    );

    _circleAnimation4 = Tween<double>(begin: -113, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5),
      ),
    );

    _contentAnimation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          double imageFlex, textFlex, buttonFlex, imageHeight, ImageWidth;

          if (screenWidth < 600) {
            // Mobile screen
            imageFlex = 1.0;
            textFlex = 1.0;
            buttonFlex = 1.0;
            imageHeight = constraints.maxHeight * 0.5;
            ImageWidth = constraints.maxWidth * 0.5;
            // print("$screenWidth < 600");
          } else if (screenWidth < 1200) {
            // Tablet screen
            imageFlex = 0.9;
            textFlex = 0.5;
            buttonFlex = 0.9;
            imageHeight = constraints.maxHeight * 0.3;
            ImageWidth = constraints.maxWidth * 0.3;
            // print("$screenWidth < 1200");
          } else {
            // Desktop screen
            imageFlex = 0.5;
            textFlex = 2.0;
            buttonFlex = 0.5;
            imageHeight = constraints.maxHeight * 0.4;
            ImageWidth = constraints.maxWidth * 0.4;
            // print("$screenWidth > 1200");
          }

          return Stack(
            children: [
              AnimatedBuilder(
                animation: _circleAnimation1,
                builder: (context, child) {
                  return Positioned(
                    top: constraints.maxHeight * 0.01 + _circleAnimation1.value,
                    left: 0,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _circleAnimation2,
                builder: (context, child) {
                  return Positioned(
                    top: constraints.maxHeight * 0.01 + _circleAnimation2.value,
                    left: -113,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    ),
                  );
                },
              ),
              // AnimatedBuilder(
              //   animation: _circleAnimation1,
              //   builder: (context, child) {
              //     return Positioned(
              //       bottom: constraints.maxHeight * 0.01 + _circleAnimation3.value,
              //       right: 0,
              //       child: Container(
              //         width: 200,
              //         height: 200,
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Theme.of(context).primaryColor.withOpacity(0.5),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              // AnimatedBuilder(
              //   animation: _circleAnimation2,
              //   builder: (context, child) {
              //     return Positioned(
              //       bottom: constraints.maxHeight * 0.01 + _circleAnimation4.value,
              //       right: -113,
              //       child: Container(
              //         width: 200,
              //         height: 200,
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Color(0x800D5D9A),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              FadeTransition(
                opacity: _contentAnimation,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: imageFlex.toInt(),
                        child: Padding(
                          padding: EdgeInsets.all(constraints.maxWidth * 0.08),
                          child: Image.asset(
                            'assets/images/Illustration.png',
                          ),
                        ),
                      ),
                      Flexible(
                        flex: textFlex.toInt(),
                        child: Padding(
                          padding: EdgeInsets.all(constraints.maxWidth * 0.08),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ORO DRIP IRRIGATION",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Drip irrigation is a type of watering system used in agriculture, gardening, and landscaping to efficiently deliver water directly to the roots of plants.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: buttonFlex.toInt(),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const PhoneNumberScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'GET STARTED',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
