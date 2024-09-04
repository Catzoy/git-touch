part of 'login.dart';

Future<GitlabAuth?> requestGitlabAuth({required BuildContext context}) {
  return showCupertinoDialog<GitlabAuth>(
    context: context,
    builder: (context) => HookBuilder(builder: (context) {
      final tokenController = useTextEditingController();
      final domainController = useTextEditingController();

      useEffect(() {
        domainController.text = 'https://gitlab.com';
        return null;
      }, const []);

      return ConfirmPopup(
        onConfirm: () => (
          domain: domainController.text,
          token: tokenController.text,
        ),
        onCancel: () => null,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.permissionRequiredMessage,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'api, read_user, read_repository',
              style: TextStyle(
                fontSize: 16,
                color: AntTheme.of(context).colorPrimary,
              ),
            )
          ],
        ),
      );
    }),
  );
}
