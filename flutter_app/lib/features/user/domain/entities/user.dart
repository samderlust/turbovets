import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
@freezed
sealed class User with _$User {
  factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String avatarUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
