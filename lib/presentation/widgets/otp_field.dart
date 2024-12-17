import 'package:flutter/material.dart';

class OtpField extends StatefulWidget {
  final int otpLength;
  final Function(String) onChanged; // Callback function when OTP is entered

  const OtpField({
    super.key,
    this.otpLength = 4, // Default OTP length is 4
    required this.onChanged,
  });

  @override
  _OtpFieldState createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  // List of TextEditingControllers for each OTP field
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(widget.otpLength, (index) => TextEditingController());
    focusNodes = List.generate(widget.otpLength, (index) => FocusNode());
  }

  @override
  void dispose() {
    // Dispose controllers and focus nodes to avoid memory leaks
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  // Method to handle OTP input and focus change
  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < widget.otpLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }

    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    // Join all OTP digits and pass them to onChanged callback
    String otp = controllers.map((controller) => controller.text).join();
    widget.onChanged(otp);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.otpLength, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: 50, // Width of each OTP field
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              maxLength: 1,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                counterText: "", // Hide counter text for maxLength
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) => _onOtpChanged(value, index),
            ),
          ),
        );
      }),
    );
  }
}
