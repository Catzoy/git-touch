import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:git_touch/widgets/confirm_popup.dart';
import 'package:git_touch/widgets/text_field.dart';

typedef TokenLoginResult = ({String domain, String token});

class TokenLoginPopup extends HookWidget {
  const TokenLoginPopup({
    super.key,
    this.showDomain = false,
    this.notes,
  });

  final bool showDomain;
  final List<Widget>? notes;

  @override
  Widget build(BuildContext context) {
    final domainController = useTextEditingController();
    final tokenController = useTextEditingController();
    return ConfirmPopup(
      onConfirm: () =>
          (domain: domainController.text, token: tokenController.text),
      onCancel: () => null,
      child: Column(
        children: <Widget>[
          if (showDomain)
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
          ...?notes,
        ],
      ),
    );
  }
}
