import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:core/widgets/jenis_kendaraan_dialog/jenis_kendaraan_dialog_result.dart';

class JenisKendaraanDialog extends StatefulWidget {
  final String? kdJenis;
  final String? kdMerek2;
  final String? nmModel;
  final Function({
    ReferenceData? jenisKendaraan,
    DataKodeMerek? merek,
    DataKodeModel? model,
    DataNilaiJual? nilaiJual,
  }) onSubmitCallback;

  const JenisKendaraanDialog({
    super.key,
    this.kdJenis,
    this.kdMerek2,
    this.nmModel,
    required this.onSubmitCallback,
  });

  @override
  State<JenisKendaraanDialog> createState() => _JenisKendaraanDialogState();
}

class _JenisKendaraanDialogState extends State<JenisKendaraanDialog> {
  late ApiServiceCore api = ApiServiceCore();
  List<DataNilaiJual>? dataNilaiJualItems;
  bool isLoading = false;

  ReferenceData? defaultJenisKendaraan;
  DataKodeMerek? defaultMerek;
  DataKodeModel? defaultModel;

  ReferenceData? jenisKendaraan;
  DataKodeMerek? merek;
  DataKodeModel? model;

  List<DataKodeMerek> merekOptions = [];
  List<DataKodeModel> modelOptions = [];

  @override
  void initState() {
    super.initState();
    api = ApiServiceCore();

    init();
  }

  init() async {
    try {
      isLoading = true;
      if (widget.kdJenis?.isNotEmpty ?? false) {
        defaultJenisKendaraan =
            References.select.selectJenisKendaraanV2(widget.kdJenis);
        await setMerekOptions(widget.kdJenis ?? "");
        jenisKendaraan = defaultJenisKendaraan;
        update();
      }

      if (widget.kdMerek2?.isNotEmpty ?? false) {
        await setModelOptions(
          StringUtils.handleSubString(widget.kdMerek2 ?? '', 6),
        );
        defaultMerek = References.select.selectKdMerekKb2(
          StringUtils.handleSubString(widget.kdMerek2 ?? '', 6),
          merekOptions,
        );
        merek = defaultMerek;
        update();
      }

      if (widget.nmModel?.isNotEmpty ?? false) {
        defaultModel = References.select.selectNmModel(
          widget.nmModel,
          modelOptions,
        );
        model = defaultModel;
        update();
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      showInfoDialog(e.toString());
    }
  }

  onSubmit() async {
    widget.onSubmitCallback(
      jenisKendaraan: jenisKendaraan,
      merek: merek,
      model: model,
    );

    try {
      showCircleDialogLoading();
      final res =
          await api.nilaiJual(kdMerekKb: model?.merekkbKdMerekKb2 ?? "");
      Get.back();

      if (res.data == null) {
        throw CustomExceptionDio("Data tidak ditemukan");
      }

      dataNilaiJualItems = (res.data ?? [])
        ..sort((a, b) =>
            (b.nljualThBuatan ?? '').compareTo(a.nljualThBuatan ?? ''));
      update();
      return;
    } catch (e) {
      Get.back();
      showInfoDialog(e.toString());
    }
  }

  setMerekOptions(String kdJenis) async {
    try {
      KodeMerekModel res = await api.kdMerek(kdJenis: kdJenis);
      setState(() {
        merekOptions = res.data ?? [];
      });
    } catch (e) {
      showInfoDialog(e.toString());
    }
  }

  setModelOptions(String? kdMerekKb) async {
    try {
      KodeModelResult res = await api.kdModel(kdMerekKb: kdMerekKb ?? "");

      setState(() {
        modelOptions = res.data ?? [];
      });
    } catch (e) {
      showInfoDialog(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: ScrollController(),
      child: SelectionArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cari Jenis Kendaraan',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  BaseTertiaryButton(
                    isDense: true,
                    onPressed: () {
                      jenisKendaraan = defaultJenisKendaraan;
                      merek = defaultMerek;
                      model = defaultModel;
                      merekOptions = [];
                      modelOptions = [];
                      update();
                    },
                    text: "Reset",
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              BaseDropdownButton<ReferenceData>(
                items: References.list.setJenisKendaraanV2(),
                label: "Jenis Kendaraan",
                sortItem: true,
                hint: "Pilih jenis kendaraan",
                value: jenisKendaraan,
                onChanged: (p0) {
                  setState(() {
                    jenisKendaraan = p0;
                    merek = null;
                    model = null;
                    merekOptions = [];
                    modelOptions = [];
                  });

                  setMerekOptions(p0?.jeniskbKdJenisKb ?? "");
                },
                itemAsString: (p0) => p0.jenisKendaraanAsString(),
              ),
              const SizedBox(
                height: 16,
              ),
              BaseDropdownButton<DataKodeMerek>(
                key: ValueKey([
                  "merek",
                  merekOptions,
                  merek,
                ]),
                items: merekOptions,
                label: "Merek",
                sortItem: true,
                enabled: merekOptions.isNotEmpty,
                hint: "Pilih merek",
                value: merek,
                onChanged: (p0) {
                  setState(() {
                    merek = p0;
                    model = null;
                    modelOptions = [];
                  });
                  setModelOptions(p0?.merekkbKdMerekKb2);
                },
                itemAsString: (p0) => p0.dataKodeMerekAsString(),
              ),
              const SizedBox(
                height: 16,
              ),
              BaseDropdownButton<DataKodeModel>(
                key: ValueKey([
                  "model",
                  modelOptions,
                ]),
                items: modelOptions,
                label: "Model",
                sortItem: true,
                enabled: modelOptions.isNotEmpty,
                hint: "Pilih model",
                value: model,
                onChanged: (p0) {
                  setState(() {
                    model = p0;
                  });
                },
                itemAsString: (p0) => p0.dataKodeModelAsString(),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    color: isDarkModeCheck(context,
                        darkModeValue: null, lightModeValue: gray50),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        8,
                      ),
                      bottomRight: Radius.circular(
                        8,
                      ),
                    )),
                child: BasePrimaryButton(
                  onPressed: model == null ? null : onSubmit,
                  text: "Cari Data",
                  suffixIcon: MediaRes.icons.misc.search,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (dataNilaiJualItems != null)
                JenisKendaraanDialogResult(
                  items: dataNilaiJualItems ?? [],
                  onItemClick: (nilaiJual) {
                    widget.onSubmitCallback(
                      jenisKendaraan: jenisKendaraan,
                      merek: merek,
                      model: model,
                      nilaiJual: nilaiJual,
                    );
                    Get.back();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
