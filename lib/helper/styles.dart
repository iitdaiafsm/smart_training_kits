import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle({
  Color? color,
  required BuildContext context,
  FontSize? fontSize,
  bool isBold = false,
  bool isItalic = false,
  bool haveUnderline = false,
  double? height,
}) {
  return GoogleFonts.ubuntu(
    color: color ?? Theme.of(context).shadowColor,
    fontSize: _getFontSize(fontSize ?? FontSize.H4, context),
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    height: height,
    decoration: haveUnderline ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textStyleTitle({
  Color? color,
  required BuildContext context,
  FontSize? fontSize,
  bool isBold = false,
  bool isItalic = false,
  bool haveUnderline = false,
}) {
  return GoogleFonts.sourceSans3(
    color: color ?? Theme.of(context).shadowColor,
    fontSize: _getFontSize(fontSize ?? FontSize.H4, context),
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    decoration: haveUnderline ? TextDecoration.underline : TextDecoration.none,
  );
}

TextStyle textStyleLogo({
  Color? color,
  required BuildContext context,
  FontSize? fontSize,
  bool isBold = true,
  bool isItalic = false,
  bool haveUnderline = false,
}) {
  return GoogleFonts.koulen(
    color: color ?? Theme.of(context).shadowColor,
    fontSize: _getFontSize(fontSize ?? FontSize.H4, context),
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    decoration: haveUnderline ? TextDecoration.underline : TextDecoration.none,
  );
}

_getFontSize(FontSize fontSize, BuildContext context) {
  switch (fontSize) {
    case FontSize.H1:
      if (width(context) > height(context)) {
        return (height(context) * 4) / 100;
      } else {
        return (width(context) * 4) / 100;
      }

    case FontSize.H2:
      if (width(context) > height(context)) {
        return (height(context) * 3.8) / 100;
      } else {
        return (width(context) * 3.8) / 100;
      }

    case FontSize.H3:
      if (width(context) > height(context)) {
        return (height(context) * 3.6) / 100;
      } else {
        return (width(context) * 3.6) / 100;
      }

    case FontSize.H4:
      if (width(context) > height(context)) {
        return (height(context) * 3.4) / 100;
      } else {
        return (width(context) * 3.4) / 100;
      }

    case FontSize.H5:
      if (width(context) > height(context)) {
        return (height(context) * 3.2) / 100;
      } else {
        return (width(context) * 3.2) / 100;
      }

    case FontSize.H6:
      if (width(context) > height(context)) {
        return (height(context) * 3) / 100;
      } else {
        return (width(context) * 3) / 100;
      }
    case FontSize.H7:
      if (width(context) > height(context)) {
        return (height(context) * 2.8) / 100;
      } else {
        return (width(context) * 2.8) / 100;
      }

    case FontSize.H8:
      if (width(context) > height(context)) {
        return (height(context) * 2.6) / 100;
      } else {
        return (width(context) * 2.6) / 100;
      }
    case FontSize.H9:
      if (width(context) > height(context)) {
        return (height(context) * 2) / 100;
      } else {
        return (width(context) * 2) / 100;
      }
    case FontSize.LOGO:
      if (width(context) > height(context)) {
        return (height(context) * 4.5) / 100;
      } else {
        return (width(context) * 4.5) / 100;
      }
  }
}

double width(BuildContext context) => MediaQuery.of(context).size.width;
double height(BuildContext context) => MediaQuery.of(context).size.height;

double getWidth(double size, BuildContext context) {
  if (width(context) > height(context)) {
    return (height(context) * size) / 100;
  } else {
    return (width(context) * size) / 100;
  }
}

double getHeight(double size, BuildContext context) {
  if (width(context) > height(context)) {
    return (width(context) * size) / 100;
  } else {
    return (height(context) * size) / 100;
  }
}

enum FontSize {
  H1,
  H2,
  H3,
  H4,
  H5,
  H6,
  H7,
  H8,
  H9,
  LOGO,
}
