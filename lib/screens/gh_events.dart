import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:git_touch/models/github.dart';
import 'package:git_touch/networking/github.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/event_item.dart';

class GhEventsScreen extends StatelessWidget {
  const GhEventsScreen(this.login);

  final String login;

  @override
  Widget build(context) {
    return ListStatefulScaffold<GithubEvent, int>(
      title: Text(AppLocalizations.of(context)!.events),
      itemBuilder: (payload) => EventItem(payload),
      fetch: (page) async {
        page = page ?? 1;
        final events = await githubClient().getJSON(
          '/users/$login/events?page=$page&per_page=$kPageSize',
          convert: (dynamic vs) => [for (var v in vs) GithubEvent.fromJson(v)],
        );
        return ListPayload(
          cursor: page + 1,
          hasMore: events.length == kPageSize,
          items: events,
        );
      },
    );
  }
}
