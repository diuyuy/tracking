// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserTracking {
  String get dateTime => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get svgPath => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  Chart get chart => throw _privateConstructorUsedError;

  /// Create a copy of UserTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserTrackingCopyWith<UserTracking> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTrackingCopyWith<$Res> {
  factory $UserTrackingCopyWith(
          UserTracking value, $Res Function(UserTracking) then) =
      _$UserTrackingCopyWithImpl<$Res, UserTracking>;
  @useResult
  $Res call(
      {String dateTime,
      String title,
      String value,
      String unit,
      String svgPath,
      int color,
      Chart chart});
}

/// @nodoc
class _$UserTrackingCopyWithImpl<$Res, $Val extends UserTracking>
    implements $UserTrackingCopyWith<$Res> {
  _$UserTrackingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? title = null,
    Object? value = null,
    Object? unit = null,
    Object? svgPath = null,
    Object? color = null,
    Object? chart = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      svgPath: null == svgPath
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      chart: null == chart
          ? _value.chart
          : chart // ignore: cast_nullable_to_non_nullable
              as Chart,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTrackingImplCopyWith<$Res>
    implements $UserTrackingCopyWith<$Res> {
  factory _$$UserTrackingImplCopyWith(
          _$UserTrackingImpl value, $Res Function(_$UserTrackingImpl) then) =
      __$$UserTrackingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateTime,
      String title,
      String value,
      String unit,
      String svgPath,
      int color,
      Chart chart});
}

/// @nodoc
class __$$UserTrackingImplCopyWithImpl<$Res>
    extends _$UserTrackingCopyWithImpl<$Res, _$UserTrackingImpl>
    implements _$$UserTrackingImplCopyWith<$Res> {
  __$$UserTrackingImplCopyWithImpl(
      _$UserTrackingImpl _value, $Res Function(_$UserTrackingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserTracking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? title = null,
    Object? value = null,
    Object? unit = null,
    Object? svgPath = null,
    Object? color = null,
    Object? chart = null,
  }) {
    return _then(_$UserTrackingImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      svgPath: null == svgPath
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      chart: null == chart
          ? _value.chart
          : chart // ignore: cast_nullable_to_non_nullable
              as Chart,
    ));
  }
}

/// @nodoc

class _$UserTrackingImpl implements _UserTracking {
  const _$UserTrackingImpl(
      {this.dateTime = 'No Info',
      this.title = 'No Info',
      this.value = 'No Info',
      this.unit = 'No Info',
      this.svgPath = 'No Info',
      this.color = 0xFF0000,
      this.chart = Chart.none});

  @override
  @JsonKey()
  final String dateTime;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey()
  final String svgPath;
  @override
  @JsonKey()
  final int color;
  @override
  @JsonKey()
  final Chart chart;

  @override
  String toString() {
    return 'UserTracking(dateTime: $dateTime, title: $title, value: $value, unit: $unit, svgPath: $svgPath, color: $color, chart: $chart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTrackingImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.svgPath, svgPath) || other.svgPath == svgPath) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.chart, chart) || other.chart == chart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dateTime, title, value, unit, svgPath, color, chart);

  /// Create a copy of UserTracking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTrackingImplCopyWith<_$UserTrackingImpl> get copyWith =>
      __$$UserTrackingImplCopyWithImpl<_$UserTrackingImpl>(this, _$identity);
}

abstract class _UserTracking implements UserTracking {
  const factory _UserTracking(
      {final String dateTime,
      final String title,
      final String value,
      final String unit,
      final String svgPath,
      final int color,
      final Chart chart}) = _$UserTrackingImpl;

  @override
  String get dateTime;
  @override
  String get title;
  @override
  String get value;
  @override
  String get unit;
  @override
  String get svgPath;
  @override
  int get color;
  @override
  Chart get chart;

  /// Create a copy of UserTracking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserTrackingImplCopyWith<_$UserTrackingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
