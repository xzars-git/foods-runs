import 'package:base/daftar_menu/controller/daftar_menu_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FormSearchDaftarMenuWidget extends StatefulWidget {
  final DaftarMenuController controller;
  const FormSearchDaftarMenuWidget({super.key, required this.controller});

  @override
  State<FormSearchDaftarMenuWidget> createState() => _FormSearchDaftarMenuWidgetState();
}

class _FormSearchDaftarMenuWidgetState extends State<FormSearchDaftarMenuWidget> {
  @override
  Widget build(BuildContext context) {
    DaftarMenuController controller = widget.controller;
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
