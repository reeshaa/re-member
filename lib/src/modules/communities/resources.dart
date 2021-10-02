import 'dart:async';

import 'package:flutter/material.dart';
import 'package:re_member/src/utils/constants.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  Future<void>? _launched;
  String _phone = '';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  // ignore: unused_element
  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithDomStorage(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Color? getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey[200];
      }
      return Colors.grey[300];
    }

    const String toLaunch1 =
        'https://colab.research.google.com/drive/1ARsuqbpC14bGxgcZPWSFejzcGntLhLw_#scrollTo=M-uadQI_PkVY';
    const String toLaunch2 =
        'https://drive.google.com/drive/u/0/folders/1MJSvvtxpS0roo70oiH-zr_crG9Tmq6Mk';
    const String toLaunch3 =
        'https://drive.google.com/drive/u/0/folders/1SNjs4ty7iHofpgJz7nuOGKPKbpsCUu9W';
    const String toLaunch4 =
        'https://drive.google.com/drive/u/0/folders/1unWuBhumIo8NKz95F9YkSW7p3VajV19t';
    const String toLaunch5 =
        'https://drive.google.com/drive/u/0/folders/1uowmNVcw7VinpOzCDSG62NeWHgA6E0JL';
    const String toLaunch6 =
        'https://drive.google.com/drive/u/0/folders/1q58MdYjBBQjB5LNngHihUMaG1qm__D5m';
    const String toLaunch7 =
        'https://drive.google.com/drive/u/0/folders/1_qDN50adBLe7nG82MrsE9BZh_br6ENaa';
    const String toLaunch8 =
        'https://drive.google.com/drive/u/0/folders/1ATT3IbJ6m70irRZ6h79-N_ckjjDtUYWA';
    const String toLaunch9 =
        'https://drive.google.com/drive/u/0/folders/14494JuqsZdCugTxyC5_MawU8TkLhbsUF';
    const String toLaunch10 =
        'https://drive.google.com/drive/u/0/folders/1H0gtbAN0vGcTqzDw3yr4kU2KfKlC7FRt';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadiusLarge,
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch6);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calculate,
                        color: Colors.grey,
                        size: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Linear Algebra',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadiusLarge,
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch1);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.code,
                        color: Colors.grey,
                        size: 50,
                      ),
                      const Text(
                        'DBMS',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadiusLarge,
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch2);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.folder,
                        color: Colors.grey,
                        size: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'JAVA Labs',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadiusLarge,
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch3);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.folder,
                        color: Colors.grey,
                        size: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'CN Labs',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadiusLarge,
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch4);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.folder,
                        color: Colors.grey,
                        size: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'JAVA Theory',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: borderRadiusLarge,
                child: ElevatedButton(
                  onPressed: () => setState(() {
                    _launched = _launchInBrowser(toLaunch5);
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith(getColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.folder,
                        color: Colors.grey,
                        size: 50,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Operating Systems',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () => setState(() {
            //       _launched = _launchInBrowser(toLaunch6);
            //     }),
            //     child: const Text('MICROPROCESSOR'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () => setState(() {
            //       _launched = _launchInBrowser(toLaunch7);
            //     }),
            //     child: const Text('PYTHON LAB'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () => setState(() {
            //       _launched = _launchInBrowser(toLaunch8);
            //     }),
            //     child: const Text('SOFTWARE ENGINEERING'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () => setState(() {
            //       _launched = _launchInBrowser(toLaunch9);
            //     }),
            //     child: const Text('IPR'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ElevatedButton(
            //     onPressed: () => setState(() {
            //       _launched = _launchInBrowser(toLaunch10);
            //     }),
            //     child: const Text('TOC'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
