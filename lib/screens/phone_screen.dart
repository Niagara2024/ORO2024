import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:oro_2024/screens/otp_screen.dart';
import 'package:oro_2024/screens/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> with SingleTickerProviderStateMixin {
  TextEditingController numberTextController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _circleAnimation1;
  late Animation<double> _circleAnimation2;
  String _initialCountryCode = '';
  String _phoneNumber = "";
  final TextEditingController phoneController = TextEditingController();

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

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _getLocationAndSetCountryCode() async {
    PermissionStatus permissionStatus = await Permission.locationWhenInUse.request();

    if (permissionStatus.isGranted) {
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
        });
      } catch (e) {
        print('Error getting location: $e');
      }
    } else {
      print('Location permission not granted');
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Future<void> _requestOtp(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await FirebaseAuth.instance.signInWithCredential(credential);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            ),
          );
        } catch (e) {
          print('Error signing in: $e');
          _showErrorSnackbar('Error signing in: $e');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
        _showErrorSnackbar('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPScreen(verificationId: verificationId, phoneNumber: _phoneNumber,),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Called when auto-retrieval timeout is reached
        print('Auto-retrieval timeout reached for verification ID: $verificationId');
        _showErrorSnackbar('Auto-retrieval timeout reached');
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(
            offset: phoneController.text.length
        )
    );
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
                SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "MOBILE NUMBER VERIFICATION",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 50,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/authentication_illustration.png',
                              height: 200,
                              width: 250,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "We'll send you a 6 digit OTP to this mobile number",
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 20),
                          if(_initialCountryCode != '')
                            IntlPhoneField(
                              // controller: phoneController,
                              initialCountryCode: _initialCountryCode,
                              onChanged: (PhoneNumber value) {
                                _phoneNumber = value.completeNumber;
                                print(_phoneNumber);
                              }, needTofocus: null, SuffixIcon: null, myController: numberTextController,
                            ),
                          const SizedBox(height: 50,),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => OTPScreen(phoneNumber: _phoneNumber, verificationId: '',),
                                ),
                              );
                              //_requestOtp(_phoneNumber);
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