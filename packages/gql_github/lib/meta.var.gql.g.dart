// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GMetaVars> _$gMetaVarsSerializer = new _$GMetaVarsSerializer();

class _$GMetaVarsSerializer implements StructuredSerializer<GMetaVars> {
  @override
  final Iterable<Type> types = const [GMetaVars, _$GMetaVars];
  @override
  final String wireName = 'GMetaVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GMetaVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GMetaVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GMetaVarsBuilder().build();
  }
}

class _$GMetaVars extends GMetaVars {
  factory _$GMetaVars([void Function(GMetaVarsBuilder)? updates]) =>
      (new GMetaVarsBuilder()..update(updates))._build();

  _$GMetaVars._() : super._();

  @override
  GMetaVars rebuild(void Function(GMetaVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GMetaVarsBuilder toBuilder() => new GMetaVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GMetaVars;
  }

  @override
  int get hashCode {
    return 762824271;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GMetaVars').toString();
  }
}

class GMetaVarsBuilder implements Builder<GMetaVars, GMetaVarsBuilder> {
  _$GMetaVars? _$v;

  GMetaVarsBuilder();

  @override
  void replace(GMetaVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GMetaVars;
  }

  @override
  void update(void Function(GMetaVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GMetaVars build() => _build();

  _$GMetaVars _build() {
    final _$result = _$v ?? new _$GMetaVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
