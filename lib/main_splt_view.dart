import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_view/helpers/media-query.dart';
import 'package:split_view/providers/category_provider.dart';
import 'package:split_view/widgets/texts_and_fonts/medium_font.dart';
import 'package:split_view/widgets/texts_and_fonts/small_font.dart';

class SplitView extends StatelessWidget {
  const SplitView({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Consumer<CategoryProvider>(
        builder: (_, category, child) => Scaffold(
          appBar: CupertinoNavigationBar(
            leading: category.currentPage != null
                ? Row(
                    children: [
                      IconButton(
                          onPressed: () => category.resetStatus(),
                          icon: const Icon(Icons.arrow_back_ios_outlined)),
                      const SmallText(text: 'Categories', color: Colors.orange)
                    ],
                    mainAxisSize: MainAxisSize.min,
                  )
                : Container(),
            backgroundColor: Colors.grey.withOpacity(0.1),
            middle: MediumFont(text: category.headName, color: Colors.black),
          ),
          body: Row(
            children: [
              leftMenu(context, category),
              rightScreen(category, context),
            ],
          ),
        ),
      ),
    );
  }

  Expanded rightScreen(CategoryProvider category, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: Center(child: category.handleNavigation(context)),
      ),
    );
  }

  Expanded leftMenu(BuildContext context, CategoryProvider category) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.black))),
        child: Column(
          children: [
            Container(
              width: displyWidth(context),
              height: displayHeight(context) * 0.05,
              decoration: const BoxDecoration(color: Colors.orange),
              child: const Center(
                child: MediumFont(text: 'Categories List', color: Colors.white),
              ),
            ),
            category.handleListView(),
          ],
        ),
      ),
    );
  }
}
