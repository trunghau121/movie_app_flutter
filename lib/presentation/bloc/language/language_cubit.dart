import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/domain/entities/update_language_params.dart';
import 'package:movie_app_flutter/domain/usecases/get_language.dart';
import '../../../common/constants/languages.dart';
import '../../../domain/entities/language_entity.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/update_language.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<Locale> {
  final GetLanguage getLanguage;
  final UpdateLanguage updateLanguage;

  LanguageCubit({
    required this.getLanguage,
    required this.updateLanguage,
  }) : super(Locale(Languages.languages[0].code));

  Future<void> toggleLanguage(LanguageEntity language) async {
    await updateLanguage(UpdateLanguageParams(code: language.code));
    loadPreferredLanguage();
  }

  void loadPreferredLanguage() async {
    final response = await getLanguage(NoParams());
    response.when(
        success: (data) => {emit(Locale(data ?? Languages.languages[0].code))},
        error: (message, type) => {Locale(Languages.languages[0].code)});
  }
}
