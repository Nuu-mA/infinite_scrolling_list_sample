// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IssueListState {
  int get page => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<Issue> get issues => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IssueListStateCopyWith<IssueListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueListStateCopyWith<$Res> {
  factory $IssueListStateCopyWith(
          IssueListState value, $Res Function(IssueListState) then) =
      _$IssueListStateCopyWithImpl<$Res, IssueListState>;
  @useResult
  $Res call({int page, bool hasMore, List<Issue> issues});
}

/// @nodoc
class _$IssueListStateCopyWithImpl<$Res, $Val extends IssueListState>
    implements $IssueListStateCopyWith<$Res> {
  _$IssueListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? hasMore = null,
    Object? issues = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      issues: null == issues
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssueListStateImplCopyWith<$Res>
    implements $IssueListStateCopyWith<$Res> {
  factory _$$IssueListStateImplCopyWith(_$IssueListStateImpl value,
          $Res Function(_$IssueListStateImpl) then) =
      __$$IssueListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, bool hasMore, List<Issue> issues});
}

/// @nodoc
class __$$IssueListStateImplCopyWithImpl<$Res>
    extends _$IssueListStateCopyWithImpl<$Res, _$IssueListStateImpl>
    implements _$$IssueListStateImplCopyWith<$Res> {
  __$$IssueListStateImplCopyWithImpl(
      _$IssueListStateImpl _value, $Res Function(_$IssueListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? hasMore = null,
    Object? issues = null,
  }) {
    return _then(_$IssueListStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      issues: null == issues
          ? _value._issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
    ));
  }
}

/// @nodoc

class _$IssueListStateImpl implements _IssueListState {
  const _$IssueListStateImpl(
      {this.page = 1, this.hasMore = true, final List<Issue> issues = const []})
      : _issues = issues;

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool hasMore;
  final List<Issue> _issues;
  @override
  @JsonKey()
  List<Issue> get issues {
    if (_issues is EqualUnmodifiableListView) return _issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issues);
  }

  @override
  String toString() {
    return 'IssueListState(page: $page, hasMore: $hasMore, issues: $issues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueListStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._issues, _issues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, hasMore, const DeepCollectionEquality().hash(_issues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueListStateImplCopyWith<_$IssueListStateImpl> get copyWith =>
      __$$IssueListStateImplCopyWithImpl<_$IssueListStateImpl>(
          this, _$identity);
}

abstract class _IssueListState implements IssueListState {
  const factory _IssueListState(
      {final int page,
      final bool hasMore,
      final List<Issue> issues}) = _$IssueListStateImpl;

  @override
  int get page;
  @override
  bool get hasMore;
  @override
  List<Issue> get issues;
  @override
  @JsonKey(ignore: true)
  _$$IssueListStateImplCopyWith<_$IssueListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
