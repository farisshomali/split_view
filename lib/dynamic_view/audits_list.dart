import 'package:flutter/material.dart';
import 'package:split_view/widgets/texts_and_fonts/medium_font.dart';

class AuditList extends StatelessWidget {
  const AuditList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MediumFont(
        text: 'audit list',
        color: Colors.black,
      ),
    );
  }
}
