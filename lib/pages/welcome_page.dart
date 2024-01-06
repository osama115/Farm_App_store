import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/pages/home_page.dart';
import 'package:vegitable_app_test1/presentation/assets_manager.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(AppSize.s12),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                ImageAssets.onboarding,
                width: AppSize.s380,
              ),
              Spacer(),
              Text(
                AppString.welcomeToAgricplant,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.s25),
                child: Text(AppString.getYouragricultureProduct),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
                },
                icon: Icon(IconlyLight.login),
                label: Text(AppString.continueWithLogin),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
