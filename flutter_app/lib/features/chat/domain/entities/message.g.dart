// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  text: json['text'] as String,
  sender: User.fromJson(json['sender'] as Map<String, dynamic>),
  chatThreadId: json['chatThreadId'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  file:
      (json['file'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'sender': instance.sender,
  'chatThreadId': instance.chatThreadId,
  'timestamp': instance.timestamp.toIso8601String(),
  'file': instance.file,
};
