part of 'login.dart';

typedef GiteaAuthResult = ({String domain, String token});

Future<GiteaAuthResult?> requestGiteaAuth({required BuildContext context}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) => HookBuilder(
      builder: (context) {
        final domainController = useTextEditingController();
        final tokenController = useTextEditingController();

        useEffect(() {
          domainController.text = 'https://gitea.com';
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
              MyTextField(
                controller: domainController,
                placeholder: 'Domain',
              ),
              const SizedBox(height: 8),
              MyTextField(
                placeholder: 'Access token',
                controller: tokenController,
              ),
              const SizedBox(height: 8),
              const Text.rich(TextSpan(children: [
                TextSpan(
                  text:
                      'Note: To login with Codeberg change the domain name to: ',
                ),
              ])),
              const SizedBox(height: 8),
              Text(
                'https://codeberg.org',
                style: TextStyle(
                  fontSize: 16,
                  color: AntTheme.of(context).colorPrimary,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
