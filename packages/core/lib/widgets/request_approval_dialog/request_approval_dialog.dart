import 'package:core/core.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';
import 'package:core/widgets/request_approval_dialog/reason_input_step.dart';
import 'package:core/widgets/request_approval_dialog/verifier_selection_step.dart';
import 'package:flutter/material.dart';

class StepData {
  final String title;
  final String desc;

  StepData({
    required this.title,
    required this.desc,
  });
}

class RequestApprovalDialog extends StatefulWidget {
  const RequestApprovalDialog({
    super.key,
    required this.onSubmitCallback,
  });

  final Function({
    required String reason,
    required List<DataPejabatPengawas?> dataPejabat,
  }) onSubmitCallback;

  @override
  State<RequestApprovalDialog> createState() => _RequestApprovalDialogState();
}

class _RequestApprovalDialogState extends State<RequestApprovalDialog> {
  // Step
  int step = 0;

  Map<int, StepData> stepDataMap = {
    0: StepData(
      title: 'Keterangan',
      desc: "Masukkan keterangan",
    ),
    1: StepData(
      title: 'Tujuan Notifikasi',
      desc: "Pilih pejabat yang akan dikirimkan notifikasi",
    )
  };

  // Form
  late final TextEditingController reasonController;

  @override
  void initState() {
    super.initState();
    reasonController = TextEditingController();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerDialog(
                  title: stepDataMap[step]?.title ?? "",
                  description: stepDataMap[step]?.desc ?? "",
                ),
                const SizedBox(
                  height: 12,
                ),
                stepDialog(currentStep: step, totalSteps: 2),
                const SizedBox(
                  height: 24,
                ),
                Builder(
                  builder: (context) {
                    if (step == 0) {
                      return ReasonInputStep(
                        reasonController: reasonController,
                        onSubmitCallback: () {
                          step = 1;
                          update();
                        },
                        onCancelCallback: () {
                          Navigator.pop(context);
                        },
                      );
                    }

                    if (step == 1) {
                      return VerifierSelectionStep(
                        onCancelCallback: () {
                          step = 0;
                          update();
                        },
                        onSubmitCallback: (p0) {
                          widget.onSubmitCallback(
                            reason: reasonController.text,
                            dataPejabat: p0,
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          )),
    );
  }

  Widget headerDialog({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          description,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ],
    );
  }

  Widget stepDialog({
    required int currentStep,
    required int totalSteps,
  }) {
    return Row(
      children: List.generate(
        totalSteps,
        (index) => Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: index <= currentStep
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              if (index < totalSteps - 1)
                const SizedBox(
                  width: 8,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
