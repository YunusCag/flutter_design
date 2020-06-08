import 'package:flutter/material.dart';
import 'package:flutter_login_design/day21/utils/strings.dart';
import 'package:flutter_login_design/day21/utils/text_styles.dart';
class CustomAppBar extends StatelessWidget {
  final double opacity;

  CustomAppBar({
    Key key,
      this.opacity=0.8
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top:5,left: 16,right: 16),
          child: Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Strings.APP_NAME,
                      style: TextStyles.appNameTextStyle
                    ),
                    TextSpan(
                      text: "\n"
                    ),
                    TextSpan(
                      text: Strings.TAG_LINE,
                      style: TextStyles.tagLineTextStyle
                    )
                  ]
                ),
              ),
              Spacer(),
              Icon(
                Icons.menu,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
