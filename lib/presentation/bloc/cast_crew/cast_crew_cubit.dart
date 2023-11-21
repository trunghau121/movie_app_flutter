import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/cast_crew/cast_crew_state.dart';
import '../../../domain/usecases/get_cast_crew.dart';

class CastCrewCubit extends Cubit<CastCrewState>{
  final GetCastCrew getCastCrew;
  CastCrewCubit(this.getCastCrew): super(CastCrewInit());
  Future<void> loadCastCrew(int movieId) async{
    (await getCastCrew(movieId)).when(
      success: (data) => {
        emit(CastCrewLoaded(data!))
      },
      error: (message, type){
        emit(CastCrewError(message, type));
      }
    );
  }
}