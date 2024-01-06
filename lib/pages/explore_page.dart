import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/data/products.dart';
import 'package:vegitable_app_test1/presentation/assets_manager.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';
import 'package:vegitable_app_test1/widget/product_card.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppSize.s16),
        children: [
          //filter and search bar in this row//
          Padding(
            padding: const EdgeInsets.only(bottom:AppSize.s15),
            child: Row(
              children: [
                Expanded(
                    child:TextFormField(
                  decoration: const InputDecoration(
                    hintText: AppString.searchHere,
                    isDense: true,
                    prefixIcon: Icon(IconlyLight.search),
                    contentPadding:  EdgeInsets.all(AppSize.s12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s100)),
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(left:AppSize.s12),
                  child: CircleAvatar(
                    backgroundColor: ColorManager.green,
                    child: IconButton(
                      onPressed:() {},
                      icon: const Icon(IconlyLight.filter),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Consultation CARD//
          Padding(
            padding: const EdgeInsets.only(bottom: AppSize.s15),
            child: SizedBox(
              height: AppSize.s170,
              child: Card(
                color: ColorManager.greenSh,
                elevation: AppSize.s0_1,
                shadowColor: ColorManager.greenSh,
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(AppString.freeConsultation,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.greenSh7
                            ),),),
                            Expanded(child: Text(AppString.getFreeSupportFromOurCustomerService)),
                            Expanded(
                              child: FilledButton(
                                onPressed: (){},
                                child: const Text(AppString.callNow),
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(ImageAssets.contactt_us,
                      width: AppSize.s140,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.featuredProducts,
              style: Theme.of(context).textTheme.titleMedium,),
              TextButton(onPressed: (){}, child: const Text(AppString.seeAll))
            ],
          ),
          //Feature products//
          GridView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: AppSize.si2,
                 crossAxisSpacing: AppSize.s16,
                 //mainAxisExtent: AppSize.s16,
                childAspectRatio: AppSize.s0_9
              ),
              itemBuilder: (context,index){
            return ProductCard(product: products[index],);
          })

        ],
      ),
    );
  }
}
