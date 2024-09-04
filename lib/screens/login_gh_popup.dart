part of 'login.dart';

Future<GithubAuthResult?> requestGithubToken({
  required BuildContext context,
}) {
  return showCupertinoDialog<GithubAuthResult>(
    context: context,
    builder: (context) => HookBuilder(
      builder: (context) {
        final tokenController = useTextEditingController();
        return ConfirmPopup(
          onConfirm: () => (token: tokenController.text),
          onCancel: () => null,
          child: Column(
            children: <Widget>[
              MyTextField(
                placeholder: 'Access token',
                controller: tokenController,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.permissionRequiredMessage,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'user, repo, read:org, notifications',
                style: TextStyle(
                  fontSize: 16,
                  color: AntTheme.of(context).colorPrimary,
                ),
              )
            ],
          ),
        );
      },
    ),
  );
}
