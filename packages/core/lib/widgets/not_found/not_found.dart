// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(MediaRes.images.state.notFound),
        Text(
          "Data Tidak Ditemukan",
          style: Theme.of(context).textTheme.headlineSmall,
        )
      ],
    );
  }
}
