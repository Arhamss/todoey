import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kHeadingStyle = GoogleFonts.comfortaa(
  textStyle: const TextStyle(
      color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
);
TextStyle kHeadingStyle2 = GoogleFonts.comfortaa(
  textStyle: const TextStyle(
      color: Color(0xFF575A70), fontSize: 24, fontWeight: FontWeight.w500),
);

TextStyle kCardTextStyle = GoogleFonts.comfortaa(
  textStyle: const TextStyle(
      color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
);

const KTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kCardTextColor = Color(0xFF7D80AA);
const kBottomBarHeight = 80.0;
const kBottomCardColor = Color(0xFFEB1555);
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
