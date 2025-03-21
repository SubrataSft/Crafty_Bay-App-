
import 'package:crafty_bay_app/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
              AppLogoWidget(),
              SizedBox(height: 24),
              Text(
                "Welcome Back",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text(
                "Please enter your email address",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.black),
              ),
              SizedBox(height: 26),
              TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: "Email")),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _onTapNextButton,
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    Get.off(()=>OtpVerificationScreen());
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
