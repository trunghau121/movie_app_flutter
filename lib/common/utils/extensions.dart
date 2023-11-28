import 'package:flutter/material.dart';
import '../../presentation/app_localizations.dart';

extension StringX on String? {
  String value(){
    return this?? "";
  }

  String intelliTrim(int length) {
    if(this == null) return "";
    return this!.length > length ? '${this!.substring(0, length)}...' : this!;
  }

  String translator(BuildContext context) {
    if(this == null) return "";
    return AppLocalizations.of(context)?.translate(this!) ?? this!;
  }
}

extension BuildContextX on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double? get iconSize => IconTheme.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;
}

extension IntegerX on int?{
  int value({int defaultValue = 0}){
    return this?? defaultValue;
  }
}
