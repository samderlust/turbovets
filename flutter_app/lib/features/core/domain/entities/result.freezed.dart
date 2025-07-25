// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$T>()';
}


}

/// @nodoc
class $ResultCopyWith<T,$Res>  {
$ResultCopyWith(Result<T> _, $Res Function(Result<T>) __);
}


/// Adds pattern-matching-related methods to [Result].
extension ResultPatterns<T> on Result<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ResultValue<T> value)?  value,TResult Function( _ResultFailed<T> value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultValue() when value != null:
return value(_that);case _ResultFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ResultValue<T> value)  value,required TResult Function( _ResultFailed<T> value)  failed,}){
final _that = this;
switch (_that) {
case _ResultValue():
return value(_that);case _ResultFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ResultValue<T> value)?  value,TResult? Function( _ResultFailed<T> value)?  failed,}){
final _that = this;
switch (_that) {
case _ResultValue() when value != null:
return value(_that);case _ResultFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T value)?  value,TResult Function( Object error,  StackTrace st)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultValue() when value != null:
return value(_that.value);case _ResultFailed() when failed != null:
return failed(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T value)  value,required TResult Function( Object error,  StackTrace st)  failed,}) {final _that = this;
switch (_that) {
case _ResultValue():
return value(_that.value);case _ResultFailed():
return failed(_that.error,_that.st);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T value)?  value,TResult? Function( Object error,  StackTrace st)?  failed,}) {final _that = this;
switch (_that) {
case _ResultValue() when value != null:
return value(_that.value);case _ResultFailed() when failed != null:
return failed(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class _ResultValue<T> implements Result<T> {
   _ResultValue(this.value);
  

 final  T value;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultValueCopyWith<T, _ResultValue<T>> get copyWith => __$ResultValueCopyWithImpl<T, _ResultValue<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultValue<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'Result<$T>.value(value: $value)';
}


}

/// @nodoc
abstract mixin class _$ResultValueCopyWith<T,$Res> implements $ResultCopyWith<T, $Res> {
  factory _$ResultValueCopyWith(_ResultValue<T> value, $Res Function(_ResultValue<T>) _then) = __$ResultValueCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class __$ResultValueCopyWithImpl<T,$Res>
    implements _$ResultValueCopyWith<T, $Res> {
  __$ResultValueCopyWithImpl(this._self, this._then);

  final _ResultValue<T> _self;
  final $Res Function(_ResultValue<T>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(_ResultValue<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _ResultFailed<T> implements Result<T> {
   _ResultFailed(this.error, this.st);
  

 final  Object error;
 final  StackTrace st;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultFailedCopyWith<T, _ResultFailed<T>> get copyWith => __$ResultFailedCopyWithImpl<T, _ResultFailed<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultFailed<T>&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'Result<$T>.failed(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class _$ResultFailedCopyWith<T,$Res> implements $ResultCopyWith<T, $Res> {
  factory _$ResultFailedCopyWith(_ResultFailed<T> value, $Res Function(_ResultFailed<T>) _then) = __$ResultFailedCopyWithImpl;
@useResult
$Res call({
 Object error, StackTrace st
});




}
/// @nodoc
class __$ResultFailedCopyWithImpl<T,$Res>
    implements _$ResultFailedCopyWith<T, $Res> {
  __$ResultFailedCopyWithImpl(this._self, this._then);

  final _ResultFailed<T> _self;
  final $Res Function(_ResultFailed<T>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? st = null,}) {
  return _then(_ResultFailed<T>(
null == error ? _self.error : error ,null == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace,
  ));
}


}

// dart format on
