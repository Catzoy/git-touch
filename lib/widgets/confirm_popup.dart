import 'package:flutter/cupertino.dart';

class ConfirmPopup<T> extends StatelessWidget {
  const ConfirmPopup({
    super.key,
    required this.child,
    required this.onConfirm,
    required this.onCancel,
  });

  final Widget child;
  final T Function() onConfirm;
  final T? Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: child,
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, onCancel());
          },
          child: const Text('cancel'),
        ),
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context, onConfirm());
          },
        ),
      ],
    );
  }
}
