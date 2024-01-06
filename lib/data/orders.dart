import 'package:vegitable_app_test1/data/products.dart';
import 'package:vegitable_app_test1/utils/enums/order.dart';

import '../model/order.dart';

List<Order> orders = [
  Order(
    "402aje5",
    products.reversed.take(3).toList(),
    DateTime.utc(2022,1,1),
    DateTime.utc(2022,2,1),
    OrderStatus.processing,
  ),
  Order(
    "920aje5",
    products.reversed.take(1).toList(),
    DateTime.utc(2022,1,1),
    DateTime.utc(2022,2,1),
    OrderStatus.processing,
  ),
  Order(
    "7695nljn",
    products.reversed.take(2).toList(),
    DateTime.utc(2022,3,1),
    DateTime.utc(2022,4,1),
    OrderStatus.picking,
  ),
  Order(
    "521aje5",
    products.reversed.take(3).toList(),
    DateTime.utc(2022,1,1),
    DateTime.utc(2022,3,1),
    OrderStatus.shipping,
  ),
  Order(
    "432aje5",
    products.reversed.take(3).toList(),
    DateTime.utc(2022,1,1),
    DateTime.utc(2022,2,1),
    OrderStatus.delivered,
  )


];
