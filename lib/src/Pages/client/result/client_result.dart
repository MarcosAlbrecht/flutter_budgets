import 'package:app_orcamento/src/models/client_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_result.freezed.dart';

@freezed
class ClientResult with _$ClientResult {
  factory ClientResult.success(String sucesso) = Success;
  factory ClientResult.error(String message) = Error;
}
