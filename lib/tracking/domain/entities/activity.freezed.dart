// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Activity {
  String get title => throw _privateConstructorUsedError;
  String get maxValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get svgPath => throw _privateConstructorUsedError;
  int get color =>
      throw _privateConstructorUsedError; // @Default(Chart.lineChart) Chart chart,
  String get startDate => throw _privateConstructorUsedError;
  Map<String, String> get values => throw _privateConstructorUsedError;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call(
      {String title,
      String maxValue,
      String unit,
      String svgPath,
      int color,
      String startDate,
      Map<String, String> values});
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? maxValue = null,
    Object? unit = null,
    Object? svgPath = null,
    Object? color = null,
    Object? startDate = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
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
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityImplCopyWith<$Res>
    implements $ActivityCopyWith<$Res> {
  factory _$$ActivityImplCopyWith(
          _$ActivityImpl value, $Res Function(_$ActivityImpl) then) =
      __$$ActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String maxValue,
      String unit,
      String svgPath,
      int color,
      String startDate,
      Map<String, String> values});
}

/// @nodoc
class __$$ActivityImplCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$ActivityImpl>
    implements _$$ActivityImplCopyWith<$Res> {
  __$$ActivityImplCopyWithImpl(
      _$ActivityImpl _value, $Res Function(_$ActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? maxValue = null,
    Object? unit = null,
    Object? svgPath = null,
    Object? color = null,
    Object? startDate = null,
    Object? values = null,
  }) {
    return _then(_$ActivityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
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
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$ActivityImpl implements _Activity {
  const _$ActivityImpl(
      {this.title = 'No Info',
      this.maxValue = 'No Info',
      this.unit = 'No Info',
      this.svgPath = 'No Info',
      this.color = 0,
      required this.startDate,
      final Map<String, String> values = const {}})
      : _values = values;

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String maxValue;
  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey()
  final String svgPath;
  @override
  @JsonKey()
  final int color;
// @Default(Chart.lineChart) Chart chart,
  @override
  final String startDate;
  final Map<String, String> _values;
  @override
  @JsonKey()
  Map<String, String> get values {
    if (_values is EqualUnmodifiableMapView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_values);
  }

  @override
  String toString() {
    return 'Activity(title: $title, maxValue: $maxValue, unit: $unit, svgPath: $svgPath, color: $color, startDate: $startDate, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.svgPath, svgPath) || other.svgPath == svgPath) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, maxValue, unit, svgPath,
      color, startDate, const DeepCollectionEquality().hash(_values));

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      __$$ActivityImplCopyWithImpl<_$ActivityImpl>(this, _$identity);
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {final String title,
      final String maxValue,
      final String unit,
      final String svgPath,
      final int color,
      required final String startDate,
      final Map<String, String> values}) = _$ActivityImpl;

  @override
  String get title;
  @override
  String get maxValue;
  @override
  String get unit;
  @override
  String get svgPath;
  @override
  int get color; // @Default(Chart.lineChart) Chart chart,
  @override
  String get startDate;
  @override
  Map<String, String> get values;

  /// Create a copy of Activity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityImplCopyWith<_$ActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
