import 'package:doctoworld_user/Locale/language_cubit.dart';
import 'package:doctoworld_user/Locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  LanguageCubit _languageCubit;
  int _selectedLanguage = -1;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _languages = [
      'English',
      'Arabic',
      'French',
      'Indonesian',
      'Portuguese',
      'Spanish',
    ];
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        _selectedLanguage = getCurrentLanguage(locale);
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).changeLanguage),
            textTheme: Theme.of(context).textTheme,
          ),
          body: ListView.builder(
            itemCount: _languages.length,
            itemBuilder: (context, index) => RadioListTile(
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) async {
                setState(() {
                  _selectedLanguage = value;
                });
                if (_selectedLanguage == 0) {
                  _languageCubit.selectEngLanguage();
                } else if (_selectedLanguage == 1) {
                  _languageCubit.selectArabicLanguage();
                } else if (_selectedLanguage == 2) {
                  _languageCubit.selectFrenchLanguage();
                } else if (_selectedLanguage == 3) {
                  _languageCubit.selectIndonesianLanguage();
                } else if (_selectedLanguage == 4) {
                  _languageCubit.selectPortugueseLanguage();
                } else if (_selectedLanguage == 5) {
                  _languageCubit.selectSpanishLanguage();
                }
              },
              groupValue: _selectedLanguage,
              value: index,
              title: Text(_languages[index]),
            ),
          ),
        );
      },
    );
  }

  int getCurrentLanguage(Locale locale) {
    if (locale == Locale('en'))
      return 0;
    else if (locale == Locale('ar'))
      return 1;
    else if (locale == Locale('fr'))
      return 2;
    else if (locale == Locale('id'))
      return 3;
    else if (locale == Locale('pt'))
      return 4;
    else if (locale == Locale('es'))
      return 5;
    else if (locale == Locale('sw'))
      return 6;
    else
      return -1;
  }
}
