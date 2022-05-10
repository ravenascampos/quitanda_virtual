import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

class QuatityWidget extends StatelessWidget {
  final int value;
  final String sufixText;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuatityWidget({
    Key? key,
    required this.sufixText,
    required this.value,
    required this.result,
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuatityButton(
            color: !isRemovable || value > 1
                ? Colors.grey.shade500
                : Colors.red.shade400,
            icon:
                !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
            onPressed: () {
              if (value == 1 && !isRemovable) return;
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value $sufixText',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorsUtil.greenMaterialPrimary.shade900,
              ),
            ),
          ),
          _QuatityButton(
            color: ColorsUtil.greenMaterialPrimary.shade500,
            icon: Icons.add,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuatityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuatityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: ColorsUtil.greenMaterialPrimary.shade50,
            size: 18,
          ),
        ),
      ),
    );
  }
}
