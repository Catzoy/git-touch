part of 'login.dart';

Future<GogsAuth?> requestGogsToken({
  required BuildContext context,
}) {
  return showCupertinoDialog<GogsAuth>(
    context: context,
    builder: (context) => HookBuilder(
      builder: (context) {
        final domainController = useTextEditingController();
        final tokenController = useTextEditingController();

        useEffect(() {
          domainController.text = 'https://gogs.com';
          return null;
        }, const []);

        return ConfirmPopup(
          onConfirm: () => (
            domain: domainController.text,
            token: tokenController.text,
          ),
          onCancel: () => null,
          child: Column(
            children: <Widget>[
              MyTextField(
                placeholder: 'Domain',
                controller: tokenController,
              ),
              const SizedBox(height: 8),
              MyTextField(
                placeholder: 'Access token',
                controller: tokenController,
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    ),
  );
}
