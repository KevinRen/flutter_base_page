import '../basePage.dart';
import '../utils/generalMethod.dart';

/// 这个管理类，只是标记 当前 按照顺序放入和移除栈名称，并不是页面跳转后退 的功能， 只是方便 推算、表示生命周期方法
class NavigatorManager {
  List<String> _activityStack = new List<String>();

  BasePageState _baseWidgetState;
  Map _gotoPushData;

  NavigatorManager._internal();

  static NavigatorManager _singleton = new NavigatorManager._internal();

  factory NavigatorManager() => _singleton;

  void addWidget(BasePageState widget) {
    _activityStack.add(GeneralMethodUtil.getClassName(widget.context));
  }

  void removeWidget(BasePageState widget) {
    _activityStack.remove(GeneralMethodUtil.getClassName(widget.context));
  }

  void setTopPage(BasePageState state) {
    _baseWidgetState = state;
  }

  BasePageState getTopPage() {
    return _baseWidgetState;
  }

  void setPushData(Map data) {
    _gotoPushData = data;
  }

  Map getPushData() {
    Map data = _gotoPushData;
    _gotoPushData = null;
    return data;
  }

  bool isTopPage(BasePageState widgetName) {
    if (_activityStack == null) {
      return false;
    }
    try {
      return GeneralMethodUtil.getClassName(widgetName.context) == _activityStack[_activityStack.length - 1];
    } catch (exception) {
      return false;
    }
  }

  bool isSecondTop(BasePageState widgetName) {
    if (_activityStack == null) {
      return false;
    }
    try {
      return GeneralMethodUtil.getClassName(widgetName.context) == _activityStack[_activityStack.length - 2];
    } catch (exception) {
      return false;
    }
  }
}
