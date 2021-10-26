import 'package:flutter/cupertino.dart';

MediaQueryData mediaQueryData(BuildContext context) {
  return MediaQuery.of(context);
}

Size size(BuildContext buildContext) {
  return mediaQueryData(buildContext).size;
}

double displyWidth(BuildContext buildContext) {
  return size(buildContext).width;
}

double displayHeight(BuildContext buildContext) {
  return size(buildContext).height;
}