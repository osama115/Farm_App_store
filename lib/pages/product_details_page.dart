import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vegitable_app_test1/data/products.dart';
import 'package:vegitable_app_test1/model/product.dart';
import 'package:vegitable_app_test1/presentation/color_manager.dart';
import 'package:vegitable_app_test1/presentation/string_manager.dart';
import 'package:vegitable_app_test1/presentation/values_manager.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

int mount = 2;

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showingMore = false;
  late TapGestureRecognizer readMoreGestureRecognizer;

  @override
  void initState() {
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showingMore = !showingMore;
        });
      };
    super.initState();
  }

  @override
  void dispose() {
    readMoreGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.details,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyBroken.bookmark),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSize.s16),
        children: [
          Container(
            height: AppSize.s250,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: AppSize.s16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.product.image))),
          ),
          Text(
            widget.product.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: AppSize.s5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.avilableInStoke,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$${widget.product.price}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "/${widget.product.unit}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: AppSize.s16,
                color: ColorManager.yellow,
              ),
              Text('${widget.product.rating}(193)'),
              Spacer(),
              CircleAvatar(
                backgroundColor: ColorManager.green,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      mount--;
                    });
                  },
                  iconSize: AppSize.s18,
                  icon: Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                child: Text(
                  "$mount${widget.product.unit}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              CircleAvatar(
                backgroundColor: ColorManager.green,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      mount++;
                    });
                  },
                  iconSize: AppSize.s18,
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Text(
            AppString.description,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: AppSize.s5,
          ),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                TextSpan(
                    text: showingMore
                        ? widget.product.description
                        : "${widget.product.description.substring(AppSize.si0, widget.product.description.length - AppSize.si100)}..."),
                TextSpan(
                    recognizer: readMoreGestureRecognizer,
                    text: showingMore ? AppString.readLess : AppString.readMore,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary))
              ])),
          const SizedBox(
            height: AppSize.s20,
          ),
          Text(
            AppString.relatedProducts,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: AppSize.s10,
          ),
          SizedBox(
            height: AppSize.s90,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: AppSize.s90,
                  width: AppSize.s80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage(products[index].image))),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: AppSize.s10,
              ),
              itemCount: products.length,
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          FilledButton.icon(onPressed: (){}, icon: Icon(IconlyLight.bag_2), label:Text(AppString.addTOCart))
        ],
      ),
    );
  }
}
