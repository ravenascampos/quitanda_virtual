import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/utils_services.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItem;
  final Function(int) updateQuantity;

  CartTile({
    Key? key,
    required this.cartItem,
    required this.updateQuantity,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          cartItem.item.itemName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorsUtil.greenMaterialPrimary.shade900,
          ),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(cartItem.totalPrice()),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorsUtil.greenMaterialPrimary,
          ),
        ),
        trailing: QuatityWidget(
          sufixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: updateQuantity,
          isRemovable: true,
        ),
      ),
    );
  }
}
