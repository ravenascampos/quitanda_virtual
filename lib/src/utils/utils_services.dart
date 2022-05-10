import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

class UtilsServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: 'pt_BR',
    );

    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  void showToast({
    required String message,
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorsUtil.greenMaterialPrimary.shade50,
      textColor: isError
          ? Colors.red.shade400
          : ColorsUtil.greenMaterialPrimary.shade900,
      fontSize: 14,
    );
  }
}
