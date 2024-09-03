// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get platform => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  int? get gitlabId => throw _privateConstructorUsedError; // For GitLab
  String? get appPassword =>
      throw _privateConstructorUsedError; // For Bitbucket
  String? get accountId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String platform,
      String domain,
      String token,
      String login,
      String avatarUrl,
      int? gitlabId,
      String? appPassword,
      String? accountId});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? domain = null,
    Object? token = null,
    Object? login = null,
    Object? avatarUrl = null,
    Object? gitlabId = freezed,
    Object? appPassword = freezed,
    Object? accountId = freezed,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gitlabId: freezed == gitlabId
          ? _value.gitlabId
          : gitlabId // ignore: cast_nullable_to_non_nullable
              as int?,
      appPassword: freezed == appPassword
          ? _value.appPassword
          : appPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String platform,
      String domain,
      String token,
      String login,
      String avatarUrl,
      int? gitlabId,
      String? appPassword,
      String? accountId});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? domain = null,
    Object? token = null,
    Object? login = null,
    Object? avatarUrl = null,
    Object? gitlabId = freezed,
    Object? appPassword = freezed,
    Object? accountId = freezed,
  }) {
    return _then(_$AccountImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      domain: null == domain
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gitlabId: freezed == gitlabId
          ? _value.gitlabId
          : gitlabId // ignore: cast_nullable_to_non_nullable
              as int?,
      appPassword: freezed == appPassword
          ? _value.appPassword
          : appPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$AccountImpl implements _Account {
  _$AccountImpl(
      {required this.platform,
      required this.domain,
      required this.token,
      required this.login,
      required this.avatarUrl,
      this.gitlabId,
      this.appPassword,
      this.accountId});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String platform;
  @override
  final String domain;
  @override
  final String token;
  @override
  final String login;
  @override
  final String avatarUrl;
  @override
  final int? gitlabId;
// For GitLab
  @override
  final String? appPassword;
// For Bitbucket
  @override
  final String? accountId;

  @override
  String toString() {
    return 'Account(platform: $platform, domain: $domain, token: $token, login: $login, avatarUrl: $avatarUrl, gitlabId: $gitlabId, appPassword: $appPassword, accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.gitlabId, gitlabId) ||
                other.gitlabId == gitlabId) &&
            (identical(other.appPassword, appPassword) ||
                other.appPassword == appPassword) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platform, domain, token, login,
      avatarUrl, gitlabId, appPassword, accountId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  factory _Account(
      {required final String platform,
      required final String domain,
      required final String token,
      required final String login,
      required final String avatarUrl,
      final int? gitlabId,
      final String? appPassword,
      final String? accountId}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get platform;
  @override
  String get domain;
  @override
  String get token;
  @override
  String get login;
  @override
  String get avatarUrl;
  @override
  int? get gitlabId;
  @override // For GitLab
  String? get appPassword;
  @override // For Bitbucket
  String? get accountId;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
