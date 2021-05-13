import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Components/custom_button.dart';
import 'package:docto_delivery/Components/entry_field.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:docto_delivery/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddToBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.sendToBank,
            style:
                Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 18)),
        titleSpacing: 0.0,
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Add(),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Stack(
      children: <Widget>[
        ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          locale.availableBalance.toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        '\$ 520.50',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    locale.bankInfo.toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).disabledColor),
                  ),
                  EntryField(
                    isDense: true,
                    borderRadius: BorderRadius.circular(2),
                    label: locale.accountHolderName,
                    initialValue: 'George Anderson',
                  ),
                  EntryField(
                    isDense: true,
                    borderRadius: BorderRadius.circular(2),
                    label: locale.bankName,
                    initialValue: 'HBNC Bank of New York',
                  ),
                  EntryField(
                    isDense: true,
                    borderRadius: BorderRadius.circular(2),
                    label: locale.branchCode,
                    initialValue: '+1 987 654 3210',
                  ),
                  EntryField(
                    isDense: true,
                    borderRadius: BorderRadius.circular(2),
                    label: locale.accountNumber,
                    initialValue: '4321 4567 6789 8901',
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 8.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 80),
              child: EntryField(
                isDense: true,
                borderRadius: BorderRadius.circular(2),
                label: locale.amountToTransfer,
                initialValue: '\$ 500',
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.myProfile);
            },
            label: locale.sendToBank,
            radius: 0,
          ),
        )
      ],
    );
  }
}
