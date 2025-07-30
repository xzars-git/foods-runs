import 'package:flutter/material.dart';

const TextTheme myTextThemeLight = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: gray900,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: gray900,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: gray900,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: gray900,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: gray900,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: gray900,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: gray900,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: gray900,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: gray900,
  ),
);
const TextTheme myTextThemeDark = TextTheme(
  displayLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  headlineLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  titleLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: textHigh,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textHigh,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: textHigh,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textHigh,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textHigh,
  ),
  bodySmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textHigh,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textHigh,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textHigh,
  ),
  labelSmall: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: textHigh,
  ),
);

TextStyle bodyXSmall(context) {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );
}

// Color Light
const Color lightBackground = Color(0xffF4F4F4);
const Color appLightBackground = Color(0xffEFF2F3);

// Color Dark
const Color darkBackground = Color(0xff141616);

//Primary Pallete
const Color primaryBlue = Color(0xff1E88E5);
const Color primaryYellow = Color(0xffFFD026);
const Color primaryGreen = Color(0xff16A75C);

// Gray Pallete
const Color gray50 = Color(0xffFAFAFA);
const Color gray100 = Color(0xffF5F5F5);
const Color gray200 = Color(0xffEEEEEE);
const Color gray300 = Color(0xffE0E0E0);
const Color gray400 = Color(0xffBDBDBD);
const Color gray500 = Color(0xff9E9E9E);
const Color gray600 = Color(0xff757575);
const Color gray700 = Color(0xff616161);
const Color gray800 = Color(0xff424242);
const Color gray900 = Color(0xff212121);

// BlueGray Pallete
const Color blueGray50 = Color(0xffE3E7ED);
const Color blueGray100 = Color(0xffB9C3D3);
const Color blueGray200 = Color(0xff8D9DB5);
const Color blueGray300 = Color(0xff627798);
const Color blueGray400 = Color(0xff415C84);
const Color blueGray500 = Color(0xff1A4373);
const Color blueGray600 = Color(0xff133C6B);
const Color blueGray700 = Color(0xff083461);
const Color blueGray800 = Color(0xff022B55);
const Color blueGray900 = Color(0xff001B3D);

// Green Pallete
const Color green50 = Color(0xffE6F6EC);
const Color green100 = Color(0xffC3E9D0);
const Color green200 = Color(0xff9BDBB3);
const Color green300 = Color(0xff70CD94);
const Color green400 = Color(0xff4DC27E);
const Color green500 = Color(0xff1FB767);
const Color green600 = Color(0xff16A75C);
const Color green700 = Color(0xff069550);
const Color green800 = Color(0xff008444);
const Color green900 = Color(0xff006430);

// Red Pallete
const Color red50 = Color(0xffFFEBEE);
const Color red100 = Color(0xffFFCDD2);
const Color red200 = Color(0xffEF9A9A);
const Color red300 = Color(0xffE57373);
const Color red400 = Color(0xffEF5350);
const Color red500 = Color(0xffF44336);
const Color red600 = Color(0xffE53935);
const Color red700 = Color(0xffD32F2F);
const Color red800 = Color(0xffC62828);
const Color red900 = Color(0xffB71B1C);

// Yellow Pallete
const Color yellow50 = Color(0xffFFF9E1);
const Color yellow100 = Color(0xffFFEEB4);
const Color yellow200 = Color(0xffFFE483);
const Color yellow300 = Color(0xffFFDA4F);
const Color yellow400 = Color(0xffFFD026);
const Color yellow500 = Color(0xffFFC800);
const Color yellow600 = Color(0xffFFB900);
const Color yellow700 = Color(0xffFFA600);
const Color yellow800 = Color(0xffFF9500);
const Color yellow900 = Color(0xffFF7500);

// Blue Pallete
const Color blue50 = Color(0xffE3F2FD);
const Color blue100 = Color(0xffBBDEFB);
const Color blue200 = Color(0xff90CAF9);
const Color blue300 = Color(0xff64B5F6);
const Color blue400 = Color(0xff42A5F5);
const Color blue500 = Color(0xff2196F3);
const Color blue600 = Color(0xff1E88E5);
const Color blue700 = Color(0xff1976D2);
const Color blue800 = Color(0xff1565C0);
const Color blue900 = Color(0xff0D47A1);

