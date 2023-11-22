import '../../common/result.dart';
import '../entities/no_params.dart';
import '../repositories/app_repository.dart';
import 'usecase.dart';

class GetTheme extends UseCase<String, NoParams> {
  final AppRepository appRepository;
  GetTheme(this.appRepository);

  @override
  Future<Result<String>> call(NoParams params){
    return appRepository.getPreferredTheme();
  }
}
