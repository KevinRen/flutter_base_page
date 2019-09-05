# base_page

为Flutter开发者提供基于页面级别的开发基类框架。



###Example

```dart
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
    initAppBar(title: 'Home');
    super.initState();
  }
  
  @override
  Widget buildWidget(BuildContext context) {
    return Center(
      child: Text(
        'This is home page.'
      ),
    );
  }
}
```



##Overview

####1. 页面生命周期

```dart
/// 页面初始化（只执行一次）
@override
  void initState() {}

/// 页面销毁
@override
  void dispose() {}

/// app切至后台
@override
	void onBackground() {}

/// app切回前台
@override
	void onForeground()

/// 页面在顶层
@override
  void onResume()

/// 页面顶层被替代
@override
	void onPause()
```



####2. 安全的取值工具

```dart
Map data = {
  'string': 'abcdefg...',
  'int': 123,
  'list': [0, 1, 2, 3],
  'map': {'items': ['string', 'int', 'list', 'map']},
  'numTrue': 1,
  'numFalse': 0
};

enum Gender {
  Male，
  Female
}

List type = ['string', 'int', 'list', 'map'];


getStr(data, 'string');
==> 'abcdefg...'
  
getNum(data, 'int');
==> 123

getList(data, 'list');
==> [0, 1, 2, 3]
  
getMap(data, 'map');
==> {'items': ['string', 'int', 'list', 'map']}

getListValue(Gender.value, 'Male');
==> 0
  
getBool(data, 'numFalse');
==> false
  
/// Map属性取值
getList(data, ['map', 'items']);
==> ['string', 'int', 'list', 'map']

/// 使用def，当取值出错时返回def
getStr(data, 'int', def: null);
==> null

/// 不使用def，当取值出错时
getStr(data, 'int');
==> ''

/// 不使用def，各方法返回值
getStr ==> ''
getNum ==> 0
getList ==> []
getMap ==> null
getBool ==> false
getListValue ==> null
  
  
```



####3. 可适配的UI尺寸计算

```dart
@override
  void initState() {
    uiWidth = 750.0;
    uiHeight = 1334.0;
    super.initState();
  }
```



####4. 可定制的AppBar

```dart
@override
  void initState() {
    initAppBar(title: 'Home', backgroundColor: Colors.blue);
    super.initState();
  }
```



####5. log输出

```dart
@override
  Widget buildWidget(BuildContext context) {
    String _text = 'text in widget';
    
    log(this, _text);
    
    return Center(
      child: Text(_text)
    );
  }
```



