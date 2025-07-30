import 'package:flutter/material.dart';

class ContainerDefaultInputNopol extends StatefulWidget {
  const ContainerDefaultInputNopol({
    super.key,
  });

  @override
  State<ContainerDefaultInputNopol> createState() =>
      _ContainerDefaultInputNopolState();
}

class _ContainerDefaultInputNopolState
    extends State<ContainerDefaultInputNopol> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            127,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   isDarkMode(context)
          //       ? MediaRes.icons.infoProgresif.pajakDark
          //       : MediaRes.icons.infoProgresif.pajak,
          //   height: 136,
          // ),
          const SizedBox(height: 16.0),
          Text(
            "Tidak ada data kendaraan bermotor.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          RichText(
            text: TextSpan(
              text: "Silakan cari data menggunakan ",
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: "Nomor Polisi.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
