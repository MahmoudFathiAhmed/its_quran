import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:its_quran/screens/templateScreen.dart';
import 'package:url_launcher/url_launcher.dart';

enum AttachmentType { mp3, pdf }

class AttachmentsScreen extends StatelessWidget {
  static String routeName = '/attachments';

  Widget _doWnloadButton(BuildContext context,{String link}) {
    return OutlinedButton.icon(
      onPressed: () async=> await canLaunch(link) ? await launch(link) : throw 'Could not launch $link',
      icon: Image.asset('assets/downsm.png'),
      label: Text('تحميل',
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Theme.of(context).accentColor)),
      style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        side: BorderSide(
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  Card _attachmentTile(BuildContext context,
      {AttachmentType type = AttachmentType.mp3,String link=''}) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        title: Text(
          type == AttachmentType.mp3 ? 'MP3' : 'PDF',
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Image.asset(
            type == AttachmentType.mp3 ? 'assets/mp3.png' : 'assets/pdf.png'),
        trailing: _doWnloadButton(context,link: link),
        onTap: () async{
          await canLaunch(link) ? await launch(link) : throw 'Could not launch $link';
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final passedArgs =ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    String link = passedArgs["atts"];

    return Hero(
      tag: 'attachments',
      child: TemplateScreen(
        title: 'المرفقات',
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
          children: [
            _attachmentTile(context, type:link.contains('mp3')? AttachmentType.mp3:AttachmentType.pdf,link:link),
            
          ],
        ),
      ),
    );
  }
}
