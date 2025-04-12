import 'package:crafty_bay_app/presentation/state_holders/email_verification_controller.dart';
import 'package:crafty_bay_app/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay_app/presentation/ui/utils/snack_message.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:crafty_bay_app/presentation/ui/widgets/centered_circular_progress_indicator.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: InputDecoration(hintText: "Email"),
                  validator: (String? value) {
                    // TODO
                    if (value?.isEmpty ?? true) {
                      return "Enter your email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8),
                GetBuilder<EmailVerificationController>(
                  builder: (emailVerificationController) {
                    return Visibility(
                      visible: !emailVerificationController.inProgress,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapNextButton,
                        child: Text("Next"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    bool result = await _emailVerificationController.verifyEmail(
      _emailTEController.text.trim(),
    );
    if (result) {
      Get.to(
        () => OtpVerificationScreen(email: _emailTEController.text.trim()),
      );
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          _emailVerificationController.errorMessage!,
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
