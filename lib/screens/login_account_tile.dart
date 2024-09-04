import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:provider/provider.dart';

class LoginAccountTile extends StatelessWidget {
  const LoginAccountTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final account = auth.accounts[index];
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
        auth.removeAccount(index);
      },
      child: AntListItem(
        onClick: () {
          auth.setActiveAccountAndReload(index);
        },
        arrow: null,
        prefix: Avatar(url: account.avatarUrl),
        extra: index == auth.activeAccountIndex
            ? const Icon(Ionicons.checkmark)
            : null,
        description: Text(account.domain),
        child: Text(account.login),
      ),
    );
  }
}
