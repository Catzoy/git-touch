import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/networking/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/gists_item.dart';
import 'package:gql_github/gists.data.gql.dart';
import 'package:gql_github/gists.req.gql.dart';

class GhGistsScreen extends StatelessWidget {
  const GhGistsScreen(this.login);

  final String login;

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GGistsData_user_gists_nodes, String?>(
      title: Text(AppLocalizations.of(context)!.gists),
      fetch: (page) async {
        final req = GGistsReq((b) => b
          ..vars.login = login
          ..vars.after = page);
        final res = await githubQlClient().request(req).first;
        final gists = res.data!.user!.gists;
        return ListPayload(
          cursor: gists.pageInfo.endCursor,
          items: (gists.nodes?.asList() ?? []).whereNotNull(),
          hasMore: gists.pageInfo.hasNextPage,
        );
      },
      itemBuilder: (v) {
        final filenames = [
          for (final file in v.files!.whereNotNull()) file.name
        ];
        // TODO: add gist comments
        return GistsItem(
          description: v.description,
          login: login,
          filenames: filenames,
          language: v.files![0]?.language!.name,
          avatarUrl: v.owner!.avatarUrl,
          updatedAt: v.updatedAt,
          id: v.name,
        );
      },
    );
  }
}
