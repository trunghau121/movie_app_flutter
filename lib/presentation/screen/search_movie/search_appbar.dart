import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/common/screenutil/screenutil.dart';
import 'package:movie_app_flutter/presentation/bloc/search_movie/search_movie_cubit.dart';
import '../../../common/constants/size_constants.dart';
import '../../../theme/theme.dart';

class SearchAppbar extends StatefulWidget {
  const SearchAppbar({super.key});

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  late TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      context.read<SearchMovieCubit>().getSearchMovies(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_10,
          right: Sizes.dimen_10),
      padding: const EdgeInsets.only(bottom: Sizes.dimen_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding: EdgeInsets.all(Sizes.dimen_10),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _onSearchChanged(value);
                });
              },
              controller: _controller,
              style: PrimaryFont.semiBold(Sizes.dimen_18)
                  .copyWith(color: Colors.white),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: kColorViolet.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.dimen_16),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Nhập từ khóa tìm kiếm",
                  contentPadding: const EdgeInsets.all(Sizes.dimen_10),
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            _controller.clear();
                          },
                          icon: const Icon(Icons.cancel, color: Colors.grey),
                        )
                      : null,
                  hintStyle: PrimaryFont.semiBold(Sizes.dimen_18)
                      .copyWith(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
