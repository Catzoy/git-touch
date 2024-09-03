// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiteaUser _$GiteaUserFromJson(Map<String, dynamic> json) => GiteaUser()
  ..id = (json['id'] as num?)?.toInt()
  ..login = json['login'] as String?
  ..fullName = json['full_name'] as String?
  ..avatarUrl = json['avatar_url'] as String?
  ..created = json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String);

Map<String, dynamic> _$GiteaUserToJson(GiteaUser instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'created': instance.created?.toIso8601String(),
    };

GiteaOrg _$GiteaOrgFromJson(Map<String, dynamic> json) => GiteaOrg()
  ..id = (json['id'] as num?)?.toInt()
  ..username = json['username'] as String?
  ..fullName = json['full_name'] as String?
  ..avatarUrl = json['avatar_url'] as String?
  ..description = json['description'] as String?
  ..website = json['website'] as String?
  ..location = json['location'] as String?;

Map<String, dynamic> _$GiteaOrgToJson(GiteaOrg instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'website': instance.website,
      'location': instance.location,
    };

GiteaRepository _$GiteaRepositoryFromJson(Map<String, dynamic> json) =>
    GiteaRepository()
      ..id = (json['id'] as num?)?.toInt()
      ..owner = json['owner'] == null
          ? null
          : GiteaUser.fromJson(json['owner'] as Map<String, dynamic>)
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..starsCount = (json['stars_count'] as num?)?.toInt()
      ..forksCount = (json['forks_count'] as num?)?.toInt()
      ..updatedAt = json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String)
      ..website = json['website'] as String?
      ..size = (json['size'] as num?)?.toInt()
      ..openIssuesCount = (json['open_issues_count'] as num?)?.toInt()
      ..openPrCounter = (json['open_pr_counter'] as num?)?.toInt();

Map<String, dynamic> _$GiteaRepositoryToJson(GiteaRepository instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'stars_count': instance.starsCount,
      'forks_count': instance.forksCount,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'website': instance.website,
      'size': instance.size,
      'open_issues_count': instance.openIssuesCount,
      'open_pr_counter': instance.openPrCounter,
    };

GiteaTree _$GiteaTreeFromJson(Map<String, dynamic> json) => GiteaTree(
      type: json['type'] as String,
      name: json['name'] as String,
    )
      ..path = json['path'] as String?
      ..size = (json['size'] as num?)?.toInt()
      ..downloadUrl = json['download_url'] as String?;

Map<String, dynamic> _$GiteaTreeToJson(GiteaTree instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'download_url': instance.downloadUrl,
    };

GiteaBlob _$GiteaBlobFromJson(Map<String, dynamic> json) => GiteaBlob(
      type: json['type'] as String,
      name: json['name'] as String,
    )
      ..path = json['path'] as String?
      ..size = (json['size'] as num?)?.toInt()
      ..downloadUrl = json['download_url'] as String?
      ..content = json['content'] as String?;

Map<String, dynamic> _$GiteaBlobToJson(GiteaBlob instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'download_url': instance.downloadUrl,
      'content': instance.content,
    };

GiteaCommit _$GiteaCommitFromJson(Map<String, dynamic> json) => GiteaCommit()
  ..number = (json['number'] as num?)?.toInt()
  ..author = json['author'] == null
      ? null
      : GiteaUser.fromJson(json['author'] as Map<String, dynamic>)
  ..title = json['title'] as String?
  ..body = json['body'] as String?
  ..commit = json['commit'] == null
      ? null
      : GiteaCommitDetail.fromJson(json['commit'] as Map<String, dynamic>)
  ..sha = json['sha'] as String?
  ..htmlUrl = json['html_url'] as String?;

Map<String, dynamic> _$GiteaCommitToJson(GiteaCommit instance) =>
    <String, dynamic>{
      'number': instance.number,
      'author': instance.author,
      'title': instance.title,
      'body': instance.body,
      'commit': instance.commit,
      'sha': instance.sha,
      'html_url': instance.htmlUrl,
    };

GiteaCommitDetail _$GiteaCommitDetailFromJson(Map<String, dynamic> json) =>
    GiteaCommitDetail()
      ..message = json['message'] as String?
      ..author = json['author'] == null
          ? null
          : GiteaCommitAuthor.fromJson(json['author'] as Map<String, dynamic>)
      ..committer = json['committer'] == null
          ? null
          : GiteaCommitAuthor.fromJson(
              json['committer'] as Map<String, dynamic>);

Map<String, dynamic> _$GiteaCommitDetailToJson(GiteaCommitDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'author': instance.author,
      'committer': instance.committer,
    };

GiteaCommitAuthor _$GiteaCommitAuthorFromJson(Map<String, dynamic> json) =>
    GiteaCommitAuthor()
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String);

Map<String, dynamic> _$GiteaCommitAuthorToJson(GiteaCommitAuthor instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'date': instance.date?.toIso8601String(),
    };

GiteaIssue _$GiteaIssueFromJson(Map<String, dynamic> json) => GiteaIssue()
  ..title = json['title'] as String?
  ..body = json['body'] as String?
  ..number = (json['number'] as num?)?.toInt()
  ..user = json['user'] == null
      ? null
      : GiteaUser.fromJson(json['user'] as Map<String, dynamic>)
  ..comments = (json['comments'] as num?)?.toInt()
  ..updatedAt = json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String)
  ..state = json['state'] as String?
  ..htmlUrl = json['html_url'] as String?
  ..labels = (json['labels'] as List<dynamic>?)
      ?.map((e) => GiteaLabel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GiteaIssueToJson(GiteaIssue instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'number': instance.number,
      'user': instance.user,
      'comments': instance.comments,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'state': instance.state,
      'html_url': instance.htmlUrl,
      'labels': instance.labels,
    };

GiteaLabel _$GiteaLabelFromJson(Map<String, dynamic> json) => GiteaLabel()
  ..color = json['color'] as String?
  ..name = json['name'] as String?;

Map<String, dynamic> _$GiteaLabelToJson(GiteaLabel instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

GiteaHeatmapItem _$GiteaHeatmapItemFromJson(Map<String, dynamic> json) =>
    GiteaHeatmapItem()
      ..timestamp = (json['timestamp'] as num?)?.toInt()
      ..contributions = (json['contributions'] as num?)?.toInt();

Map<String, dynamic> _$GiteaHeatmapItemToJson(GiteaHeatmapItem instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'contributions': instance.contributions,
    };

GiteaComment _$GiteaCommentFromJson(Map<String, dynamic> json) => GiteaComment()
  ..body = json['body'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..htmlUrl = json['html_url'] as String?
  ..originalAuthor = json['original_author'] as String?
  ..updatedAt = json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String)
  ..id = (json['id'] as num?)?.toInt()
  ..user = json['user'] == null
      ? null
      : GiteaUser.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$GiteaCommentToJson(GiteaComment instance) =>
    <String, dynamic>{
      'body': instance.body,
      'created_at': instance.createdAt?.toIso8601String(),
      'html_url': instance.htmlUrl,
      'original_author': instance.originalAuthor,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'user': instance.user,
    };
