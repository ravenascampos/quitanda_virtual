import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/pages/product/product_screen.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/utils_services.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;
  final GlobalKey imageGk = GlobalKey();

  ItemTile({
    Key? key,
    required this.item,
    required this.cartAnimationMethod,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductScreen(
                    item: item,
                  );
                },
              ),
            );
          },
          child: Card(
            color: Colors.white,
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(
                        item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),
                  Text(
                    item.itemName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsUtil.greenMaterialPrimary.shade900,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(item.price),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsUtil.greenMaterialPrimary,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ColorsUtil.greenMaterialPrimary.shade900,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              cartAnimationMethod(imageGk);
            },
            child: Container(
              height: 40,
              width: 35,
              decoration: const BoxDecoration(
                color: ColorsUtil.greenMaterialPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: ColorsUtil.greenMaterialPrimary.shade50,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
