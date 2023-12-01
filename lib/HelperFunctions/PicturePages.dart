import 'package:flutter/material.dart';

class PicturePages {
  int numPages = 1;

  List<Row> buildPages(List<String>images) {
    List<Row> pages = [];
    for (var i = 0; i < images.length; i++) {
      pages.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Image.asset(
                  images[i],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return pages;
  }

  int setNewPage(int currPage, int direction, PageController controller) {
    // direction = 1 for forward, -1 for backward
    if (direction == 1) {
      if (currPage == numPages - 1) {
      } else {
        currPage++;
      }
    } else {
      if (currPage == 0) {
      } else {
        currPage--;
      }
    }
    return currPage;
  }

  void setNumPages(int num) {
    numPages = num;
  }
}
