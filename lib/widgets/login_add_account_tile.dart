import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginAddAccountTile extends StatelessWidget {
  const LoginAddAccountTile({
    required this.brand,
    required this.text,
    required this.onTap,
    super.key,
  });

  final IconData brand;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AntListItem(
      onClick: onTap,
      child: Row(
        children: <Widget>[
          const Icon(Ionicons.add),
          const SizedBox(width: 4),
          Icon(brand),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
