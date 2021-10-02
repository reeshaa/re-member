import 'dart:async';

import 'package:flutter/material.dart';
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


  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch1 = 'https://colab.research.google.com/drive/1ARsuqbpC14bGxgcZPWSFejzcGntLhLw_#scrollTo=M-uadQI_PkVY';
    const String toLaunch2 = 'https://drive.google.com/drive/u/0/folders/1MJSvvtxpS0roo70oiH-zr_crG9Tmq6Mk';
    const String toLaunch3 = 'https://drive.google.com/drive/u/0/folders/1SNjs4ty7iHofpgJz7nuOGKPKbpsCUu9W';
    const String toLaunch4 = 'https://drive.google.com/drive/u/0/folders/1unWuBhumIo8NKz95F9YkSW7p3VajV19t';
    const String toLaunch5 = 'https://drive.google.com/drive/u/0/folders/1uowmNVcw7VinpOzCDSG62NeWHgA6E0JL';
    const String toLaunch6 = 'https://drive.google.com/drive/u/0/folders/1q58MdYjBBQjB5LNngHihUMaG1qm__D5m';
    const String toLaunch7 = 'https://drive.google.com/drive/u/0/folders/1_qDN50adBLe7nG82MrsE9BZh_br6ENaa';
    const String toLaunch8 = 'https://drive.google.com/drive/u/0/folders/1ATT3IbJ6m70irRZ6h79-N_ckjjDtUYWA';
    const String toLaunch9 = 'https://drive.google.com/drive/u/0/folders/14494JuqsZdCugTxyC5_MawU8TkLhbsUF';
    const String toLaunch10 = 'https://drive.google.com/drive/u/0/folders/1H0gtbAN0vGcTqzDw3yr4kU2KfKlC7FRt';
    return Scaffold(
      
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch1);
                }),
                child: const Text('DBMS'),
              ),
              ElevatedButton(
                
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch2);
                }),
                child: const Text('JAVA LAB'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch3);
                }),
                child: const Text('JAVA THEORY'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch4);
                }),
                child: const Text('CN LAB'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch5);
                }),
                child: const Text('OPERATING SYSTEM'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch6);
                }),
                child: const Text('MICROPROCESSOR'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch7);
                }),
                child: const Text('PYTHON LAB'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch8);
                }),
                child: const Text('SOFTWARE ENGINEERING'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch9);
                }),
                child: const Text('IPR'),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  _launched = _launchInBrowser(toLaunch10);
                }),
                child: const Text('TOC'),
              ),
             
              const Padding(padding: EdgeInsets.all(16.0)),
              
              const Padding(padding: EdgeInsets.all(16.0)),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),
            ],
          ),
        ],
      ),
    );
  }
}
