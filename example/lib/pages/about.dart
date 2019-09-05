import 'package:flutter/material.dart';
import '../base/basePage.dart';

class AboutPage extends BasePage {
  final Map data;

  AboutPage(this.data);

  BasePageState<BasePage> getState() {
    return _AboutPageState();
  }
}

class _AboutPageState extends BasePageState<AboutPage> {
  @override
  void initState() {
    uiWidth = 750.0;
    uiHeight = 1334.0;
    initAppBar(title: 'About');
    log(this, this.widget.data.toString());
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Text(
        'This is about page.',
        style: TextStyle(fontSize: fontSize(32)),
      ),
    );
  }
}