import 'package:flutter/material.dart';

import 'aboutPage.dart';
import 'homePage.dart';


class PrintShopPage extends StatefulWidget {
  const PrintShopPage({Key? key}) : super(key: key);

  @override
  State<PrintShopPage> createState() => _PrintShopPageState();
}

class _PrintShopPageState extends State<PrintShopPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.1),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: screenWidth * 0.045,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 50,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.1),
                  child: Text(
                    'Print Shop Page',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Josefin Sans',
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.1,
                  child: Divider(
                  color: Theme.of(context).colorScheme.background,
                  thickness: 5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, screenHeight * 0.1, 0, 0),
                  child: SizedBox(
                    width: screenWidth * 0.5,
                    child: Text(
                      'This is the Print Shop Page. It is currently under construction, and I am planning to add'
                      'a way to order prints of my photos. in the future.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Josefin Sans',
                        color: Theme.of(context).colorScheme.background,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                  ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth * 0.15,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
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
                                    builder: (context) => const PrintShopPage()));
                          },
                          child: Text(
                            'Print Shop',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Josefin Sans',
                              color: Theme.of(context).colorScheme.secondary,
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
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
