import 'package:flutter/material.dart';
import './manager/navigatorManager.dart';
import './utils/screen.dart';
import './utils/valueOf.dart';
import './utils/log.dart';
import './components/appBar.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => getState();

  BasePageState getState();
}

abstract class BasePageState<T extends BasePage> extends State<T> with WidgetsBindingObserver, ValueOf, LogUtil, AppBarComponent {
  double uiWidth;
  double uiHeight;
  bool _onResumed = false; /// 页面展示标记
  bool _onPause = false; /// 页面暂停标记

  State get state => this;

  /// 页面实现具体的页面布局
  Widget buildWidget(BuildContext context);

  @override
  void initState() {
    super.initState();
    NavigatorManager().addWidget(this);
    WidgetsBinding.instance.addObserver(this);
    _onResumed = true;
    onResume();
  }

  @override
  Widget build(BuildContext context) {
    if (!_onResumed && NavigatorManager().isTopPage(this)) {
      _onResumed = true;
    }

    if (ScreenUtil.instance != null) {
      ScreenUtil.instance = ScreenUtil(width: uiWidth ?? 750, height: uiHeight ?? 1334)..init(context);
    }

    return Scaffold(
      appBar: appBar,
      body: buildWidget(context),
    );
  }

  /// 计算UI元素尺寸
  double size(double size) {
    return ScreenUtil.getInstance().setWidth(size);
  }

  /// 计算字体尺寸
  double fontSize(double size) {
    return ScreenUtil(allowFontScaling: false).setSp(size);
  }

  @override
  void deactivate() {
    /// 页面已被覆盖
    if (NavigatorManager().isSecondTop(this)) {
      if (!_onPause) {
        onPause();
        _onPause = true;
      } else {
        onResume();
        _onPause = false;
      }
    } else if (NavigatorManager().isTopPage(this)) {
      if (!_onPause) {
        onPause();
      }
    }
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _onResumed = false;
    _onPause = false;

    /// 把改页面从 navigator Stack 中去除
    NavigatorManager().removeWidget(this);

    log(this, '页面释放');
    super.dispose();
  }

  /// 前后台切换
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    if (state == AppLifecycleState.resumed) {
      if (NavigatorManager().isTopPage(this)) {
        onForeground();
        onResume();
      }
    } else if (state == AppLifecycleState.paused) {
      if (NavigatorManager().isTopPage(this)) {
        onBackground();
        onPause();
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  /// 相当于onResume, 只要页面来到栈顶， 都会调用此方法，网络请求可以放在这个方法
  void onResume() {
    log(this, '页面恢复');
    NavigatorManager().setTopPage(this);
  }

  /// 页面被覆盖,暂停
  void onPause() {
    log(this, '页面暂停');
  }

  /// app切到后台
  void onBackground() {
    log(this, '切到后台');
  }

  /// app切回到前台
  void onForeground() {
    log(this, '回到前台');
  }
}
