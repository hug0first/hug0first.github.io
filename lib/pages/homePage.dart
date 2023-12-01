import 'package:flutter/material.dart';
import '../HelperFunctions/getImageFiles.dart';
import '../HelperFunctions/PicturePages.dart';
import '../pages/aboutPage.dart';
import '../pages/printShopPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(
    initialPage: 0,
  );
  PicturePages picturePages = PicturePages();
  Future<List<String>> imageFiles = Future<List<String>>.value([]);

  Future<List<String>> fetchData() async {
    return [];
  }

  @override
  void initState() {
    super.initState();
    imageFiles = GetFiles().getFileStrings("assets/images", picturePages);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var currPage = 0;

    void animatePageTransition(int direction) {
      currPage = picturePages.setNewPage(currPage, direction, controller);
      controller.animateToPage(currPage,
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: screenWidth * 0.045,
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              animatePageTransition(-1);
                            },
                            icon: const Icon(Icons.arrow_upward),
                            iconSize: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: screenWidth * 0.045,
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              animatePageTransition(1);
                            },
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 50,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.75,
              child: FutureBuilder<List<Row>>(
                future:
                    imageFiles.then((value) => picturePages.buildPages(value)),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Row>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData && snapshot.data != null) {
                      return PageView(
                        controller: controller,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: snapshot.data!,
                      );
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              width: screenWidth * 0.15,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: Text(
                            'The Photo Room',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Josefin Sans',
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrintShopPage()));
                          },
                          child: Text(
                            'Print Shop',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Josefin Sans',
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutPage()));
                          },
                          child: Text(
                            'About',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Josefin Sans',
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
