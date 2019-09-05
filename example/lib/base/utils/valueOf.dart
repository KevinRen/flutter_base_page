
abstract class ValueOf {
  static const String _TAG = "###ValueOf###";

  dynamic getListValue(List values, int index, {def}) {
    if (index < 0 || index > values.length) {
      return def;
    } else {
      return values[index];
    }
  }

  num getNum(Map map, dynamic keys, {def}) {
    dynamic returnValue = _getValue(map, keys);
    if (returnValue is String) {
      try {
        returnValue = int.parse(returnValue);
      } catch (e, s) {
        e('getNum error : $e', _TAG);
        e('Stack trace:\n $s', _TAG);
        returnValue = 0;
      }
    } else if (returnValue == null || !(returnValue is num)) {
      returnValue = def ? def : 0;
    }
    return returnValue;
  }

  bool getBool(Map map, dynamic keys, {def}) {
    dynamic returnValue = _getValue(map, keys);
    if (returnValue is num) {
      returnValue = returnValue > 0;
    } else if (returnValue == null || !(returnValue is bool)) {
      returnValue = def ? def : false;
    }
    return returnValue;
  }

  String getStr(Map map, dynamic keys, {def}) {
    dynamic returnValue = _getValue(map, keys);
    if (returnValue == null) {
      returnValue = def ? def : '';
    } else {
      returnValue = returnValue.toString();
    }
    return returnValue;
  }

  Map getMap(Map map, dynamic keys, {def}) {
    dynamic returnValue = _getValue(map, keys);
    if (returnValue != null && returnValue is Map) {
      returnValue = Map.from(returnValue);
    } else {
      returnValue = def ? def : null;
    }
    return returnValue;
  }

  List getList(Map map, dynamic keys, {def}) {
    dynamic returnValue = _getValue(map, keys);
    if (returnValue != null && returnValue is List) {
      returnValue = List.from(returnValue);
    } else {
      returnValue = def ? def : List();
    }
    return returnValue;
  }

  ///取值兼容方法 getValue(map,["key1","key2"])
  static _getValue(Map map, dynamic keys) {
    dynamic returnValue;
    try {
      if (keys is String) {
        keys = [
          keys
        ];
      }
      if (keys != null && keys.length > 0) {
        for (int i = 0; i < keys.length; i++) {
          String key = keys[i];
          if (map != null && map.isNotEmpty && map.containsKey(key)) {
            if (key.isNotEmpty && i == keys.length - 1) {
              returnValue = map[key];
            } else {
              if (map[key] is Map) {
                map = map[key];
              } else {
                break;
              }
            }
          } else {
            break;
          }
        }
      }
    } catch (e, s) {
      e('getValue error : $e', _TAG);
      e('Stack trace:\n $s', _TAG);
      returnValue = null;
    }
    return returnValue;
  }

  bool isEmpty(Object object) {
    if (object == null) return true;
    if (object is String && object.isEmpty) {
      return true;
    } else if (object is List && object.isEmpty) {
      return true;
    } else if (object is Map && object.isEmpty) {
      return true;
    }
    return false;
  }
}
