import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda_virtual/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment' &&
                  !order.overdueDateTime.isBefore(DateTime.now())
              ? true
              : false,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${order.id}',
              ),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: ColorsUtil.greenMaterialPrimary.shade900,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: ColorsUtil.greenMaterialPrimary.shade100,
                    thickness: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsUtil.greenMaterialPrimary.shade900,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Total: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: utilsServices.priceToCurrency(order.total),
                    ),
                  ]),
            ),
            Visibility(
              visible: order.status == 'pending_payment' &&
                      !order.overdueDateTime.isBefore(DateTime.now())
                  ? true
                  : false,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return PaymentDialog(
                            order: order,
                          );
                        });
                  },
                  icon: Image.asset(
                    'assets/app_images/pix.png',
                    height: 18,
                    color: ColorsUtil.greenMaterialPrimary.shade50,
                  ),
                  label: Text(
                    'Ver QR Code Pix',
                    style: TextStyle(
                      color: ColorsUtil.greenMaterialPrimary.shade50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity}${orderItem.item.unit} ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsUtil.greenMaterialPrimary.shade900,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsUtil.greenMaterialPrimary,
              ),
            ),
          ),
          Text(
            utilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          )
        ],
      ),
    );
  }
}
