import 'package:flutter/material.dart';
import './time.dart';
import './generalMethod.dart';

class LogUtil {
  void log(State state, String content) {
    print('${GeneralMethodUtil.getClassName(state.context)} ${TimeUtil.getTime(TimeUtil.now(), 'yyyy-MM-dd HH:mm:ss:SSS')} - ${content}');
  }
}
