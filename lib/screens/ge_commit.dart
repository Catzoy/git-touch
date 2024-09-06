import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:git_touch/models/gitee.dart';
import 'package:git_touch/networking/gitee.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/files_item.dart';
import 'package:git_touch/widgets/link.dart';

class GeCommitScreen extends StatelessWidget {
  const GeCommitScreen(this.owner, this.name, this.sha);
  final String owner;
  final String name;
  final String sha;

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GiteeCommit>(
      title: Text('Commit: ${sha.substring(0, 7)}'),
      fetch: () async {
        final items = await fetchGitee('/repos/$owner/$name/commits/$sha');
        return GiteeCommit.fromJson(items);
      },
      actionBuilder: (data, _) => ActionButton(
          title: 'Actions', items: [...ActionItem.getUrlActions(data.htmlUrl)]),
      bodyBuilder: (data, _) {
        return Column(children: <Widget>[
          Container(
              padding: CommonStyle.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  LinkWidget(
                    url: '/gitee/$owner/$name',
                    child: Row(
                      children: <Widget>[
                        Avatar(
                          url: data.author!.avatarUrl,
                          size: AvatarSize.extraSmall,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$owner / $name',
                          style: TextStyle(
                            fontSize: 17,
                            color: AntTheme.of(context).colorTextSecondary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          sha.substring(0, 7),
                          style: TextStyle(
                            fontSize: 17,
                            color: AntTheme.of(context).colorWeak,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    data.commit!.message!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
          Wrap(
            children: data.files!
                .map<Widget>((file) => FilesItem(
                      filename: file.filename,
                      additions: file.additions,
                      deletions: file.deletions,
                      status: file.status,
                      patch: file.patch,
                    ))
                .toList(),
          )
        ]);
      },
    );
  }
}
