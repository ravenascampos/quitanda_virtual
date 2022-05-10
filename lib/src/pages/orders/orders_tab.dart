import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/orders/components/order_tile.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/app_data.dart' as app_data;

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pedidos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsUtil.greenMaterialPrimary.shade50,
            ),
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: app_data.orders.length,
          itemBuilder: (_, index) {
            return OrderTile(
              order: app_data.orders[index],
            );
          },
        ),
      ),
    );
  }
}
