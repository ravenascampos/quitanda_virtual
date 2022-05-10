import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/cart/cart_tab.dart';
import 'package:quitanda_virtual/src/pages/home/home_tab.dart';
import 'package:quitanda_virtual/src/pages/orders/orders_tab.dart';
import 'package:quitanda_virtual/src/pages/profile/profile_tab.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeTab(),
            CartTab(),
            OrdersTab(),
            ProfileTab(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorsUtil.greenMaterialPrimary,
          selectedItemColor: ColorsUtil.greenMaterialPrimary.shade50,
          unselectedItemColor:
              ColorsUtil.greenMaterialPrimary.shade50.withAlpha(100),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: 'Carrinho',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Pedidos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
