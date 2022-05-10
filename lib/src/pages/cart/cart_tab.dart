import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/cart/components/cart_tile.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/utils_services.dart';
import 'package:quitanda_virtual/src/utils/app_data.dart' as app_data;

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  double cartTotalPrice() {
    double total = 0;
    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Carrinho',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsUtil.greenMaterialPrimary.shade50,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: app_data.cartItems.length,
                itemBuilder: (_, index) {
                  return CartTile(
                      cartItem: app_data.cartItems[index],
                      updateQuantity: (newQuantity) {
                        final cartItem = app_data.cartItems[index];
                        setState(() {
                          if (newQuantity == 0) {
                            app_data.cartItems.remove(cartItem);
                            utilsServices.showToast(
                                message:
                                    '${cartItem.item.itemName} removido(a) do carrinho');
                          } else {
                            cartItem.quantity = newQuantity;
                          }
                        });
                      });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsUtil.greenMaterialPrimary.shade100,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorsUtil.greenMaterialPrimary.shade700,
                    offset: const Offset(0, 2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtil.greenMaterialPrimary.shade900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      utilsServices.priceToCurrency(cartTotalPrice()),
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: ColorsUtil.greenMaterialPrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () async {
                        bool? result = await showOrderConfirmation();

                        if (result ?? false) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return PaymentDialog(
                                order: app_data.orders.last,
                              );
                            },
                          );
                        } else {
                          utilsServices.showToast(
                            message: 'Pedido não confirmado',
                            isError: true,
                          );
                        }
                      },
                      child: const Text(
                        'Concluir Pedido',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> showOrderConfirmation() async {
    var shouldReturn = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Confirmação',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsUtil.greenMaterialPrimary.shade900,
            ),
          ),
          content: Text(
            'Deseja concluir o pedido?',
            style: TextStyle(
              color: ColorsUtil.greenMaterialPrimary.shade900,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'Não',
                style: TextStyle(
                  color: Colors.red.shade400,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Confirmar'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        );
      },
    );

    return shouldReturn;
  }
}
