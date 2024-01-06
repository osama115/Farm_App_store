import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/widget/order_product.dart';

import '../model/order.dart';
import '../presentation/color_manager.dart';
import '../presentation/values_manager.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order,  this.visibleProduct = AppSize.si2});
  final Order order;
  final int visibleProduct;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice =
        order.products.fold(AppSize.s0, (acc, e) => acc + e.price);
    final products = order.products.take(visibleProduct).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: AppSize.s0_1,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
        side: BorderSide(color: ColorManager.greenSh4, width: AppSize.s0_2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.s10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Order: ${order.id}",
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '${order.products.length} Items',
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(
                  width: AppSize.s5,
                ),
                Text('\$${totalPrice.toStringAsFixed(2)}')
              ],
            ),
            SizedBox(
              height: AppSize.s20,
            ),
            ...List.generate(products.length, (index) {
              return OrderProduct(product: products[index], order: order);
            }),

            if (order.products.length > AppSize.si2)
              Padding(
                padding: const EdgeInsets.only(top:AppSize.s10),
                child: TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        isScrollControlled: true,
                        builder: (context){
                      return Container(
                        height: MediaQuery.of(context).size.height * AppSize.s0_5,
                        child: ListView.builder(
                            itemCount: order.products.length,
                            padding: EdgeInsets.all(AppSize.s14),
                            itemBuilder: (context,index){
                          final product =order.products[index];
                          return OrderProduct(order: order, product: product);
                        }),
                      );
                        });
                  },
                  icon: Icon(IconlyBold.arrow_right),
                  label: Text(AppString.viewAll),
                ),
              )
          ],
        ),
      ),
    );
  }
}
