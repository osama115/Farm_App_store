import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vegitable_app_test1/model/order.dart';
import 'package:vegitable_app_test1/model/product.dart';
import 'package:vegitable_app_test1/pages/order_details_page.dart';

import '../presentation/values_manager.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key, required this.order, required this.product});
  final Order order;
  final Product product;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetailsPage(order: order,)));
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSize.s90,
            height: AppSize.s90,
            margin: EdgeInsets.only(right: AppSize.s15, bottom: AppSize.s15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(product.image),
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description,
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: AppSize.si2,
                ),
                SizedBox(
                  height: AppSize.s10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                          color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Qty : ${Random().nextInt(4)+1}")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
