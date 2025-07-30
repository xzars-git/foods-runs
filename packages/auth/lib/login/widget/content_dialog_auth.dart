import 'package:auth/login/controller/login_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContentDialogAuth extends StatefulWidget {
  const ContentDialogAuth({super.key});

  @override
  State<ContentDialogAuth> createState() => _ContentDialogAuthState();
}

class _ContentDialogAuthState extends State<ContentDialogAuth> {
  final TextEditingController inputPinController = TextEditingController();
  final TextEditingController pinController = TextEditingController(
    text: "25091971",
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Beralih Mode",
              style: Get.theme.textTheme.headlineMedium?.copyWith(
                color: primaryGreen,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            BaseForm(
              label: "PIN",
              hintText: "Masukkan PIN",
              textEditingController: inputPinController,
              textInputType: TextInputType.number,
              textInputFormater: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: Validatorless.multiple([
                Validatorless.required("PIN tidak boleh kosong"),
                Validatorless.compare(pinController, "Pin Salah")
              ]),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: BaseSecondaryButton(
                    text: "Kembali",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: BasePrimaryButton(
                    text: "Simpan",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.back();
                        LoginController.instance.authPin();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
