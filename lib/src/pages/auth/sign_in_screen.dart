import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/auth/sign_up_screen.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/pages/base/base_screen.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/app_data.dart' as app_data;

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.greenMaterialPrimary,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                            children: [
                              TextSpan(
                                text: 'Green',
                                style: TextStyle(
                                  color:
                                      ColorsUtil.greenMaterialPrimary.shade50,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'grocer',
                                style: TextStyle(
                                  color:
                                      ColorsUtil.greenMaterialPrimary.shade900,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: ColorsUtil.greenMaterialPrimary.shade100,
                          ),
                          child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText(app_data.categories[0]),
                              FadeAnimatedText(app_data.categories[1]),
                              FadeAnimatedText(app_data.categories[2]),
                              FadeAnimatedText(app_data.categories[3]),
                              FadeAnimatedText(app_data.categories[4]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //form
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 32,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsUtil.greenMaterialPrimary.shade50,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                        hintText: 'email@email.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        hintText: 'Digite sua senha',
                        isSecret: true,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const BaseScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: ColorsUtil.greenMaterialPrimary.shade100,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Ou',
                                style: TextStyle(
                                    color: ColorsUtil
                                        .greenMaterialPrimary.shade700),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: ColorsUtil.greenMaterialPrimary.shade100,
                                thickness: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 2,
                              color: ColorsUtil.greenMaterialPrimary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
