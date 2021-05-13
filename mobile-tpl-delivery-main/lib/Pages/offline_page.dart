import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Components/ripple_animation.dart';
import 'package:docto_delivery/Controllers/map.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:docto_delivery/Routes/routes.dart';
import 'package:docto_delivery/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MenuTile {
  String title;
  String subtitle;
  IconData iconData;
  Function onTap;
  MenuTile(this.title, this.subtitle, this.iconData, this.onTap);
}

class OfflinePage extends StatefulWidget {
  @override
  _OfflinePageState createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  @override
  void initState() {
    super.initState();
    //  _getCurrentLocation();
  }

  Position _currentPosition;
  String _currentAddress;
  final MapController _mapCon = Get.find();
  bool isOnline = false;
  bool isAccountOpen = false;
  double animatedHeight = 0;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<MenuTile> _menu = [
      MenuTile(locale.wallet, locale.quickPayments,
          Icons.account_balance_wallet_rounded, () {
        Navigator.pushNamed(context, PageRoutes.walletPage);
      }),
      MenuTile(locale.insight, locale.rideOverview, Icons.directions_bike, () {
        Navigator.pushNamed(context, PageRoutes.insightPage);
      }),
      MenuTile(locale.myProfile, locale.setProfile, Icons.account_box, () {
        Navigator.pushNamed(context, PageRoutes.myProfile);
      }),
      MenuTile(locale.changeLanguage, locale.changeLanguage, Icons.language,
          () {
        Navigator.pushNamed(context, PageRoutes.languagePage);
      }),
      MenuTile(locale.contactUs, locale.letUsHelpYou, Icons.mail, () {
        Navigator.pushNamed(context, PageRoutes.supportPage);
      }),
      MenuTile(locale.aboutUs, locale.aboutUs, Icons.account_box, () {
        Navigator.pushNamed(context, PageRoutes.tncPage);
      }),
      MenuTile(locale.tncc, locale.privacyPolicies, Icons.mail, () {
        Navigator.pushNamed(context, PageRoutes.tncPage);
      }),
      MenuTile(locale.faqs, locale.quickAnswers, Icons.assignment_late_rounded,
          () {
        Navigator.pushNamed(context, PageRoutes.faqPage);
      }),
      MenuTile(locale.logout, locale.seeYouSoon, Icons.exit_to_app, () {
        Phoenix.rebirth(context);
      }),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: animatedHeight != 0
            ? AppBar(
                title: Text(locale.account),
                textTheme: Theme.of(context).textTheme,
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      animatedHeight = 0;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                centerTitle: true,
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox.shrink(),
              ),
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.newDeliveryPage);
                },
                child: Image.asset(
                  'assets/map2.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Colors.white10,
                    ])),
                width: MediaQuery.of(context).size.width,
                height: 70,
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        animatedHeight = MediaQuery.of(context).size.height;
                      });
                    },
                    leading: FadedScaleAnimation(
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('assets/img_profile.png')),
                      durationInMilliseconds: 400,
                    ),
                    /*Image.asset('assets/delivery_boy.png'),*/
                    title: Text('64 ' + locale.orders + ' | \$ 302.50'),
                    subtitle: Text(locale.today),
                  ),
                  Spacer(),
                  !isOnline
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              isOnline = !isOnline;
                            });
                          },
                          child: RipplesAnimation(
                            child: Container(),
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
              AnimatedContainer(
                height: animatedHeight,
                duration: Duration(milliseconds: 500),
                color: Theme.of(context).backgroundColor,
                child: ListView(
                  children: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadedScaleAnimation(
                                Image.asset('assets/img_profile.png',
                                    scale: 2.5),
                                durationInMilliseconds: 400,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'George\nAnderson\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(fontSize: 20)),
                            TextSpan(
                                text: '+1 987 654 3210',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(height: 1.8)),
                          ]))
                        ],
                      ),
                    ),
                    Container(
                      color: Theme.of(context).backgroundColor,
                      child: GridView.builder(
                          itemCount: _menu.length,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(8.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.8, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: _menu[index].onTap,
                              child: FadedScaleAnimation(
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _menu[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            _menu[index].subtitle,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                .copyWith(fontSize: 13),
                                          ),
                                          Spacer(),
                                          Icon(
                                            _menu[index].iconData,
                                            size: 32,
                                            color: Theme.of(context)
                                                .highlightColor,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                durationInMilliseconds: 400,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 25,
                  top: 25,
                  child: CircleAvatar(
                      child: IconButton(
                    onPressed: () {
                      final location = GetStorage();
                      location.remove('latitude');
                      location.remove('longitude');
                    },
                    icon: Icon(Icons.location_history),
                  ))),
              Positioned(
                  right: 25,
                  top: 80,
                  child: CircleAvatar(
                      child: IconButton(
                    onPressed: () {
                      final location = GetStorage();
                      location.read('latitude');
                      location.read('longitude');
                      print(location.read('latitude'));
                      print(location.read('longitude'));
                    },
                    icon: Icon(Icons.location_on),
                  ))),
              Positioned(
                  right: 25,
                  top: 120,
                  child: CircleAvatar(
                      child: IconButton(
                    onPressed: () {
                      //  _getCurrentLocation();
                      final location = GetStorage();
                      location.write(
                          'latitude', _mapCon.currentPosition.latitude);
                      location.write(
                          'longitude', _mapCon.currentPosition.longitude);
                      print(location.read('latitude'));
                      print(location.read('longitude'));
                    },
                    icon: Icon(Icons.location_on),
                  )))
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SolidBottomSheet(
              maxHeight: 80,
              draggableBody: true,
              canUserSwipe: true,
              toggleVisibilityOnTap: true,
              elevation: 5,
              headerBar: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8))),
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16,
                      ),
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: isOnline ? onlineColor : offlineColor,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        isOnline ? locale.youreOnline : locale.youreOffline,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.keyboard_arrow_up)
                    ],
                  ),
                ),
              ),
              body: Material(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 5,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor:
                                !isOnline ? onlineColor : offlineColor,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isOnline = !isOnline;
                                });
                              },
                              child: Text(
                                  !isOnline
                                      ? locale.youreOnline
                                      : locale.youreOffline,
                                  style:
                                      Theme.of(context).textTheme.subtitle1)),
                          SizedBox(
                            width: 45,
                          )
                        ],
                      )))),
        ),
      ),
    );
  }

  // _getCurrentLocation() {
  //   print('ffff${_currentPosition.latitude}');
  //   print(_currentPosition.longitude);
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //       print('ffff${_currentPosition.latitude}');
  //       print(_currentPosition.longitude);
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
}
