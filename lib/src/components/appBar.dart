import 'package:flutter/material.dart';
import '../utils/generalMethod.dart';

abstract class AppBarComponent {
  AppBar _appBar;
  Function _leadingOnTap;
  State get state;
  AppBar get appBar => _appBar;

  void initAppBar({ String title, Color backgroundColor, Function leadingOnTap, List<Widget> actions }) {
    _appBar = _getAppBar(title: title, bgColor: backgroundColor, leadingClick: leadingOnTap, actions: actions);
  }

  void _leadingButtonEvent() {
    _leadingOnTap == null ? GeneralMethodUtil.popNavigator(state.context) : _leadingOnTap();
  }

  AppBar _getAppBar({ String title: '', Color bgColor, Function leadingClick, List<Widget> actions }) {
    bool isShowLeading = true;
    AppBarButton leadingButton;
    _leadingOnTap = leadingClick;

    if (Navigator.canPop(state.context) && isShowLeading) {
      leadingButton = AppBarButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onTap: _leadingButtonEvent
      );
    }

    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: isShowLeading,
      brightness: Brightness.light,
      centerTitle: true,
      backgroundColor: bgColor ?? Colors.white,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black
        ),
      ),
      leading: leadingButton,
      actions: actions != null ? actions : [],
    );
  }
}

class AppBarButton extends StatelessWidget {
  final Widget icon;
  final Function onTap;
  final double left;
  final double top;
  final double right;
  final double bottom;

  const AppBarButton({
    Key key,
    this.icon,
    this.onTap,
    this.left = 16,
    this.top = 16,
    this.right = 16,
    this.bottom = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: icon,
      ),
    );
  }
}
