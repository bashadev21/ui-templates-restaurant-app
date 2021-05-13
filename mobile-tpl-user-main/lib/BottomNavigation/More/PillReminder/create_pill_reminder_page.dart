import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_user/Components/custom_button.dart';
import 'package:doctoworld_user/Components/entry_field.dart';
import 'package:doctoworld_user/Locale/locale.dart';
import 'package:doctoworld_user/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';

class CreatePillReminderPage extends StatefulWidget {
  @override
  _CreatePillReminderPageState createState() => _CreatePillReminderPageState();
}

class _CreatePillReminderPageState extends State<CreatePillReminderPage> {
  TextEditingController selectedDaysController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  final List<String> days = [
    'Mon',
    'Tues',
    'Wed',
    'Thurs',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  void dispose() {
    selectedDaysController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.createPillReminder,
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              EntryField(
                label: locale.pillName,
                hint: locale.enterPillName,
              ),
              EntryField(
                controller: selectedDaysController,
                label: locale.selectDays,
                hint: locale.days,
                prefixIcon: Icons.event,
                readOnly: true,
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      List<String> selected = [];
                      return Container(
                        height: 300,
                        child: Column(
                          children: [
                            AppBar(
                              automaticallyImplyLeading: false,
                              title: Text(
                                locale.selectDays,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              centerTitle: true,
                              actions: [
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            Spacer(),
                            GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: days.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(20),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3,
                                mainAxisSpacing: 12,
                              ),
                              itemBuilder: (context, index) => DaysGridItem(
                                days[index],
                                (value) {
                                  setState(() {
                                    if (value)
                                      selected.add(days[index]);
                                    else
                                      selected.remove(days[index]);
                                  });
                                },
                              ),
                            ),
                            Spacer(),
                            CustomButton(
                              label: locale.done,
                              onTap: () {
                                setState(() {
                                  selectedDaysController.text =
                                      selected.join(', ');
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              EntryField(
                controller: timeController,
                label: locale.selectTime,
                hint: locale.time,
                suffix: Icons.add,
                readOnly: true,
                prefixIcon: Icons.notifications,
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    builder: (context) {
                      String time;
                      return Container(
                        height: 300,
                        child: Column(
                          children: [
                            AppBar(
                              automaticallyImplyLeading: false,
                              title: Text(
                                locale.selectTime,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              centerTitle: true,
                              actions: [
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                            Spacer(),
                            TimePickerSpinner(
                              is24HourMode: false,
                              alignment: Alignment.center,
                              highlightedTextStyle: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(fontWeight: FontWeight.w600),
                              normalTextStyle: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Theme.of(context).disabledColor),
                              spacing: 40,
                              isForce2Digits: true,
                              itemHeight: 40,
                              onTimeChange: (dateTime) {
                                setState(() {
                                  time = DateFormat.jm().format(dateTime);
                                });
                              },
                            ),
                            Spacer(),
                            CustomButton(
                              label: locale.done,
                              onTap: () {
                                setState(() {
                                  timeController.text = time;
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
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

class DaysGridItem extends StatefulWidget {
  final String text;
  final ValueChanged<bool> isSelected;

  DaysGridItem(this.text, this.isSelected);

  @override
  _DaysGridItemState createState() => _DaysGridItemState();
}

class _DaysGridItemState extends State<DaysGridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            widget.isSelected(isSelected);
          });
        },
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5.copyWith(
              color:
                  isSelected ? Theme.of(context).primaryColor : kMainTextColor,
              fontWeight: FontWeight.w600),
        ),
      ),
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
      slideCurve: Curves.linearToEaseOut,
    );
  }
}
