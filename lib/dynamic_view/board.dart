import 'package:flutter/material.dart';
import 'package:split_view/widgets/texts_and_fonts/medium_font.dart';

class Board extends StatelessWidget {
  const Board({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MediumFont(
        text: 'Boards List',
        color: Colors.black,
      ),
    );
  }
}
