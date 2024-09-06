import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/networking/gitea.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/blob_view.dart';

class GtStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<String>(
      title: Text(AppLocalizations.of(context)!.giteaStatus),
      fetch: () async {
        final res = await Future.wait([
          fetchGitea('/version'),
          fetchGitea('/settings/attachment'),
          fetchGitea('/settings/api'),
          fetchGitea('/settings/repository'),
          fetchGitea('/settings/ui'),
        ]);
        return const JsonEncoder.withIndent('  ').convert({
          ...res[0],
          'attachment': res[1],
          'api': res[2],
          'repository': res[3],
          'ui': res[4],
        });
      },
      bodyBuilder: (jsonStr, _) {
        return BlobView('0.json', text: jsonStr);
      },
    );
  }
}
