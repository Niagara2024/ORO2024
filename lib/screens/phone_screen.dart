import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  late String _initialCountryCode = '';
  String _phoneNumber = "";

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

  //TODO: Get user's location
  Future<void> _getLocationAndSetCountryCode() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

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

  //TODO: Phone verification

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
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
                Center(
                  child: SizedBox(
                    height: 600,
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CountryCodePicker(
                                      onChanged: (CountryCode? country) {
                                        setState(() {
                                          _initialCountryCode = country!.code!;
                                        });
                                      },
                                      searchDecoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(5)
                                      ),
                                      dialogSize: Size(200, 300) ,
                                      initialSelection: _initialCountryCode,
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: true,
                                      alignLeft: false,
                                      showFlag: true,
                                      builder: (CountryCode? country) {
                                        return Row(
                                          children: [
                                            Image.asset(
                                              country!.flagUri!,
                                              package: 'country_code_picker',
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '${country!.dialCode}',
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                            const Icon(Icons.arrow_drop_down),
                                          ],
                                        );
                                      }
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'You’ll receive a 6 digits code to verify Next',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CountryCodePicker(
                                    onChanged: (CountryCode? country) {
                                      setState(() {
                                        _initialCountryCode = country!.code!;
                                      });
                                    },
                                    initialSelection: _initialCountryCode,
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: false,
                                    showFlag: true,
                                    builder: (CountryCode? country) {
                                      return Row(
                                        children: [
                                          Image.asset(
                                            country!.flagUri!,
                                            package: 'country_code_picker', // Make sure to include the package name
                                            width: 20, // Adjust the width as needed
                                            height: 20, // Adjust the height as needed
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '${country!.dialCode}',
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                          Icon(Icons.arrow_drop_down),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Phone number',
                                            hintText: 'Enter your phone number',
                                          ),
                                          onChanged: (phone){
                                            print(phone);
                                          },
                                        ),
                                        const SizedBox(width: 10,),
                                        Expanded(
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Phone number',
                                              hintText: 'Enter your phone number',
                                            ),
                                            onChanged: (phone){
                                              setState(() {
                                                _phoneNumber = phone;
                                              });
                                              print(phone);
                                            },
                                            keyboardType: TextInputType.phone,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )],
                                ),
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
                    ]
                ),
            )
                )],
            );
          }
        ),
      ),
    );
  }
}


