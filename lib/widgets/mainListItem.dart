import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:its_quran/screens/web_view_screen.dart';
import 'package:its_quran/widgets/HomeScreenSection.dart';
import 'package:url_launcher/url_launcher.dart';

class MainListItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String link;
  final String attachments;

  final ItemType itemType;
  bool isVideo = false;
  bool isAudio = false;
  bool isBook = false;
  bool isArticle = false;

  MainListItem({
    this.title = '',
    this.link = '',
    this.imgUrl = '',
    this.isVideo = false,
    this.itemType = ItemType.article,
    this.attachments = null,
  });

  @override
  Widget build(BuildContext context) {
    switch (this.itemType) {
      case ItemType.video:
        this.isVideo = true;
        break;
      case ItemType.audio:
        this.isAudio = true;
        break;
      case ItemType.book:
        this.isBook = true;
        break;
      case ItemType.article:
        this.isArticle = true;
        break;
      default:
        this.isArticle = true;
        break;
    }
    return InkWell(
      onTap: () async {
        if (itemType == ItemType.video) {
          Navigator.of(context).pushNamed("/tabs", arguments: {
            "tabIndex": 0,
            "link": link,
            "title": title,
            "attachments": attachments
          });
        }
        if (itemType == ItemType.audio) {
          Navigator.of(context).pushNamed("/tabs", arguments: {
            "tabIndex": 1,
            "link": link,
            "title": title,
            "attachments": attachments
          });
        }
        if (itemType == ItemType.book) {
          await _openLink(link: link);
        } else {
          print("salem no action can be done");
        }
      },
      child: Container(
        // color: Colors.red,
        width: 146.0,
        height: 220.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 146.0,
                    height: 134.0,
                    child:
                        !isAudio ? Image.asset('assets/01.png') : Container(),
                  ),
                  if (this.isVideo)
                    Image.asset(
                      'assets/playsm.png',
                      scale: 0.80,
                    ),
                  if (this.isBook)
                    Positioned(
                        top: 8.0,
                        left: 8.0,
                        child: Image.asset(
                          'assets/downsm.png',
                          scale: 0.80,
                        )),
                  if (this.isAudio)
                    Image.asset(
                      "assets/mic.png",
                      scale: 0.65,
                      fit: BoxFit.cover,
                    ),
                  // Image.network(
                  //   imgUrl,
                  //   scale: 0.1,
                  //   fit:BoxFit.cover,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.normal),
            ),
            if (isAudio || isVideo)
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: Container(
                    //         height: 30.0,
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           'سورة الفاتحة',
                    //           style:
                    //               Theme.of(context).textTheme.caption.copyWith(
                    //                     fontSize: 10.0,
                    //                     fontWeight: FontWeight.w500,
                    //                   ),
                    //         ),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(23.0),
                    //           border: Border.all(
                    //             color: Theme.of(context).primaryColor,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 5.0,
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         height: 30.0,
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           '10:15',
                    //           style: GoogleFonts.openSans(
                    //             textStyle: Theme.of(context).textTheme.caption,
                    //             fontSize: 10,
                    //             fontWeight: FontWeight.w800,
                    //           ),
                    //         ),
                    //         decoration: BoxDecoration(
                    //           color: Theme.of(context).accentColor,
                    //           borderRadius: BorderRadius.circular(23.0),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  _openLink({@required String link}) async {
    String _url = link;
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
