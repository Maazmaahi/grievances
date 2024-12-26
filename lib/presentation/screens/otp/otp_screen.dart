import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:grievances/core/routes/routes_name.dart";
import "package:grievances/presentation/widgets/primary_button.dart";
import "package:pinput/pinput.dart";

class OtpScreen extends StatefulWidget {

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  String validPin = "1234";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("otp"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Otp Screen", ),
                SizedBox(height: 40),
                Pinput(
                  validator: (value){
                    return value == validPin ? null : "Pin is incorrect";
                  },
                  onCompleted: (pin) {
                    print("Pin is sucess :- $validPin");
                  },
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'validate',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.push(RoutesName.otpScreen);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                  Text('Please correct your otp.')),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
