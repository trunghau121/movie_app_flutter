import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import 'package:movie_app_flutter/theme/theme.dart';
import '../../common/constants/languages.dart';
import '../../common/constants/size_constants.dart';
import 'button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: Sizes.dimen_12,
      insetPadding: const EdgeInsets.all(Sizes.dimen_32),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_8),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: Sizes.dimen_4,
          left: Sizes.dimen_16,
          right: Sizes.dimen_16,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: Sizes.dimen_16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Sizes.dimen_10),
            Text(
              title.translator(context),
              style: PrimaryFont.medium(18).copyWith(color: Colors.white),
            ),
            const SizedBox(height: Sizes.dimen_10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_6),
              child: Text(
                description.translator(context),
                textAlign: TextAlign.center,
                style: PrimaryFont.light(16).copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: Sizes.dimen_10),
            if (image != null) image!,
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: Languages.okay.translator(context)
            ),
          ],
        ),
      ),
    );
  }
}
