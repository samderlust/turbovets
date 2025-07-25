import 'package:freezed_annotation/freezed_annotation.dart';
part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  factory Result.value(T value) = _ResultValue<T>;
  factory Result.failed(Object error, StackTrace st) = _ResultFailed<T>;
}

// extension ResultExt on Result {
//   (bool success, Object? error) get successData => when(
//     value: (value) => (true, null),
//     failed: (error, st) => (false, error),
//   );

//   bool isSuccess() =>
//       when(value: (value) => true, failed: (error, st) => false);
// }
