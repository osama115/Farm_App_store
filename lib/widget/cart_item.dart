import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

import '../model/product.dart';
import '../presentation/color_manager.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final Product cartItem;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right:AppSize.s20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
            color: ColorManager.red
        ),
        child: Icon(IconlyLight.delete,color: ColorManager.white,),
      ),
      confirmDismiss: (direction)async{
        final completer = Completer<bool>();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: AppSize.si3),
            content: Text(AppString.removeFromCart),
            action: SnackBarAction(
              label: AppString.keep  ,
              onPressed: (){
              completer.complete(false);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },),),
        );
        Timer(Duration(seconds: AppSize.si3),(){
          if(!completer.isCompleted){
            completer.complete(true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        });
        
          return await completer.future;

      },
      child: SizedBox(
        height: AppSize.s125,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: AppSize.s0_1,
          shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
          side: BorderSide(color: ColorManager.greenSh4, width: AppSize.s0_2),

        ),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s10),
            child: Row(
              children: [
                ///////image of the product ////////
                Container(
                  width: AppSize.s90,
                  height: double.infinity,
                  margin: EdgeInsets.only(right: AppSize.s15),
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(AppSize.s10),
                      image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartItem.image),
                    )
                  ),
                ),
                ///////other information////
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.name,
                        style:Theme.of(context).textTheme.titleMedium ,),
                      SizedBox(height: AppSize.s2,),
                      Text(
                        cartItem.description,
                        maxLines: AppSize.si2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${cartItem.price}",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary
                          ),),
                          SizedBox(
                            height: AppSize.s30,
                            child: ToggleButtons(
                              onPressed: (index){
                                if(index==0){
                                  //user wan to decrease quantity
                                }
                                else if(index==2){
                                  //user wan to increase quantity
                                }

                              },
                              borderRadius: BorderRadius.circular(AppSize.s100),
                                selectedColor: Theme.of(context).colorScheme.primary,
                                children: [
                                  Icon(Icons.remove,size: AppSize.s20,),
                                  Text("2"),
                                  Icon(Icons.add,size: AppSize.s20)
                                ],
                                isSelected: [true,false,true],
                            constraints: BoxConstraints(
                                maxHeight: AppSize.s30,
                                maxWidth:AppSize.s30, ),),
                          ),

                        ],
                      )


                    ],
                  ),
                )
              ],
            ),
          ),
      )
      ),
    );
  }
}
