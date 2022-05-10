import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/home/components/category_tile.dart';
import 'package:quitanda_virtual/src/pages/home/components/item_tile.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = app_data.categories[0];

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        //appBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 32,
              ),
              children: [
                const TextSpan(
                  text: 'Green',
                  style: TextStyle(
                    color: ColorsUtil.greenMaterialPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: 'grocer',
                  style: TextStyle(
                    color: ColorsUtil.greenMaterialPrimary.shade900,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Badge(
                  badgeColor: ColorsUtil.greenMaterialPrimary.shade700,
                  badgeContent: Text(
                    '2',
                    style: TextStyle(
                      color: ColorsUtil.greenMaterialPrimary.shade50,
                      fontSize: 12,
                    ),
                  ),
                  child: AddToCartIcon(
                    key: globalKeyCartItems,
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: ColorsUtil.greenMaterialPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: AddToCartAnimation(
          gkCart: globalKeyCartItems,
          previewCurve: Curves.ease,
          previewDuration: const Duration(milliseconds: 100),
          receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
            runAddToCardAnimation = addToCardAnimationMethod;
          },
          child: Column(
            children: [
              //campo de pesquisa
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: 'Pesquise aqui...',
                    hintStyle: TextStyle(
                      color: ColorsUtil.greenMaterialPrimary.shade500,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorsUtil.greenMaterialPrimary.shade500,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              //categorias
              Container(
                padding: const EdgeInsets.only(left: 25),
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory = app_data.categories[index];
                        });
                      },
                      category: app_data.categories[index],
                      isSelected:
                          app_data.categories[index] == selectedCategory,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: app_data.categories.length,
                ),
              ),
              //Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    16,
                  ),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5,
                  ),
                  itemCount: app_data.items.length,
                  itemBuilder: (_, index) {
                    return ItemTile(
                      item: app_data.items[index],
                      cartAnimationMethod: itemSelectedCartAnimations,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
