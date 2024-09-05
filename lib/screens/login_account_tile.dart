import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/account.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:provider/provider.dart';
import 'package:signals/signals_flutter.dart';

class LoginAccountTile extends StatelessWidget {
  const LoginAccountTile({
    super.key,
    required this.account,
    required this.index,
  });

  final Account account;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AntTheme.of(context).colorDanger,
        padding: const EdgeInsets.only(right: 12),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppLocalizations.of(context)!.removeAccount,
            style: TextStyle(
              fontSize: 16,
              color: AntTheme.of(context).colorBackground,
            ),
          ),
        ),
      ),
      onDismissed: (_) {
        removeAccount(index);
      },
      child: Watch.builder(builder: (context) {
        final activeAccountIndex = activeAccountIndexState.value;
        return AntListItem(
          onClick: () {
            context.read<AuthModel>().setActiveAccountAndReload(index);
          },
          arrow: null,
          prefix: Avatar(url: account.avatarUrl),
          extra: index == activeAccountIndex
              ? const Icon(Ionicons.checkmark)
              : null,
          description: Text(account.domain),
          child: Text(account.login),
        );
      }),
    );
  }
}
