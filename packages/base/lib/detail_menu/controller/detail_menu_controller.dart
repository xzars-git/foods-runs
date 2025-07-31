import 'package:flutter/material.dart';
import '../view/detail_menu_view.dart';

class DetailMenuController extends State<DetailMenuView> {
  static late DetailMenuController instance;
  late DetailMenuView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
