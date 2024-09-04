part of 'login.dart';

Future<GiteeAuth?> requestGiteeToken({
  required BuildContext context,
}) {
  return showCupertinoDialog<GiteeAuth>(
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
            ],
          ),
        );
      },
    ),
  );
}
