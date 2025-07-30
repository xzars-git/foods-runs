import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ReasonInputStep extends StatefulWidget {
  final TextEditingController reasonController;
  final Function() onSubmitCallback;
  final Function() onCancelCallback;

  const ReasonInputStep({
    super.key,
    required this.reasonController,
    required this.onSubmitCallback,
    required this.onCancelCallback,
  });

  @override
  State<ReasonInputStep> createState() => _ReasonInputStepState();
}

class _ReasonInputStepState extends State<ReasonInputStep> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // BaseCardInfo(
          //   text: Text(
          //     "Tambahkan gambar pendukung perubahan data master. Gambar akan dijadikan bukti sebagai pertimbangan pejabat pengawas untuk melakukan verifikasi.",
          //     style: Theme.of(context).textTheme.bodyMedium,
          //   ),
          //   pathIconPrefix: MediaRes.icons.message.info,
          //   type: DataColorType.info,
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
          BaseForm(
            textEditingController: widget.reasonController,
            label: "Alasan Perubahan Data",
            maxLenght: 250,
            maxLines: 5,
            hintText: "Masukkan alasan perubahan data",
            validator: Validatorless.required(
              "Alasan perubahan data tidak boleh kosong",
            ),
            onChanged: (value) {},
          ),

          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: BaseSecondaryButton(
                  onPressed: () {
                    widget.onCancelCallback();
                  },
                  text: "Periksa Kembali",
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: BasePrimaryButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.onSubmitCallback();
                    }
                  },
                  text: "Lanjutkan",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
