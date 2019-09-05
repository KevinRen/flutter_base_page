import 'package:flutter/material.dart';
import './base/basePage.dart';

class HomePage extends BasePage {
  BasePageState<BasePage> getState() {
    return _HomePageState();
  }
}

class _HomePageState extends BasePageState<HomePage> {
  @override
  void initState() {
    uiWidth = 750.0;
    uiHeight = 1334.0;
    initAppBar(title: 'Home');
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          width: size(80),
          height: size(40),
          child: Text('Button', style: TextStyle(fontSize: fontSize(32), color: Colors.blue),),
        ),
      ),
    );
  }
}