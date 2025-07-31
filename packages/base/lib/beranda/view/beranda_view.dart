import 'package:core/themes/theme_config.dart';
import 'package:flutter/material.dart';
import '../controller/beranda_controller.dart';

class BerandaView extends StatefulWidget {
  const BerandaView({super.key});

  Widget build(context, BerandaController controller) {
    controller.view = this;

    return Scaffold(backgroundColor: neutralWhite, body: Container());
  }

  @override
  State<BerandaView> createState() => BerandaController();
}
