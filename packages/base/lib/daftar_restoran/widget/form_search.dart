
import 'package:base/daftar_restoran/controller/daftar_restoran_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class FormSearchDaftarRestoWidget extends StatefulWidget {
  final DaftarRestoranController controller;
  const FormSearchDaftarRestoWidget({super.key, required this.controller});

  @override
  State<FormSearchDaftarRestoWidget> createState() => _FormSearchDaftarRestoWidgetState();
}

class _FormSearchDaftarRestoWidgetState extends State<FormSearchDaftarRestoWidget> {
  @override
  Widget build(BuildContext context) {
    DaftarRestoranController controller = widget.controller;
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
