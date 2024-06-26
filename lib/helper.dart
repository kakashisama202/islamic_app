import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/constant.dart';

extension ArabicNumerals on int {
  String toArabic() {
    final arabicNumerals = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩'
    };
    return toString()
        .split('')
        .map((char) => arabicNumerals[char] ?? char)
        .join('');
  }
}
extension Translate on int {
  String toArabicOrdinal() {
    switch (this) {
      case 1: return 'الأول';
      case 2: return 'الثاني';
      case 3: return 'الثالث';
      case 4: return 'الرابع';
      case 5: return 'الخامس';
      case 6: return 'السادس';
      case 7: return 'السابع';
      case 8: return 'الثامن';
      case 9: return 'التاسع';
      case 10: return 'العاشر';
      case 11: return 'الحادي عشر';
      case 12: return 'الثاني عشر';
      case 13: return 'الثالث عشر';
      case 14: return 'الرابع عشر';
      case 15: return 'الخامس عشر';
      case 16: return 'السادس عشر';
      case 17: return 'السابع عشر';
      case 18: return 'الثامن عشر';
      case 19: return 'التاسع عشر';
      case 20: return 'العشرون';
      case 21: return 'الحادي والعشرون';
      case 22: return 'الثاني والعشرون';
      case 23: return 'الثالث والعشرون';
      case 24: return 'الرابع والعشرون';
      case 25: return 'الخامس والعشرون';
      case 26: return 'السادس والعشرون';
      case 27: return 'السابع والعشرون';
      case 28: return 'الثامن والعشرون';
      case 29: return 'التاسع والعشرون';
      case 30: return 'الثلاثون';
      default: return 'Number out of range';
    }
  }
}

extension JuzesConverter on int {
  String toFullName() {
    final arabicNumerals = {
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩'
    };
    return toString()
        .split('')
        .map((char) => arabicNumerals[char] ?? char)
        .join('');
  }
}

extension ArabicRevelationType on String {
  String revelationTypeAr() {
    if (this == 'Meccan') {
      return 'مكية';
    } else if (this == 'Medinan') {
      return 'مدنية';
    }
    return this;
  }
}

Future<void> openUrl(
    {required String url,
    required String errorMessage,
    required BuildContext context}) async {
  final Uri url0 = Uri.parse(url);
  if (await canLaunchUrl(url0)) {
    if (await launchUrl(url0)) {
      if (context.mounted) {
        show(context: context, message: 'حدث خطأ', marginFromHorizontal: 70);
      }
    }
  } else {
    if (context.mounted) {
      show(context: context, message: errorMessage, marginFromHorizontal: 70);
    }
  }
}

void show(
    {required BuildContext context,
    required String message,
    double? marginFromHorizontal}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        margin: EdgeInsets.symmetric(horizontal: marginFromHorizontal ?? 0),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontFamily: kFontKufamRegular,
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      elevation: 0,
    ),
  );
}

String fromHijriIndexToImage(int month) {
  switch (month) {
    case 1:
      return "assets/images/hijri/0.svg";
    case 2:
      return "assets/images/hijri/1.svg";
    case 3:
      return "assets/images/hijri/2.svg";
    case 4:
      return "assets/images/hijri/3.svg";
    case 5:
      return "assets/images/hijri/4.svg";
    case 6:
      return "assets/images/hijri/5.svg";
    case 7:
      return "assets/images/hijri/6.svg";
    case 8:
      return "assets/images/hijri/7.svg";
    case 9:
      return "assets/images/hijri/8.svg";
    case 10:
      return "assets/images/hijri/9.svg";
    case 11:
      return "assets/images/hijri/10.svg";
    case 12:
      return "assets/images/hijri/11.svg";
    default:
      return "assets/images/hijri/0.svg";
  }
}

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  //static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    // debugPrint('$screenWidth');
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
