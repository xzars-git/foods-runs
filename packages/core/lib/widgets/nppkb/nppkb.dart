import 'package:core/core.dart';
import 'package:flutter/material.dart';

class Nppkb {
  Widget headerNppkb({
    required BuildContext context,
    required String title,
    required String subtitle,
    Color? color,
  }) {
    color ??= Theme.of(context).colorScheme.onSurface;

    return Column(
      children: [
        Text(
          "BADAN PENDAPATAN DAERAH",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
              ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
              ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        LineDash(
          color: color,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  Widget bodyNppkb({
    required BuildContext context,
    required List<NppkbBodyModel> listDataBody,
    Color? color,
  }) {
    color ??= Theme.of(context).colorScheme.onSurface;

    return ListView.builder(
      itemCount: listDataBody.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                listDataBody[index].title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      height: 1.5,
                    ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ":",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: color,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (listDataBody[index].content != null)
                          Text(
                            listDataBody[index].subtitle,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: color,
                                      height: 1.5,
                                    ),
                          ),
                        if (listDataBody[index].content == null)
                          Expanded(
                            child: Text(
                              listDataBody[index].subtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: color,
                                    height: 1.5,
                                  ),
                            ),
                          ),
                        if (listDataBody[index].content != null)
                          const SizedBox(
                            width: 8.0,
                          ),
                        if (listDataBody[index].content != null)
                          listDataBody[index].content ?? Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget bodyRincian({
    required BuildContext context,
    required List<RincianNppkbBodyModel> listRincianNppkb,
    required RincianNppkbBodyModel dataJumlah,
    required String total,
    Color? color,
    Color? colorDivider,
  }) {
    color ??= Theme.of(context).colorScheme.onSurface;
    colorDivider ??= Theme.of(context).colorScheme.outline;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "DGN RINCIAN SBB",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: color,
                      ),
                ),
              ),
              Expanded(
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        width: 0,
                        color: colorDivider,
                        thickness: 1,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "POKOK",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: color,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      VerticalDivider(
                        width: 0,
                        color: colorDivider,
                        thickness: 1,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "DENDA",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: color,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: listRincianNppkb.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _rowRincian(
              context,
              listRincianNppkb[index],
              color,
            );
          },
        ),
        const SizedBox(
          height: 8.0,
        ),
        LineDash(
          color: color,
        ),
        const SizedBox(
          height: 8.0,
        ),
        _rowRincian(
          context,
          dataJumlah,
          color,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "TOTAL",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: color,
                      height: 1.5,
                    ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        ":",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: color,
                              height: 1.5,
                            ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Rp",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: color,
                              height: 1.5,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    total,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: color,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ],
    );
  }

  Widget footerNppkb({
    required BuildContext context,
    required String ditetapkanDi,
    required String petugasPenetapan,
    String? idPerangkat,
    Color? color,
    Color? colorDivider,
  }) {
    color ??= Theme.of(context).colorScheme.onSurface;

    return Column(
      children: [
        const SizedBox(
          height: 8.0,
        ),
        LineDash(
          color: color,
        ),
        const SizedBox(
          height: 8.0,
        ),
        _rowFooter(
          context,
          "DITETAPKAN DI",
          ditetapkanDi,
          color,
        ),
        _rowFooter(
          context,
          "PETUGAS PENETAPAN",
          petugasPenetapan,
          color,
        ),
        if (StringUtils.trimString(idPerangkat).toString().isNotEmpty)
          _rowFooter(
            context,
            "ID PERANGKAT",
            StringUtils.trimString(idPerangkat),
            color,
          )
      ],
    );
  }

  Widget _rowFooter(
    BuildContext context,
    String title,
    String subtitle,
    Color? color,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  height: 1.5,
                ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text(
                  ":",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: color,
                        height: 1.5,
                      ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: color,
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowRincian(
    BuildContext context,
    RincianNppkbBodyModel dataRincianNppkb,
    Color? color,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            dataRincianNppkb.title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color,
                  height: 1.5,
                ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    ":",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: color,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    "Rp",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: color,
                          height: 1.5,
                        ),
                  ),
                ],
              ),
              Text(
                dataRincianNppkb.pokok,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  dataRincianNppkb.isDisableRp ? "" : "Rp",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: color,
                        height: 1.5,
                      ),
                ),
              ),
              Text(
                dataRincianNppkb.denda,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      height: 1.5,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NppkbBodyModel {
  final String title;
  final String subtitle;
  final Widget? content;

  NppkbBodyModel({
    required this.title,
    required this.subtitle,
    this.content,
  });
}

class RincianNppkbBodyModel {
  final String title;
  final String pokok;
  final String denda;
  final bool isDisableRp;

  RincianNppkbBodyModel({
    required this.title,
    required this.pokok,
    required this.denda,
    this.isDisableRp = false,
  });
}
