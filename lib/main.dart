import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/auth/sign_in_screen.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

void main() {
  runApp(const GreenGrocer());
}

class GreenGrocer extends StatelessWidget {
  const GreenGrocer({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greengrocer',
      theme: ThemeData(
          primarySwatch: ColorsUtil.greenMaterialPrimary,
          scaffoldBackgroundColor: ColorsUtil.greenMaterialPrimary.shade50),
      home: const SignInScreen(),
    );
  }
}
