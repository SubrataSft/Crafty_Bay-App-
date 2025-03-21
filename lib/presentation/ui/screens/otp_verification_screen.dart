
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';
import '../widgets/app_logo_widget.dart';
import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();

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
                "Enter Otp Code",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text(
                "A 4 digit otp has been sent to email",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.black),
              ),
              SizedBox(height: 26),
              PinCodeTextField(
                length: 6,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  inactiveFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,

                appContext: context,
              ),
              SizedBox(height: 8),
              ElevatedButton(onPressed:_onTapNextButton, child: Text("Next")),
              SizedBox(height: 8),
              RichText(text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey
                  ),
                  text: "This code will expire in",children: [
                TextSpan(text: "120",style: TextStyle(
                    color: AppColors.themColor
                ),),

              ]
              ),),
              TextButton(onPressed: (){}, child: Text("Resend Code"))
            ],
          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    Get.to(()=>CompleteProfileScreen());
  }


  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
