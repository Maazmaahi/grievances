import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grievances/core/utils/routes.dart';
import 'package:grievances/presentation/widgets/app_textfield.dart';
import 'package:grievances/presentation/widgets/custom_scaffold.dart';
import 'package:grievances/presentation/widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();

  // Validator function for mobile number
  String? _validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
    }
    return null;
  }

  // Submit method for the form
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.push(RoutesName.otpScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct your mobile number.')),
      );
    }
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Sign In',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
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
                  validator: _validateMobile,
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: _submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign In Screen',
            style: TextStyle(fontSize: 24),
          ),
          InkWell(onTap: (){
            context.push(RoutesName.registerScreen);
          }, child: const Text("register")),
        ],
      ),
    );
  }
}
*/