// Pink Pallete
const Color pink50 = Color(0xffFFE6EC);
const Color pink100 = Color(0xffFFBFCF);
const Color pink200 = Color(0xffFF96AF);
const Color pink300 = Color(0xffFF6C8F);
const Color pink400 = Color(0xffFF4D77);
const Color pink500 = Color(0xffFD355F);
const Color pink600 = Color(0xffEC305D);
const Color pink700 = Color(0xffD62A59);
const Color pink800 = Color(0xffC12357);
const Color pink900 = Color(0xff9D1951);

// Purple Pallete
const Color purple50 = Color(0xffF3E5F5);
const Color purple100 = Color(0xffE1BEE7);
const Color purple200 = Color(0xffCE93D8);
const Color purple300 = Color(0xffBA68C8);
const Color purple400 = Color(0xffAB47BC);
const Color purple500 = Color(0xff9B27B0);
const Color purple600 = Color(0xff8D24AA);
const Color purple700 = Color(0xff7A1FA2);
const Color purple800 = Color(0xff691B9A);
const Color purple900 = Color(0xff49148C);

// Neutral Pallete
const Color neutralWhite = Color(0xffFFFFFF);
const Color neutralBlack = Color(0xff000000);

// Emphasis Pallete
const Color lowEmphasis = Color(0xff1F2121);
const Color mediumEmphasis = Color(0xff292C2A);
const Color mediumEmphasis2 = Color(0xff4F5050);
const Color highEmphasis = Color(0xffD7D7D7);

// Text Dark Pallete
const Color textLow = Color(0xff868C89);
const Color textMedium = Color(0xffAAB0B7);
const Color textHigh = Color(0xffE9E9E9);
const Color textError = Color(0xffDD5E5E);

// Other Pallete
const Color black = Color(0xff111313);
const Color active = Color(0xff20A95A);
const Color focus = Color(0xffFED32C);
const Color error = Color(0xffE53935);

var primaryColor = const Color(0xffFF0000);
var secondaryColor = const Color(0xFF2A2D3E);
var bgColor = const Color(0xFF212332);

Color appbarBackgroundColor = primaryGreen;
Color scaffoldBackgroundColor = neutralWhite;
MaterialColor primarySwatch = Colors.blueGrey;
Color drawerBackgroundColor = const Color(0xff404E67);
Color drawerFontColor = Colors.grey[300]!;

//Neutral
const colorFilterWhite = ColorFilter.mode(
  neutralWhite,
  BlendMode.srcIn,
);

//BlueGray
const colorFilterBlueGray100 = ColorFilter.mode(
  blueGray100,
  BlendMode.srcIn,
);
const colorFilterBlueGray50 = ColorFilter.mode(
  blueGray50,
  BlendMode.srcIn,
);

//Green
const colorFilterGreen900 = ColorFilter.mode(
  green900,
  BlendMode.srcIn,
);
const colorFilterGreen800 = ColorFilter.mode(
  green800,
  BlendMode.srcIn,
);
const colorFilterblue700 = ColorFilter.mode(
  blue700,
  BlendMode.srcIn,
);
const colorFilterGreen600 = ColorFilter.mode(
  green600,
  BlendMode.srcIn,
);

//Gray
const colorFilterGray900 = ColorFilter.mode(
  gray900,
  BlendMode.srcIn,
);
const colorFilterGray800 = ColorFilter.mode(
  gray800,
  BlendMode.srcIn,
);
const colorFilterGray600 = ColorFilter.mode(
  gray600,
  BlendMode.srcIn,
);
const colorFilterGray500 = ColorFilter.mode(
  gray500,
  BlendMode.srcIn,
);
const colorFilterGray400 = ColorFilter.mode(
  gray400,
  BlendMode.srcIn,
);
const colorFilterGray50 = ColorFilter.mode(
  gray50,
  BlendMode.srcIn,
);

//Blue
const colorFilterBlue800 = ColorFilter.mode(
  blue800,
  BlendMode.srcIn,
);

//Yellow
const colorFilterYellow800 = ColorFilter.mode(
  yellow800,
  BlendMode.srcIn,
);

//Red
const colorFilterRed800 = ColorFilter.mode(
  red800,
  BlendMode.srcIn,
);

ColorFilter customColorFilter({required Color color}) {
  return ColorFilter.mode(
    color,
    BlendMode.srcIn,
  );
}
