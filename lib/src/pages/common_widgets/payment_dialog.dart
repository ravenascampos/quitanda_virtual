import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;

  PaymentDialog({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsUtil.greenMaterialPrimary,
                    ),
                  ),
                ),
                QrImage(
                  data: 'q1w2e3r4t5y6',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorsUtil.greenMaterialPrimary.shade900,
                  ),
                ),
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsUtil.greenMaterialPrimary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 2,
                        color: ColorsUtil.greenMaterialPrimary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                      size: 15,
                    ),
                    label: const Text(
                      'Copiar código Pix',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: ColorsUtil.greenMaterialPrimary.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
