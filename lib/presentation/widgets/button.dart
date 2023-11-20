import 'package:flutter/material.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../common/constants/size_constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kColorViolet,
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20),
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: Sizes.dimen_10),
      child: InkWell(
        key: const ValueKey('main_button'),
        onTap: isEnabled ? onPressed : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_10, horizontal: Sizes.dimen_24),
          child: Text(
            text,
            style: PrimaryFont.medium(Sizes.dimen_14).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
