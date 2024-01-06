import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vegitable_app_test1/data/services.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/font_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppSize.s12),
      itemCount: services.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppSize.si2,
          crossAxisSpacing: AppSize.s14,
          mainAxisSpacing: AppSize.s14,
          childAspectRatio: AppSize.s0_85),
      itemBuilder: (context, index) {
        final service = services[index];
        return Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(AppSize.s10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(service.image))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s10),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: AppSize.s5,sigmaY: AppSize.s5),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s10,vertical: AppSize.s5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                  color: ColorManager.white.withOpacity(AppSize.s0_2),
                ),
                child: Text(service.name,
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s16
                ),),
              ),
            ),
          ),
        );
      },
    );
  }
}
