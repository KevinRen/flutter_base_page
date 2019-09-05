import 'package:flutter/material.dart';
import '../base/basePage.dart';
import '../pages/about.dart';

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
        onTap: () {
          log(this, 'Button on tap');
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AboutPage({'data': 'aaa'})));
        },
        child: Container(
          width: size(320),
          height: size(80),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(size(10))),
          ),
          alignment: Alignment.center,
          child: Text(
            'Go to about page',
            style: TextStyle(fontSize: fontSize(32), color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}