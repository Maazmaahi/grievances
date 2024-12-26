import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:grievances/core/routes/routes_name.dart";
import "package:grievances/presentation/widgets/app_textfield.dart";
import "package:grievances/presentation/widgets/primary_button.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Welcome to Grievances",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 60),
                AppTextField(
                  controller: _mobileController,
                  labelText: 'Mobile Number',
                  hintText: 'Enter your mobile number',
                  keyboardType: TextInputType.phone,
                  icon: Icons.phone,
                  maxLength: 10,
                  onChanged: (value) {
                    print("Input: $value");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile number is required';
                    }
                    if (value.length != 10) {
                      return 'Mobile number must be 10 digits';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 60),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Login',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.push(RoutesName.otpScreen);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Please correct your mobile number.')),
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
