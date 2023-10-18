import 'package:freezed_annotation/freezed_annotation.dart';

part 'clients_result.freezed.dart';

@freezed
class ClientsResult<T> with _$ClientsResult<T> {
  factory ClientsResult.success(List<T> data) = Success;
  factory ClientsResult.error(String message) = Error;
}
