// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:base/beranda/controller/beranda_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FormSearchWidget extends StatefulWidget {
  final BerandaController controller;
  const FormSearchWidget({super.key, required this.controller});

  @override
  State<FormSearchWidget> createState() => _FormSearchWidgetState();
}

class _FormSearchWidgetState extends State<FormSearchWidget> {
  @override
  Widget build(BuildContext context) {
    BerandaController controller = widget.controller;
    return TextField(
      controller: controller.searchController,
      focusNode: controller.focusNode,
      decoration: InputDecoration(
        hintText: 'Cari restoran...',
        prefixIcon: controller.isSearching
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  controller.focusNode.unfocus();
                  controller.searchController.clear();
                },
              )
            : const Icon(Icons.search),
        suffixIcon: controller.searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: controller.searchController.clear,
              )
            : null,
        filled: true,
        fillColor: linear2nd,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
