// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      platform: json['platform'] as String,
      domain: json['domain'] as String,
      token: json['token'] as String,
      login: json['login'] as String,
      avatarUrl: json['avatarUrl'] as String,
      gitlabId: (json['gitlabId'] as num?)?.toInt(),
      appPassword: json['appPassword'] as String?,
      accountId: json['accountId'] as String?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) {
  final val = <String, dynamic>{
    'platform': instance.platform,
    'domain': instance.domain,
    'token': instance.token,
    'login': instance.login,
    'avatarUrl': instance.avatarUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gitlabId', instance.gitlabId);
  writeNotNull('appPassword', instance.appPassword);
  writeNotNull('accountId', instance.accountId);
  return val;
}
