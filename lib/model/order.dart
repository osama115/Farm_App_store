import 'package:vegitable_app_test1/model/product.dart';
import 'package:vegitable_app_test1/utils/enums/order.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime deliveryDate;
  final DateTime deliveryTime;
  final OrderStatus status;

  Order(
    this.id,
    this.products,
    this.deliveryDate,
    this.deliveryTime,
    this.status,
  );
}
