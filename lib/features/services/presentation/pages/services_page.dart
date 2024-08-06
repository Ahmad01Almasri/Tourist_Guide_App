import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourist_guide/core/utils/app_colors.dart';
import 'package:tourist_guide/core/utils/app_constants.dart';
import 'package:tourist_guide/core/utils/app_text_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ServicesScreen extends StatefulWidget {
  ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon:
          //       Icon(size: 35, Icons.arrow_back, color: AppColors.primaryColor),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          title: Text(
            'Services',
            textAlign: TextAlign.center,
            style: AppTextStyles.poppinsBoldstyle24
                .copyWith(color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: AppConstants.appServices.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: AppColors.offWhite.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                  AppConstants.appServices[index]['image']!,
                                  width: 120,
                                  height: 120),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstants.appServices[index]['title']!,
                                    style: AppTextStyles.poppinsBoldstyle24,
                                  ),
                                  Text(
                                    AppConstants.appServices[index]
                                        ['description']!,
                                    style: AppTextStyles.poppinsThinW6000style22
                                        .copyWith(
                                            fontSize: 18,
                                            color: AppColors.black38),
                                    maxLines: null,
                                    overflow: TextOverflow.visible,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final url = AppConstants
                                            .appServices[index]['url']!;
                                        if (await canLaunchUrlString(url)) {
                                          await launchUrlString(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Text(
                                        'Download',
                                        style: AppTextStyles.poppinsBoldstyle18
                                            .copyWith(color: AppColors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () async {
                final url = AppConstants.appServices[index]['url']!;
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            );
          },
        ),
        floatingActionButton: SpeedDial(
            spacing: 12,
            spaceBetweenChildren: 12,
            activeBackgroundColor: AppColors.primaryColor,
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: AppColors.primaryColor,
            overlayColor: AppColors.black,
            animatedIconTheme: IconThemeData(color: AppColors.white),
            overlayOpacity: 0.4,
            // animatedIcon:AnimatedIcon.,
            children: [
              SpeedDialChild(
                  onTap: () async {
                    launchUrlString("https://wa.me/message/U7Z7VTYYG252C1");
                  },
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: AppColors.white,
                    size: 40,
                  ),
                  label: 'Whatsapp',
                  labelStyle: AppTextStyles.poppinsBoldstyle16
                      .copyWith(color: AppColors.black),
                  backgroundColor: AppColors.green),
              SpeedDialChild(
                  onTap: () async {
                    launchUrlString('https://t.me/a0abx');
                  },
                  child: Icon(
                    Icons.telegram,
                    size: 40,
                    color: AppColors.white,
                  ),
                  label: 'Telegram',
                  labelStyle: AppTextStyles.poppinsBoldstyle16
                      .copyWith(color: AppColors.black),
                  backgroundColor: AppColors.blue),
              SpeedDialChild(
                  onTap: () async {
                    launchUrlString('tel:+963968782148');
                  },
                  child: Icon(
                    Icons.call,
                    color: AppColors.white,
                    size: 40,
                  ),
                  label: 'Call',
                  labelStyle: AppTextStyles.poppinsBoldstyle16
                      .copyWith(color: AppColors.black),
                  backgroundColor: AppColors.yellowGold),
            ])
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SizedBox(
        //       height: 65,
        //       width: 65,
        //       child: FloatingActionButton(
        //         onPressed: () async {
        //           launchUrlString("https://wa.me/message/U7Z7VTYYG252C1");
        //         },
        //         backgroundColor: AppColors.green,
        //         heroTag: 'whatsapp',
        //         child: Icon(
        //           FontAwesomeIcons.whatsapp,
        //           color: AppColors.black,
        //           size: 40,
        //         ),
        //       ),
        //     ),
        //     const SizedBox(height: 10),
        //     SizedBox(
        //       height: 65,
        //       width: 65,
        //       child: FloatingActionButton(
        //         onPressed: () async {
        //           launchUrlString('https://t.me/a0abx');
        //         },
        //         backgroundColor: AppColors.blue,
        //         heroTag: 'telegram',
        //         child: const Icon(
        //           Icons.telegram,
        //           size: 40,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
