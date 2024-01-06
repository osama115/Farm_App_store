import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/pages/product_details_page.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

import '../model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailsPage(product: product)));
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: AppSize.s0_1,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
          side: BorderSide(color: ColorManager.greenSh4, width: AppSize.s0_2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                height: AppSize.s120,
                width: double.infinity,
                padding: const EdgeInsets.all(AppSize.s8),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(product.image), fit: BoxFit.cover)),
                child: CircleAvatar(
                  radius: AppSize.s18,
                  backgroundColor: ColorManager.greenSh,
                  child: IconButton(
                    onPressed: () {},
                    iconSize: AppSize.s18,
                    alignment: Alignment.center,
                    icon: const Icon(IconlyLight.bookmark),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSize.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: AppSize.s5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "\$${product.price}",
                                style: Theme.of(context).textTheme.bodyLarge, ),
                              TextSpan(text: "/${product.unit}",
                                style: Theme.of(context).textTheme.bodySmall, ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: AppSize.s15,
                          backgroundColor: ColorManager.green,
                            child: IconButton(
                                onPressed: (){},
                                alignment: Alignment.center,
                                iconSize: AppSize.s15,
                                color: ColorManager.white,
                                icon:const Icon(Icons.add)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
