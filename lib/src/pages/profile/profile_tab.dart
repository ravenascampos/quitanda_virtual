import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/utils/colors.dart';
import 'package:quitanda_virtual/src/utils/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Perfil do usuário',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsUtil.greenMaterialPrimary.shade50,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: ColorsUtil.greenMaterialPrimary.shade50,
              ),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            CustomTextField(
              icon: Icons.person,
              label: 'Nome',
              initialValue: app_data.user.name,
              readOnly: true,
            ),
            CustomTextField(
              icon: Icons.email,
              label: 'Email',
              initialValue: app_data.user.email,
              readOnly: true,
            ),
            CustomTextField(
              icon: Icons.phone,
              label: 'Celular',
              initialValue: app_data.user.phone,
              readOnly: true,
            ),
            CustomTextField(
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
              initialValue: app_data.user.cpf,
              readOnly: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SizedBox(
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
                    updatePassword();
                  },
                  child: const Text(
                    'Atualizar senha',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Atualizar senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorsUtil.greenMaterialPrimary,
                          ),
                        ),
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha Atual',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Nova senha',
                        hintText: 'Digite sua senha',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outline,
                        label: 'Confirmar nova senha',
                        hintText: 'Repita sua senha',
                        isSecret: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Confirmar',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
      },
    );
  }
}
