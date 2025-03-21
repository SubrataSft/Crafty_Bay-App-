
import 'package:crafty_bay_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
                "Complete Profile",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text(
                "Get started with us by providing your information",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.black),
              ),
              SizedBox(height: 26),
              TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "First Name")),
              SizedBox(height: 8),
              TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Last Name")),
              SizedBox(height: 8),
              TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Mobile")),
              SizedBox(height: 8),
              TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "City")),
              SizedBox(height: 8),
              TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(hintText: "Shipping address")),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed: _onTapCompleteButton,
                child: Text("Complete"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onTapCompleteButton(){

  }
  @override
  void dispose() {
    super.dispose();
  }
}
