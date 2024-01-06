import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/pages/order_page.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
        // profile image
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s25,bottom: AppSize.s15),

            child: CircleAvatar(
              radius: AppSize.s62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: CircleAvatar(
                radius: AppSize.s60,
                foregroundImage: NetworkImage('https://cdn1.vectorstock.com/i/1000x1000/56/35/young-man-casual-avatar-vector-14695635.jpg'),
              ),
            ),
          ),
          Center(
            child: Text(AppString.osamaWillmis,
            style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(AppString.osamaWillmisgmail,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(height: AppSize.s25,),
          ListTile(
            title: Text(AppString.myOrders),
            leading: Icon(IconlyLight.bag),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>const OrderPage()));
            },
          ),
          ListTile(
            title: Text(AppString.aboutUs),
            leading: Icon(IconlyLight.info_square),
            onTap: (){},
          ),
          ListTile(
            title: Text(AppString.logout),
            leading: Icon(IconlyLight.logout),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
