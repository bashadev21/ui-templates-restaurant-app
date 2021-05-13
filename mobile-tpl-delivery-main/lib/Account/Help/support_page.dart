import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:docto_delivery/Components/custom_button.dart';
import 'package:docto_delivery/Components/entry_field.dart';
import 'package:docto_delivery/Locale/locale.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.support),
        textTheme: Theme.of(context).textTheme,
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.howMayWeHelpYou,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                '\n' + locale.letUsKnowYourQueries,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).disabledColor),
              ),
              Spacer(),
              EntryField(prefixIcon: Icons.mail, hint: locale.email),
              SizedBox(height: 12.0),
              EntryField(
                prefixIcon: Icons.edit,
                hint: locale.writeYourMsg,
                maxLines: 4,
              ),
              Spacer(),
              CustomButton(label: locale.submit),
              Spacer(flex: 2),
              Image.asset(
                'assets/img_delivery.png',
                height: 200,
              )
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
