// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gists.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGistsVars> _$gGistsVarsSerializer = new _$GGistsVarsSerializer();

class _$GGistsVarsSerializer implements StructuredSerializer<GGistsVars> {
  @override
  final Iterable<Type> types = const [GGistsVars, _$GGistsVars];
  @override
  final String wireName = 'GGistsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGistsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.after;
    if (value != null) {
      result
        ..add('after')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GGistsVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGistsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'after':
          result.after = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GGistsVars extends GGistsVars {
  @override
  final String login;
  @override
  final String? after;

  factory _$GGistsVars([void Function(GGistsVarsBuilder)? updates]) =>
      (new GGistsVarsBuilder()..update(updates))._build();

  _$GGistsVars._({required this.login, this.after}) : super._() {
    BuiltValueNullFieldError.checkNotNull(login, r'GGistsVars', 'login');
  }

  @override
  GGistsVars rebuild(void Function(GGistsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGistsVarsBuilder toBuilder() => new GGistsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGistsVars && login == other.login && after == other.after;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, after.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGistsVars')
          ..add('login', login)
          ..add('after', after))
        .toString();
  }
}

class GGistsVarsBuilder implements Builder<GGistsVars, GGistsVarsBuilder> {
  _$GGistsVars? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _after;
  String? get after => _$this._after;
  set after(String? after) => _$this._after = after;

  GGistsVarsBuilder();

  GGistsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _after = $v.after;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGistsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGistsVars;
  }

  @override
  void update(void Function(GGistsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGistsVars build() => _build();

  _$GGistsVars _build() {
    final _$result = _$v ??
        new _$GGistsVars._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GGistsVars', 'login'),
            after: after);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
