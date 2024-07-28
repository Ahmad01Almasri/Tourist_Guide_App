import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourist_guide/features/auth/presentation/widgets/icon_social_media.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RowIconsSocialMedia extends StatelessWidget {
  const RowIconsSocialMedia({
    Key? key,
  }) : super(key: key);

  final String _telegramUrl = 'https://t.me/a0abx';
  Future<void> _launchTelegram() async {
    if (await canLaunchUrlString(_telegramUrl)) {
      await launchUrlString(_telegramUrl);
    } else {
      throw 'Could not launch $_telegramUrl';
    }
  }

  Future<void> _makeCall() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: '0968782148', // استبدل برقمك الشخصي
    );

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        print('Could not launch $phoneUri');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconSocialMedia(
          onTap: () => launchUrlString('tel:+963968782148'),
          icon: Icons.call,
        ),
        IconSocialMedia(
          onTap: () => launchUrlString(_telegramUrl),
          icon: FontAwesomeIcons.telegram,
        ),
        IconSocialMedia(
          icon: FontAwesomeIcons.whatsapp,
          onTap: () => launchUrlString("https://wa.me/message/U7Z7VTYYG252C1"),
        ),
      ],
    );
  }
}
