import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/pages/cart_page.dart';
import 'package:vegitable_app_test1/pages/explore_page.dart';
import 'package:vegitable_app_test1/pages/profile_page.dart';
import 'package:vegitable_app_test1/pages/services_page.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/font_manager.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfilePage()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppString.hiWelson,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppString.enjoyYourService,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSize.s0_8),
            child: IconButton(
                onPressed: () {},
                icon: badges.Badge(
                    badgeContent: Text(
                      "3", /////////////
                      style: TextStyle(
                          color: ColorManager.white, fontSize: FontSize.s12),
                    ),
                    badgeStyle:
                        badges.BadgeStyle(badgeColor: ColorManager.green),
                    position: badges.BadgePosition.topEnd(
                        top: AppSize.s_15, end: AppSize.s_12),
                    child: const Icon(IconlyBroken.notification))),
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            currentIndex =index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon:Icon(IconlyBold.home) ,
            label: AppString.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.call),
            activeIcon: Icon(IconlyBold.call),
            label: AppString.services,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            activeIcon: Icon(IconlyBold.buy),
            label: AppString.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(IconlyBold.profile),
            label: AppString.profile,
          ),
        ],
      ),
    );
  }
}
