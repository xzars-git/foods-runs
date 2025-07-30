import 'package:core/core.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifierSelectionStep extends StatefulWidget {
  final Function() onCancelCallback;
  final Function(List<DataPejabatPengawas?>) onSubmitCallback;

  const VerifierSelectionStep({
    super.key,
    required this.onCancelCallback,
    required this.onSubmitCallback,
  });

  @override
  State<VerifierSelectionStep> createState() => _VerifierSelectionStepState();
}

class _VerifierSelectionStepState extends State<VerifierSelectionStep> {
  final List<DataPejabatPengawas?> _selectedPejabat = [null];

  void _addPejabat() {
    setState(() {
      _selectedPejabat.add(null);
    });
  }

  void _removePejabat(int index) {
    setState(() {
      _selectedPejabat.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(_selectedPejabat.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 5,
                  child: BaseDropdownButton<DataPejabatPengawas>(
                    enabled: true,
                    items: References.list.setListPejabatPengawas(),
                    sortItem: false,
                    label: 'Pejabat',
                    hint: 'Pilih pejabat',
                    value: _selectedPejabat[index],
                    onChanged: (value) {
                      setState(() {
                        _selectedPejabat[index] = value;
                      });
                    },
                    itemAsString: (value) => value.getNameAndPhoneNumber(),
                    validator:
                        Validatorless.required('Pejabat tidak boleh kosong'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: BaseSecondaryDangerButton(
                    onPressed: _selectedPejabat.length <= 1
                        ? null
                        : () {
                            _removePejabat(index);
                          },
                    prefixIcon: MediaRes.icons.misc.close,
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 16),
        BaseSecondaryButton(
          onPressed: _addPejabat,
          text: "Tambah Penerima",
          suffixIcon: MediaRes.icons.misc.add,
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
                onPressed: _selectedPejabat.isEmpty ||
                        _selectedPejabat.any((item) => item == null)
                    ? null
                    : () {
                        widget.onSubmitCallback(_selectedPejabat);
                      },
                text: "Lanjutkan",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
