import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grievances/core/utils/routes.dart';
import 'package:grievances/presentation/widgets/otp_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";

  // Handle OTP change
  void _onOtpChanged(String value) {
    setState(() {
      otp = value;
    });
    print("OTP: $otp"); // You can use the OTP here to verify
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpField(
              otpLength: 4, // You can change this to 4 or 6
              onChanged: _onOtpChanged,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: otp.length == 4 ? () {
                // Handle OTP submission
                if(otp == "1234") {
                  context.push(RoutesName.registerScreen);
                }
                print("OTP Submitted: $otp");
              } : null,
              child: const Text("Submit OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
