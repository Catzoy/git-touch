part of 'login.dart';

Future<BitbucketAuth?> requestBitbucketAuth({required BuildContext context}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) => HookBuilder(
      builder: (context) {
        final domainController = useTextEditingController();
        final usernameController = useTextEditingController();
        final passwordController = useTextEditingController();

        useEffect(() {
          domainController.text = 'https://bitbucket.org';
          return null;
        }, const []);

        final guideGestureRecognizer = useMemoized(
          () => TapGestureRecognizer()
            ..onTap = () {
              context.pushUrl(
                'https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/',
              );
            },
        );
        return ConfirmPopup(
          onConfirm: () => (
            domain: domainController.text,
            username: usernameController.text,
            password: passwordController.text
          ),
          onCancel: () => null,
          child: Column(
            children: <Widget>[
              MyTextField(
                controller: domainController,
                placeholder: 'Domain',
              ),
              const SizedBox(height: 8),
              MyTextField(
                placeholder: 'Username',
                controller: usernameController,
              ),
              const SizedBox(height: 8),
              MyTextField(
                placeholder: 'App password',
                controller: passwordController,
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(children: [
                  const TextSpan(
                    text:
                        'Note: App password is different with the password. Follow ',
                  ),
                  TextSpan(
                    text: 'this guide',
                    style: TextStyle(
                      color: AntTheme.of(context).colorPrimary,
                    ),
                    recognizer: guideGestureRecognizer,
                  ),
                  const TextSpan(text: ' to create one.')
                ]),
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
                'Account: read\nTeam membership: read\nProjects: read\nRepositories: read\nPull requests: read\nIssues: read\nSnippets: read',
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
