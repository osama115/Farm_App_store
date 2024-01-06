import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/data/products.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';
import 'package:vegitable_app_test1/widget/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItem =products.take(AppSize.s4).toList();
    final totalPrice =
    cartItem.map((e) => e.price).reduce((value, element) => value+element);
    return Scaffold(
      body:ListView(
        padding: EdgeInsets.all(AppSize.s16),
        children: [
         ...List.generate(cartItem.length,
                  (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSize.s10),
              child: CartItem(cartItem: cartItem[index]),
            );
                  },
          ),
          const SizedBox(height: AppSize.s15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total (${cartItem.length})"),
              Text("\$$totalPrice",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary
              ),)
            ],
          ),
          SizedBox(height: AppSize.s20,),
          FilledButton.icon(onPressed: (){},
              icon: Icon(IconlyBold.arrow_right),
              label: Text(AppString.proceedToCheckOut))


        ],
      )
    );
  }
}
