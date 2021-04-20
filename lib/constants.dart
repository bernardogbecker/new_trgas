import 'package:flutter/material.dart';

Color ktriblue = Color.fromRGBO(45, 55, 109, 1);
Color ktrigrey1 = Color.fromRGBO(221, 221, 221, 1);
Color ktrigrey2 = Color.fromRGBO(152, 152, 152, 1);
Color ktribolaescura = Color.fromRGBO(134, 134, 134, 1);

BoxShadow shadow0black = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.3),
  offset: Offset(6, 6),
  blurRadius: 6,
);

BoxShadow shadow0white = BoxShadow(
  color: Colors.white,
  offset: Offset(-6, -6),
  blurRadius: 6,
);

BoxShadow shadow1blue = BoxShadow(
  color: Color.fromRGBO(62, 72, 122, 0.75),
  offset: Offset(-6, -6),
  blurRadius: 6,
);

BoxShadow shadow1black = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.16),
  offset: Offset(6, 6),
  blurRadius: 6,
);

BoxShadow shadow1white = BoxShadow(
  color: Color.fromRGBO(255, 255, 255, 0.5),
  offset: Offset(-6, -6),
  blurRadius: 6,
);

TextStyle ktextTRGasStyle = TextStyle(
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.w700,
  fontSize: 40,
  color: ktrigrey2,
);

TextStyle ktextTituloStyle = TextStyle(
  fontFamily: 'ProductSans',
  fontWeight: FontWeight.w700,
  fontSize: 40,
  color: Colors.white,
);

TextStyle ktextstylePdfbutton = TextStyle(
    color: Colors.black,
    fontFamily: 'ProductSans',
    fontWeight: FontWeight.w700);
