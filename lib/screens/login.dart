import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/screens/login_account_tile.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/action_button.dart';
import 'package:git_touch/widgets/confirm_popup.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:git_touch/widgets/login_add_account_tile.dart';
import 'package:git_touch/widgets/text_field.dart';
import 'package:provider/provider.dart';

part 'login_bb_popup.dart';
part 'login_ge_popup.dart';
part 'login_gh_popup.dart';
part 'login_gl_popup.dart';
part 'login_go_popup.dart';
part 'login_gt_popup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: Text(AppLocalizations.of(context)!.selectAccount),
      body: const _LoginAuth(),
    );
  }
}

class _LoginAuth extends StatelessWidget {
  const _LoginAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    if (auth.loading) {
      return const Center(child: Loading());
    }

    return Column(
      children: [
        AntList(
          children: [
            for (final (index, _) in auth.accounts.indexed)
              LoginAccountTile(
                index: index,
              ),
            LoginAddAccountTile(
              text: AppLocalizations.of(context)!.githubAccount,
              brand: Ionicons.logo_github,
              onTap: () async {
                context.read<ThemeModel>().showActions(context, [
                  ActionItem(
                    text: 'via OAuth',
                    onTap: (_) {
                      auth.redirectToGithubOauth();
                    },
                  ),
                  ActionItem(
                    text: 'via OAuth (Public repos only)',
                    onTap: (_) {
                      auth.redirectToGithubOauth(true);
                    },
                  ),
                  ActionItem(
                    text: 'via Personal token',
                    onTap: (_) async {
                      final token = await requestGithubToken(
                        context: context,
                      );
                      if (token != null) {
                        try {
                          await auth.loginWithToken(token);
                        } catch (err) {
                          context.showError(err);
                        }
                      }
                    },
                  ),
                ]);
              },
            ),
            LoginAddAccountTile(
              text: AppLocalizations.of(context)!.gitlabAccount,
              brand: Ionicons.git_branch_outline,
              onTap: () async {
                final result = await requestGitlabAuth(
                  context: context,
                );
                if (result != null) {
                  try {
                    await auth.loginToGitlab(
                      result.domain,
                      result.token,
                    );
                  } catch (err) {
                    context.showError(err);
                  }
                }
              },
            ),
            LoginAddAccountTile(
              text: AppLocalizations.of(context)!.bitbucketAccount,
              brand: Ionicons.logo_bitbucket,
              onTap: () async {
                final result = await requestBitbucketAuth(
                  context: context,
                );
                if (result != null) {
                  try {
                    await auth.loginToBb(
                      result.domain,
                      result.username,
                      result.password,
                    );
                  } catch (err) {
                    context.showError(err);
                  }
                }
              },
            ),
            LoginAddAccountTile(
              text: AppLocalizations.of(context)!.giteaAccount,
              brand: Ionicons.git_branch_outline, // TODO: brand icon
              onTap: () async {
                final result = await requestGiteaAuth(
                  context: context,
                );
                if (result != null) {
                  try {
                    await auth.loginToGitea(
                      result.domain,
                      result.token,
                    );
                  } catch (err) {
                    context.showError(err);
                  }
                }
              },
            ),
            LoginAddAccountTile(
              text: '${AppLocalizations.of(context)!.giteeAccount}(码云)',
              brand: Ionicons.git_branch_outline, // TODO: brand icon
              onTap: () async {
                final token = await requestGiteeToken(
                  context: context,
                );
                if (token != null) {
                  try {
                    await auth.loginToGitee(token);
                  } catch (err) {
                    context.showError(err);
                  }
                }
              },
            ),
            LoginAddAccountTile(
              text: 'Gogs Account',
              brand: Ionicons.git_branch_outline, // TODO: brand icon
              onTap: () async {
                final result = await requestGogsToken(
                  context: context,
                );
                if (result != null) {
                  try {
                    await auth.loginToGogs(
                      result.domain,
                      result.token,
                    );
                  } catch (err) {
                    context.showError(err);
                  }
                }
              },
            ),
          ],
        ),
        Container(
          padding: CommonStyle.padding,
          child: Text(
            'Swipe to left to remove account',
            style: TextStyle(
              fontSize: 16,
              color: AntTheme.of(context).colorTextSecondary,
            ),
          ),
        )
      ],
    );
  }
}

extension on BuildContext {
  void showError(err) {
    final text = Text('${AppLocalizations.of(this)!.somethingBadHappens}$err');
    read<ThemeModel>().showConfirm(this, text);
  }
}
