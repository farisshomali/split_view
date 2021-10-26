import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:split_view/dynamic_view/audits_list.dart';
import 'package:split_view/dynamic_view/board.dart';
import 'package:split_view/widgets/texts_and_fonts/medium_font.dart';

class CategoryProvider with ChangeNotifier {
  int _currentPage;
  PdfController controller;
  bool isFirstPage = true;
  bool showDocuments = false;
  bool isFileSelected = false;
  String headName = 'Bank System';
  String fileName;

  int get currentPage {
    return _currentPage;
  }

  void currentTab(int index) {
    _currentPage = index;
    headName = categoryNames[index];
    notifyListeners();
  }

  List<Widget> pages = [
    const AuditList(),
    const Board(),
  ];

  final categoryNames = <String>[
    'Audit',
    'Board',
  ];

  final auditList = <String>[
    'Documents',
  ];
  final documentsList = <String>['file 1', 'file 2'];

  final boardsList = <String>[
    'Board 1',
    'Board 2',
  ];

  handleNavigation(BuildContext context) {
    return isFileSelected != true
        ? IndexedStack(
            children: pages,
            index: currentPage,
          )
        : PdfView(controller: controller);
  }

  handleDocuments() {
    showDocuments = true;
    notifyListeners();
  }

  showDocument(filePath) async {
    isFileSelected = true;
    controller = PdfController(
      document: PdfDocument.openAsset(filePath),
    );
    notifyListeners();
  }

  handleListView() {
    return showDocuments != true
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  _currentPage == 1
                      ? null
                      : currentPage == 0 && documentsList.isNotEmpty
                          ? handleDocuments()
                          : currentTab(index);
                },
                title: MediumFont(text: textState(index)),
                trailing: const Icon(CupertinoIcons.right_chevron),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.black,
            ),
            itemCount: itemCounter(),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => showDocument(documentsList[index] == 'file 1'
                    ? 'lib/assets/file1.pdf'
                    : documentsList[index] == 'file 2'
                        ? 'lib/assets/file2.pdf'
                        : ''),
                title: MediumFont(text: documentsList[index]),
                trailing: const Icon(CupertinoIcons.right_chevron),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.black,
            ),
            itemCount: documentsList.length,
          );
  }

  int itemCounter() {
    return _currentPage == 0
        ? auditList.length
        : _currentPage == 1
            ? boardsList.length
            : categoryNames.length;
  }

  String textState(int index) {
    return _currentPage == 0
        ? auditList[index]
        : _currentPage == 1
            ? boardsList[index]
            : categoryNames[index];
  }

  resetStatus() {
    showDocuments = false;
    _currentPage = null;
    isFirstPage = true;
    isFileSelected = false;
    headName = 'Bank System';
    notifyListeners();
  }
}
