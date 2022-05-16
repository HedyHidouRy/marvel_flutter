import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

// final mainStyle = GoogleFonts.comfortaa();

TextTheme defaultTextTheme(BuildContext context) => GoogleFonts.kanitTextTheme(
      Theme.of(context).textTheme,
    );

final mainStyle = GoogleFonts.kanit();

final marvelStyle = TextStyle(fontFamily: 'Marvel');

final regularStyle =
    mainStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 15);

final mediumStyle =
    mainStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 16);

final boldStyle = mainStyle.copyWith(fontWeight: FontWeight.w700, fontSize: 18);

final extraBoldStyle =
    mainStyle.copyWith(fontWeight: FontWeight.w800, fontSize: 18);
