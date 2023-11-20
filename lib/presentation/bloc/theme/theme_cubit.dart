import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/no_params.dart';
import '../../../domain/usecases/get_theme.dart';
import '../../../domain/usecases/update_theme.dart';

enum Themes { light, dark }

class ThemeCubit extends Cubit<Themes> {
  final GetTheme getTheme;
  final UpdateTheme updateTheme;

  ThemeCubit({
    required this.getTheme,
    required this.updateTheme,
  }) : super(Themes.dark);

  Future<void> toggleTheme() async {
    await updateTheme(state == Themes.dark ? 'light' : 'dark');
    loadPreferredTheme();
  }

  Future<void> loadPreferredTheme() async {
    final response = await getTheme(NoParams());
    response.when(
      success: (data) => {
        emit(data == 'dark' ? Themes.dark : Themes.light)
      },
      error: (message, type) => {
        emit(Themes.dark)
      }
    );
  }
}
