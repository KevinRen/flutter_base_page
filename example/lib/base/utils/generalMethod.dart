import 'package:flutter/material.dart';
import './time.dart';

class GeneralMethodUtil {
  static String _lastClassName;
  static int _lastClickTime = 0;

  /// 关闭键盘
  static void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  ///延时
  static Future delayed(num seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  /// 获取类名
  static String getClassName(BuildContext context) {
    String className = context.toString();
    if (className != null) {
      if (className.indexOf('-') > 0) {
        className = className.substring(0, className.indexOf('-'));
      }
      if (className.indexOf('(') > 0) {
        className = className.substring(0, className.indexOf('('));
      }
    }
    return className;
  }

  /// 返回
  static void popNavigator(BuildContext context) {
    String _className = getClassName(context);
    if (Navigator.canPop(context)) {
      if (_lastClassName == null) {
        _lastClassName = _className;
        Navigator.pop(context);
      } else {
        if (_lastClassName == _className) {
          if (isFastClick()) {
            _lastClassName = _className;
            Navigator.pop(context);
          }
        } else {
          _lastClassName = _className;
          Navigator.pop(context);
        }
      }
    }
  }

  static bool isFastClick() {
    int time = TimeUtil.now();
    if (time - _lastClickTime < 1000) {
      return false;
    }
    _lastClickTime = time;
    return true;
  }
}
