import 'package:core/core.dart';
import 'package:flutter/material.dart';

class JenisKendaraanDialogResult extends StatefulWidget {
  final List<DataNilaiJual> items;
  final Function(DataNilaiJual) onItemClick;

  const JenisKendaraanDialogResult({
    super.key,
    required this.items,
    required this.onItemClick,
  });

  @override
  State<JenisKendaraanDialogResult> createState() =>
      _JenisKendaraanDialogResultState();
}

class _JenisKendaraanDialogResultState
    extends State<JenisKendaraanDialogResult> {
  Widget buildItem({
    required String? kdMerek,
    required String? nilaiJual,
    required String? bobot,
    required String? pkbDasar,
    required String? thBuatan,
    required Function() onClick,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                SvgPicture.asset(
                  MediaRes.images.layanan.allRoda,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${StringUtils.trimString(kdMerek)} / ${StringUtils.trimString(thBuatan)} / ${StringUtils.trimString(bobot)}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Nilai Jual: ${StringUtils.trimString(formatMoney(nilaiJual))}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      "PKB Dasar: ${StringUtils.trimString(formatMoney(pkbDasar))}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ditemukan ${widget.items.length} hasil sesuai",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(
          height: 16,
        ),
        StaggeredGrid.count(
          crossAxisCount: getValueForScreenType<int>(
            context: context,
            mobile: 1,
          ),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: widget.items.map((item) {
            return buildItem(
              kdMerek: item.nljualKdMerekKb,
              nilaiJual: item.nljualNilaiJual,
              bobot: item.nljualBobot,
              pkbDasar: item.nljualPkbDasar,
              thBuatan: item.nljualThBuatan,
              onClick: () {
                widget.onItemClick(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
