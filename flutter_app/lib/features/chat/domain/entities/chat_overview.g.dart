// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatThread _$ChatThreadFromJson(Map<String, dynamic> json) => _ChatThread(
  id: json['id'] as String,
  lastMessage: Message.fromJson(json['lastMessage'] as Map<String, dynamic>),
  participants:
      (json['participants'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ChatThreadToJson(_ChatThread instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lastMessage': instance.lastMessage,
      'participants': instance.participants,
    };

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  name: json['name'] as String,
  avatarUrl: json['avatarUrl'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatarUrl': instance.avatarUrl,
};
