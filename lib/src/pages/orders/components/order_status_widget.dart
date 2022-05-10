import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _StatusDot(
        isActive: true,
        title: 'Pedido Confirmado',
      ),
      const _CustomDivider(),
      if (currentStatus == 1) ...[
        _StatusDot(
          isActive: true,
          isCanceled: true,
          title: 'Pix estornado',
          customColor: Colors.red.shade400,
        ),
      ] else if (isOverdue) ...[
        _StatusDot(
          isActive: true,
          isCanceled: true,
          title: 'Pagamento Pix vencido',
          customColor: Colors.red.shade400,
        ),
      ] else ...[
        _StatusDot(
          isActive: currentStatus >= 2,
          title: 'Pagamento',
        ),
        const _CustomDivider(),
        _StatusDot(
          isActive: currentStatus >= 3,
          title: 'Preparando',
        ),
        const _CustomDivider(),
        _StatusDot(
          isActive: currentStatus >= 4,
          title: 'Envio',
        ),
        const _CustomDivider(),
        _StatusDot(
          isActive: currentStatus == 5,
          title: 'Entregue',
        ),
      ]
    ]);
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 3,
      color: ColorsUtil.greenMaterialPrimary.shade100,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? customColor;
  final bool isCanceled;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.customColor,
    this.isCanceled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade500,
            ),
            color: isActive
                ? customColor ?? ColorsUtil.greenMaterialPrimary.shade200
                : Colors.transparent,
          ),
          child: isActive
              ? Icon(
                  isCanceled ? Icons.close : Icons.check,
                  size: 13,
                  color: ColorsUtil.greenMaterialPrimary.shade50,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? customColor ?? ColorsUtil.greenMaterialPrimary
                  : ColorsUtil.greenMaterialPrimary.shade900,
            ),
          ),
        ),
      ],
    );
  }
}
