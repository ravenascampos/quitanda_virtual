import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.greenMaterialPrimary,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(
                            color: ColorsUtil.greenMaterialPrimary.shade50,
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
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
                          const CustomTextField(
                            icon: Icons.person,
                            label: 'Nome',
                            hintText: 'Nome completo',
                            keyboardType: TextInputType.name,
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            label: 'Celular',
                            hintText: 'somente números',
                            inputFormatters: [phoneFormatter],
                            keyboardType: TextInputType.number,
                          ),
                          CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF',
                            hintText: 'somente números',
                            inputFormatters: [cpfFormatter],
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Cadastrar usuário',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorsUtil.greenMaterialPrimary.shade100,
                    ),
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
