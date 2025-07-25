// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatThread {

 String get id; Message get lastMessage; List<User> get participants;
/// Create a copy of ChatThread
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadCopyWith<ChatThread> get copyWith => _$ChatThreadCopyWithImpl<ChatThread>(this as ChatThread, _$identity);

  /// Serializes this ChatThread to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThread&&(identical(other.id, id) || other.id == id)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other.participants, participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lastMessage,const DeepCollectionEquality().hash(participants));

@override
String toString() {
  return 'ChatThread(id: $id, lastMessage: $lastMessage, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $ChatThreadCopyWith<$Res>  {
  factory $ChatThreadCopyWith(ChatThread value, $Res Function(ChatThread) _then) = _$ChatThreadCopyWithImpl;
@useResult
$Res call({
 String id, Message lastMessage, List<User> participants
});


$MessageCopyWith<$Res> get lastMessage;

}
/// @nodoc
class _$ChatThreadCopyWithImpl<$Res>
    implements $ChatThreadCopyWith<$Res> {
  _$ChatThreadCopyWithImpl(this._self, this._then);

  final ChatThread _self;
  final $Res Function(ChatThread) _then;

/// Create a copy of ChatThread
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lastMessage = null,Object? participants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Message,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}
/// Create a copy of ChatThread
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get lastMessage {
  
  return $MessageCopyWith<$Res>(_self.lastMessage, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatThread].
extension ChatThreadPatterns on ChatThread {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatThread value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatThread() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatThread value)  $default,){
final _that = this;
switch (_that) {
case _ChatThread():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatThread value)?  $default,){
final _that = this;
switch (_that) {
case _ChatThread() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Message lastMessage,  List<User> participants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatThread() when $default != null:
return $default(_that.id,_that.lastMessage,_that.participants);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Message lastMessage,  List<User> participants)  $default,) {final _that = this;
switch (_that) {
case _ChatThread():
return $default(_that.id,_that.lastMessage,_that.participants);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Message lastMessage,  List<User> participants)?  $default,) {final _that = this;
switch (_that) {
case _ChatThread() when $default != null:
return $default(_that.id,_that.lastMessage,_that.participants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatThread implements ChatThread {
   _ChatThread({required this.id, required this.lastMessage, required final  List<User> participants}): _participants = participants;
  factory _ChatThread.fromJson(Map<String, dynamic> json) => _$ChatThreadFromJson(json);

@override final  String id;
@override final  Message lastMessage;
 final  List<User> _participants;
@override List<User> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of ChatThread
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatThreadCopyWith<_ChatThread> get copyWith => __$ChatThreadCopyWithImpl<_ChatThread>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatThreadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThread&&(identical(other.id, id) || other.id == id)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other._participants, _participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lastMessage,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'ChatThread(id: $id, lastMessage: $lastMessage, participants: $participants)';
}


}

/// @nodoc
abstract mixin class _$ChatThreadCopyWith<$Res> implements $ChatThreadCopyWith<$Res> {
  factory _$ChatThreadCopyWith(_ChatThread value, $Res Function(_ChatThread) _then) = __$ChatThreadCopyWithImpl;
@override @useResult
$Res call({
 String id, Message lastMessage, List<User> participants
});


@override $MessageCopyWith<$Res> get lastMessage;

}
/// @nodoc
class __$ChatThreadCopyWithImpl<$Res>
    implements _$ChatThreadCopyWith<$Res> {
  __$ChatThreadCopyWithImpl(this._self, this._then);

  final _ChatThread _self;
  final $Res Function(_ChatThread) _then;

/// Create a copy of ChatThread
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lastMessage = null,Object? participants = null,}) {
  return _then(_ChatThread(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Message,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}

/// Create a copy of ChatThread
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get lastMessage {
  
  return $MessageCopyWith<$Res>(_self.lastMessage, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// @nodoc
mixin _$User {

 String get id; String get name; String get avatarUrl;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl);

@override
String toString() {
  return 'User(id: $id, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String name, String avatarUrl
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.name,_that.avatarUrl);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.name,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
   _User({required this.id, required this.name, required this.avatarUrl});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String name;
@override final  String avatarUrl;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarUrl);

@override
String toString() {
  return 'User(id: $id, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String avatarUrl
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarUrl = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
