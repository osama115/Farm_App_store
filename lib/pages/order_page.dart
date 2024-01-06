import 'package:flutter/material.dart';
import 'package:vegitable_app_test1/data/orders.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';
import 'package:vegitable_app_test1/widget/order_item.dart';

import '../presentation/string_manager.dart';
import '../utils/enums/order.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.myOrders),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(tabs.length, (index) {
              return Tab(
                text: tabs[index],
              );
            }),
          ),
        ),
        body: TabBarView(
            children: List.generate(tabs.length, (index) {
            final filteredOrders = orders
                .where((order) => order.status == OrderStatus.values[index])
                .toList();
          return ListView.separated(
            padding: EdgeInsets.all(AppSize.s16),
            itemBuilder: (context,index){
              final order =filteredOrders[index];
                return OrderItem(order: order);
            },
            separatorBuilder: (context,index) => SizedBox(height: AppSize.s10,),
            itemCount:filteredOrders.length ,
          );
        })),
      ),
    );
  }
}
