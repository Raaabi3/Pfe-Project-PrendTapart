import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle appBarTextStyle = TextStyle(
  fontSize: 17.sp.clamp(20, 34),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle headline = TextStyle(
  fontSize: 18.sp.clamp(20, 24),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle subhead = TextStyle(
  fontSize: 16.sp.clamp(16, 20),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);

TextStyle body = TextStyle(
  fontSize: 14.sp.clamp(12, 16),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);

TextStyle cardTextStyle = TextStyle(
  fontSize: 17.sp.clamp(18, 32),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  color: const Color(0xFF5D5D5D),
);

TextStyle buttonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17.sp.clamp(14, 22),
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
