import 'package:crafty_bay_app/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay_app/presentation/state_holders/read_profile_controller.dart';
import 'package:crafty_bay_app/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay_app/presentation/ui/utils/snack_message.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';
import '../widgets/app_logo_widget.dart';
import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();
  final ReadProfileController _readProfileController =
      Get.find<ReadProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogoWidget(),
              const SizedBox(height: 24),
              Text(
                "Enter Otp Code",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                "A 6 digit otp has been sent to email",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 26),
              PinCodeTextField(
                controller: _otpTEController, // কন্ট্রোলার যোগ করুন
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
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                appContext: context,
                onChanged: (value) {}, // onChanged কলব্যাক যোগ করুন
              ),
              const SizedBox(height: 8),
              GetBuilder<OtpVerificationController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text("Next"),
                  );
                },
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  text: "This code will expire in ",
                  children: [
                    TextSpan(
                      text: "120",
                      style: TextStyle(color: AppColors.themColor),
                    ),
                    const TextSpan(text: " seconds"),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // রিসেন্ড কোড লজিক যোগ করুন
                },
                child: const Text("Resend Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (_otpTEController.text.length != 6) {
      showSnackBarMessage(context, "Please enter 6 digit OTP");
      return;
    }

    final bool result = await _otpVerificationController.verifyOtp(
      widget.email,
      _otpTEController.text,
    );

    if (result) {
      final bool readProfileResult = await _readProfileController
          .getProfileDetails(_otpVerificationController.accessToken);
      if (readProfileResult) {
        if (_readProfileController.isProfileCompleted) {
          Get.offAll(() => MainBottomNavScreen());
        } else {
          Get.to(() => const CompleteProfileScreen());
        }
      } else {
        if (mounted) {
          showSnackBarMessage(context, _readProfileController.errorMessage!);
        }
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context, _otpVerificationController.errorMessage!);
      }
    }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}

/*import 'package:crafty_bay_app/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay_app/presentation/ui/utils/snack_message.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/app_colors.dart';
import '../widgets/app_logo_widget.dart';
import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();

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
                "A 6 digit otp has been sent to email",
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
              GetBuilder<OtpVerificationController>(
                builder: (otpVerificationController) {
                  return Visibility(
                    visible: !otpVerificationController.inProgress,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: Text("Next"),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  text: "This code will expire in",
                  children: [
                    TextSpan(
                      text: "120",
                      style: TextStyle(color: AppColors.themColor),
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: Text("Resend Code")),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    bool result = await _otpVerificationController.verifyOtp(
      widget.email,
      _otpTEController.text,
    );
    if (result) {
      Get.to(() => CompleteProfileScreen());
    } else {
      if (mounted) {
        showSnackBarMessage(context, _otpVerificationController.errorMessage!);
      }
    }
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
 */
