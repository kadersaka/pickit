import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pickit/pages/auth/otp_screen.dart';
import 'package:pickit/utils/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color continueButtonColor = Colors.grey[500];
  String phoneNumber, country_code, dialing_code;
  String phoneIsoCode;
  bool isPhoneValid = false;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'BJ';
  PhoneNumber number = PhoneNumber(isoCode: 'BJ');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saisissez votre numero de téléphone',
                        style: CustomTextStyle().blackLargeTextStyle,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),

                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                          setState(() {
                            phoneNumber = number.phoneNumber.toString();
                            country_code = number.isoCode;
                            dialing_code = number.dialCode;
                            print ('phoneNum is: ');
                            print(phoneNumber);
                            print(country_code);
                            print(dialing_code);
                          });
                        },
                        isEnabled: true,
                        countries: ['BJ'],
                        autoValidateMode: AutovalidateMode.always,
                        formatInput: false,
                        ignoreBlank: true,
                        inputDecoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        onInputValidated: (bool value) {
                          print(value);
                          setState(() {
                            isPhoneValid = value;
                          });
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(CustomTextStyle().fixPadding * 2.0),
            child: InkWell(
              onTap: () {
                isPhoneValid ? Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(phonNumber: phoneNumber,))) : null;
              },
              child: AnimatedContainer(
                width: width - CustomTextStyle().fixPadding * 2.0,
                padding: EdgeInsets.all(CustomTextStyle().fixPadding * 1.0),
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: isPhoneValid ? Theme.of(context).primaryColor :  Colors.grey[500],
                ),
                child: Text(
                  'Continuer',
                  style: CustomTextStyle().whiteBottonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
