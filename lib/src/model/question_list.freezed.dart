// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionList _$QuestionListFromJson(Map<String, dynamic> json) {
  return _QuestionList.fromJson(json);
}

/// @nodoc
mixin _$QuestionList {
  int get total => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionListCopyWith<QuestionList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionListCopyWith<$Res> {
  factory $QuestionListCopyWith(
          QuestionList value, $Res Function(QuestionList) then) =
      _$QuestionListCopyWithImpl<$Res, QuestionList>;
  @useResult
  $Res call(
      {int total, int perPage, int currentPage, List<Question> questions});
}

/// @nodoc
class _$QuestionListCopyWithImpl<$Res, $Val extends QuestionList>
    implements $QuestionListCopyWith<$Res> {
  _$QuestionListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionListImplCopyWith<$Res>
    implements $QuestionListCopyWith<$Res> {
  factory _$$QuestionListImplCopyWith(
          _$QuestionListImpl value, $Res Function(_$QuestionListImpl) then) =
      __$$QuestionListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total, int perPage, int currentPage, List<Question> questions});
}

/// @nodoc
class __$$QuestionListImplCopyWithImpl<$Res>
    extends _$QuestionListCopyWithImpl<$Res, _$QuestionListImpl>
    implements _$$QuestionListImplCopyWith<$Res> {
  __$$QuestionListImplCopyWithImpl(
      _$QuestionListImpl _value, $Res Function(_$QuestionListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? questions = null,
  }) {
    return _then(_$QuestionListImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionListImpl implements _QuestionList {
  _$QuestionListImpl(
      {required this.total,
      required this.perPage,
      required this.currentPage,
      required final List<Question> questions})
      : _questions = questions;

  factory _$QuestionListImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionListImplFromJson(json);

  @override
  final int total;
  @override
  final int perPage;
  @override
  final int currentPage;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuestionList(total: $total, perPage: $perPage, currentPage: $currentPage, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionListImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, perPage, currentPage,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionListImplCopyWith<_$QuestionListImpl> get copyWith =>
      __$$QuestionListImplCopyWithImpl<_$QuestionListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionListImplToJson(
      this,
    );
  }
}

abstract class _QuestionList implements QuestionList {
  factory _QuestionList(
      {required final int total,
      required final int perPage,
      required final int currentPage,
      required final List<Question> questions}) = _$QuestionListImpl;

  factory _QuestionList.fromJson(Map<String, dynamic> json) =
      _$QuestionListImpl.fromJson;

  @override
  int get total;
  @override
  int get perPage;
  @override
  int get currentPage;
  @override
  List<Question> get questions;
  @override
  @JsonKey(ignore: true)
  _$$QuestionListImplCopyWith<_$QuestionListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
