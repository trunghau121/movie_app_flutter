import 'package:equatable/equatable.dart';

class UpdateLanguageParams extends Equatable{
  final String code;
  const UpdateLanguageParams({required this.code});
  @override
  List<Object?> get props => [code];
}