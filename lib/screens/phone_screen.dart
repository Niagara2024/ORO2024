import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:oro_2024/screens/home_screen.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _circleAnimation1;
  late Animation<double> _circleAnimation2;
  late Animation<double> _contentAnimation;
  String _initialCountryCode = 'IN';

  @override
  void initState() {
    super.initState();
    _getLocationAndSetCountryCode();
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

  Future<void> _getLocationAndSetCountryCode() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      // Determine the country based on the user's position
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String? countryCode = placemarks.isNotEmpty ? placemarks.first.isoCountryCode : 'IN';

      setState(() {
        _initialCountryCode = countryCode!;
        print(countryCode);
        print(placemarks);
      });
    } catch (e) {
      print('Error getting location: $e');
    }
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
              FadeTransition(
                opacity: _contentAnimation,
                child: Center(
                  child: SizedBox(
                    height: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/authentication_illustration.png',
                            height: 200,
                            width: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "CONTINUE WITH PHONE",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'You’ll receive a 6 digits code to verify Next',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CountryCodePicker(
                                onChanged: (CountryCode country) {
                                  setState(() {
                                    _initialCountryCode = country.code!;
                                  });
                                },
                                initialSelection: _initialCountryCode,
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                              ),

                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Phone number',
                                  hintText: 'Enter your phone number',
                                ),
                                keyboardType: TextInputType.phone,
                                initialValue: _initialCountryCode,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'CONTINUE',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
