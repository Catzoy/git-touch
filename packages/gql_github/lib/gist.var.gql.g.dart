// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gist.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGistVars> _$gGistVarsSerializer = new _$GGistVarsSerializer();

class _$GGistVarsSerializer implements StructuredSerializer<GGistVars> {
  @override
  final Iterable<Type> types = const [GGistVars, _$GGistVars];
  @override
  final String wireName = 'GGistVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGistVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GGistVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GGistVarsBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GGistVars extends GGistVars {
  @override
  final String login;
  @override
  final String name;

  factory _$GGistVars([void Function(GGistVarsBuilder)? updates]) =>
      (new GGistVarsBuilder()..update(updates))._build();

  _$GGistVars._({required this.login, required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(login, r'GGistVars', 'login');
    BuiltValueNullFieldError.checkNotNull(name, r'GGistVars', 'name');
  }

  @override
  GGistVars rebuild(void Function(GGistVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGistVarsBuilder toBuilder() => new GGistVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGistVars && login == other.login && name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, login.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGistVars')
          ..add('login', login)
          ..add('name', name))
        .toString();
  }
}

class GGistVarsBuilder implements Builder<GGistVars, GGistVarsBuilder> {
  _$GGistVars? _$v;

  String? _login;
  String? get login => _$this._login;
  set login(String? login) => _$this._login = login;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GGistVarsBuilder();

  GGistVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _login = $v.login;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGistVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GGistVars;
  }

  @override
  void update(void Function(GGistVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGistVars build() => _build();

  _$GGistVars _build() {
    final _$result = _$v ??
        new _$GGistVars._(
            login: BuiltValueNullFieldError.checkNotNull(
                login, r'GGistVars', 'login'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GGistVars', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
