import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/data/orders.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';
import 'package:vegitable_app_test1/utils/enums/order.dart';
import 'package:vegitable_app_test1/utils/extention/date.dart';
import 'package:vegitable_app_test1/widget/order_item.dart';

import '../model/order.dart';
import '../presentation/string_manager.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    const steps = OrderStatus.values;
    final activeStep = steps.indexOf(order.status);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.orderPage),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSize.s16),
        children: [
          EasyStepper(
            stepRadius: AppSize.s10,
            defaultLineColor: ColorManager.grey30,
            lineLength: (MediaQuery.of(context).size.width*AppSize.s0_7/steps.length),
            activeStep:
            activeStep == steps.length-AppSize.si1 ? activeStep+AppSize.si1 : activeStep,
            activeStepTextColor: ColorManager.black,
            finishedStepTextColor: Theme.of(context).colorScheme.primary,
            steps: List.generate(
                steps.length,
                    (index) {
                  return EasyStep(
                    icon:const Icon(Icons.local_shipping),
                    finishIcon:const Icon(Icons.done),
                    title: steps[index].name,
                    topTitle: true,
                  );
            }),
          ),
          SizedBox(height: AppSize.s10,),
      Card(
        clipBehavior: Clip.antiAlias,
        elevation: AppSize.s0_1,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
          side: BorderSide(color: ColorManager.greenSh4, width: AppSize.s0_2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppSize.s5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("order ${order.id}",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    Chip(
                        shape: StadiumBorder(),
                        side:BorderSide.none ,
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(AppSize.s0_4),
                        labelPadding: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(horizontal: AppSize.s10,vertical: AppSize.s0),
                        avatar: Icon(Icons.fire_truck),
                        label: Text(steps[activeStep].name))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppString.delivaryEstimate),
                  Text(order.deliveryDate.formateDate,
                  style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),

              const SizedBox(height: AppSize.s15,),

              Text(AppString.osamaWillmis,
              style: TextStyle(fontWeight:FontWeight.bold),),

              const SizedBox(height:AppSize.s5),

              Row(
                children: [
                  Icon(IconlyLight.home,size: AppSize.s15,),
                  const SizedBox(width: AppSize.s5,),
                  Expanded(
                      child: Text(AppString.addressPlace1))
                ],
              ),
              const SizedBox(width: AppSize.s5,),
              Row(
                children: [
                  Icon(IconlyLight.call,size: AppSize.s15,),
                  const SizedBox(width: AppSize.s5,),
                  Expanded(
                      child: Text(AppString.phoneNumber))
                ],
              ),
              const SizedBox(height: AppSize.s25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppString.paymentMethod),
                  Text(AppString.craditCard,
                  style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              // order id //
              // order status as chip

            ],
          ),
        ),
      ),
          const SizedBox(height: AppSize.s30,),
          OrderItem(order: order,visibleProduct: AppSize.si1,),
        ],
      ),
    );
  }
}
