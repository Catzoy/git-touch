part of 'login.dart';

Future<String?> requestGiteeToken({
  required BuildContext context,
}) {
  return showCupertinoDialog<String>(
    context: context,
    builder: (context) => HookBuilder(
      builder: (context) {
        final tokenController = useTextEditingController();
        return ConfirmPopup(
          onConfirm: () => tokenController.text,
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
