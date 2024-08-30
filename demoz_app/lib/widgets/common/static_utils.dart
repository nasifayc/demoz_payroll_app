import 'package:demoz_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StaticUtils {
  static Shimmer getShimmerEffect(AppTheme theme, {double height = 100}) {
    return Shimmer.fromColors(
      baseColor: theme.accent3,
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
            color: theme.accent2, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
