import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/utils_services.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.greenMaterialPrimary.shade100,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: widget.item.imgUrl,
                    child: Image.asset(widget.item.imgUrl),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(
                    32,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsUtil.greenMaterialPrimary.shade50,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.item.itemName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: ColorsUtil.greenMaterialPrimary.shade900,
                            ),
                          ),
                          QuatityWidget(
                            sufixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: (quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: ColorsUtil.greenMaterialPrimary,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description,
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorsUtil.greenMaterialPrimary.shade900,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                          ),
                          label: const Text(
                            'Adicionar ao carrinho',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorsUtil.greenMaterialPrimary.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
