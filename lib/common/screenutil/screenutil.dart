import 'package:flutter/material.dart';

class ScreenUtil {
  static late ScreenUtil _instance;
  static const int defaultWidth = 440;
  static const int defaultHeight = 1040;

  /// Size of the phone in UI Design , px
  late num uiWidthPx;
  late num uiHeightPx;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  late bool allowFontScaling;

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance;
  }

  static void init(
      BuildContext context,
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = false}) {
    _instance = ScreenUtil._();
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;
    _pixelRatio = View.of(context).devicePixelRatio;
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _statusBarHeight = MediaQuery.of(context).padding.top;
    _bottomBarHeight = MediaQuery.of(context).padding.bottom;
    _textScaleFactor = WidgetsBinding.instance.platformDispatcher.textScaleFactor;
  }

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidth => _screenWidth;

  ///The vertical extent of this size. dp
  static double get screenHeight => _screenHeight;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;


  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiHeightPx;

  double get scaleText => scaleWidth;

  /// Width function
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// Height function
  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///FontSize function
  ///@param [fontSize] UI in px.
  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  double setSp(num fontSize, {bool allowFontScalingSelf = false}) =>
      allowFontScalingSelf
          ? (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor));
}
