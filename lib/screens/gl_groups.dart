import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/networking/gitlab.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/user_item.dart';

class GlGroupsScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GitlabGroup, int>(
      title: Text(AppLocalizations.of(context)!.groups),
      fetch: (page) async {
        page = page ?? 1;
        final res = await fetchGitlabWithPage(
          '/groups?page=$page',
        );
        return ListPayload(
          cursor: res.cursor,
          hasMore: res.hasMore,
          items: <GitlabGroup>[
            for (var v in res.data) GitlabGroup.fromJson(v),
          ],
        );
      },
      itemBuilder: (v) {
        return UserItem.gitlabGroup(
          avatarUrl: v.avatarUrl,
          login: v.path,
          name: v.name,
          bio: Text(v.description ?? ''),
          id: v.id,
        );
      },
    );
  }
}
