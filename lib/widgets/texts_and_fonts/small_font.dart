import 'package:flutter/cupertino.dart';
import 'package:split_view/helpers/media-query.dart';
class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  const SmallText({Key key,  this.text,  this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontSize: displyWidth(context)*0.02),
    );
  }
}
