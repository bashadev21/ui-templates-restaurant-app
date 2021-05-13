import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class MenuTile {
  String title;
  String subtitle;
  IconData iconData;
  Function onTap;
  MenuTile(this.title, this.subtitle, this.iconData, this.onTap);
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<MenuTile> _menu = [
      MenuTile(locale.myOrders, locale.companyPolicies, Icons.assignment, () {
        Navigator.pushNamed(context, PageRoutes.recentOrdersTabs);
      }),
      MenuTile(locale.storeProfile, locale.letUsHelpYou, Icons.store, () {
        Navigator.pushNamed(context, PageRoutes.profilePage);
      }),
      MenuTile(
          locale.wallet, locale.quickPayments, Icons.account_balance_wallet,
          () {
        Navigator.pushNamed(context, PageRoutes.walletPage);
      }),
      MenuTile(locale.insight, locale.seeTheProgress, Icons.insert_chart, () {
        Navigator.pushNamed(context, PageRoutes.insightPage);
      }),
      MenuTile(locale.earnings, locale.sellOverview, Icons.monetization_on, () {
        Navigator.pushNamed(context, PageRoutes.earningsPage);
      }),
      MenuTile(locale.myItems, locale.manageItems, Icons.local_hospital, () {
        Navigator.pushNamed(context, PageRoutes.myItemsPage);
      }),
      MenuTile(locale.changeLanguage, locale.changeLanguage, Icons.language,
          () {
        Navigator.pushNamed(context, PageRoutes.languagePage);
      }),
      MenuTile(locale.tnC, locale.companyPolicies, Icons.assignment, () {
        Navigator.pushNamed(context, PageRoutes.tncPage);
      }),
      MenuTile(locale.contactUs, locale.letUsHelpYou, Icons.mail, () {
        Navigator.pushNamed(context, PageRoutes.supportPage);
      }),
      MenuTile(locale.faqs, locale.quickAnswers, Icons.announcement, () {
        Navigator.pushNamed(context, PageRoutes.faqPage);
      }),
      MenuTile(locale.logout, locale.seeYouSoon, Icons.exit_to_app, () {
        Phoenix.rebirth(context);
      }),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.account),
        textTheme: Theme.of(context).textTheme,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadedScaleAnimation(
                  Image.asset('assets/seller img/1.png', scale: 3.5),
                  durationInMilliseconds: 400,
                ),
                SizedBox(
                  width: 15,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: locale.wellLifeStore,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 20)),
                  TextSpan(
                      text: '+1 987 654 3210',
                      style: Theme.of(context).textTheme.subtitle2),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.8, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: _menu[index].onTap,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadedScaleAnimation(
                            Text(
                              _menu[index].title,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            durationInMilliseconds: 400,
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
                                color: Theme.of(context).highlightColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
