import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/constants/languages.dart';
import 'package:movie_app_flutter/common/utils/extensions.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../../theme/theme.dart';
import '../../../bloc/cast_crew/cast_crew_cubit.dart';
import '../../../bloc/cast_crew/cast_crew_state.dart';
import 'item_cast_widget.dart';

class CastCrewWidget extends StatelessWidget {
  const CastCrewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCrewCubit, CastCrewState>(builder: (context, state) {
      if (state is CastCrewLoaded) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: Sizes.dimen_16, bottom: Sizes.dimen_16),
                child: Text(
                  Languages.cast.translator(context),
                  style: PrimaryFont.medium(Sizes.dimen_18)
                      .copyWith(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.data.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 130,
                  childAspectRatio: 1 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ItemCastWidget(state.data[index]);
                },
              ),
            ),
          ],
        );
      }
      return const SizedBox.shrink();
    });
  }
}
