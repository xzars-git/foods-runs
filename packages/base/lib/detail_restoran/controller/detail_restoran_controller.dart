import 'package:flutter/material.dart';
import '../view/detail_restoran_view.dart';

class DetailRestoranController extends State<DetailRestoranView> {
  static late DetailRestoranController instance;
  late DetailRestoranView view;

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
