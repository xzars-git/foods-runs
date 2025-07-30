import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ContainerDataTidakDitemukan extends StatelessWidget {
  const ContainerDataTidakDitemukan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isDarkMode(context)
                ? MediaRes.images.state.notFoundDark
                : MediaRes.images.state.notFound,
          ),
          Text(
            "Data Tidak Ditemukan",
            style: Get.theme.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
