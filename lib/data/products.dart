import 'package:vegitable_app_test1/presentation/assets_manager.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

import '../model/product.dart';

List<Product> products = [
  Product(
    AppString.tractor,
    AppString.tractorDes,
    ImageAssets.trackor,
    AppSize.s235,
    AppString.day,
    AppSize.s4_35,
  ),
  Product(
    AppString.fruits,
    AppString.fruitsDes,
    ImageAssets.fruits,
    AppSize.s9_9,
    AppString.kg,
    AppSize.s3,
  ),
  Product(
    AppString.rake,
    AppString.rakeDes,
    ImageAssets.rake,
    AppSize.s8_44,
    AppString.kg,
    AppSize.s4_35,
  ),
  Product(
    AppString.seeds,
    AppString.seedsDes,
    ImageAssets.seeds,
    AppSize.s15,
    AppString.kg,
    AppSize.s5,
  ),
  Product(
    AppString.shovel,
    AppString.shovelDes,
    ImageAssets.shovel,
    AppSize.s235,
    AppString.day,
    AppSize.s3,
  ),
  Product(
    AppString.tomato,
    AppString.tomatoDes,
    ImageAssets.tomato,
    AppSize.s8_44,
    AppString.kg,
    AppSize.s4_35,
  )

];
