import 'package:flutter/material.dart';
import 'package:flutter_login_design/day21/utils/text_styles.dart';
class SubscriptionContainer extends StatelessWidget {
  final String amount,text,imagePath;

  SubscriptionContainer({
    Key key,
    this.amount,
    this.text,
    this.imagePath
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        //image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.fitWidth)
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.srcATop,

              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
                width: width-32,
                height: height*0.6/4,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.subscriptionTextStyle,
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(
                        "\$$amount",
                      style: TextStyles.subscriptionAmountTextStyle,

                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
