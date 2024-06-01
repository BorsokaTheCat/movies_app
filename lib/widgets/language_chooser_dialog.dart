import 'package:flutter/material.dart';
import '../models/language.dart';
import '../services/api_services.dart';

class LanguageChooserDialog extends StatefulWidget {
  final Function(Language) onLanguageSelected;

  const LanguageChooserDialog({super.key, required this.onLanguageSelected});

  @override
  _LanguageChooserDialogState createState() => _LanguageChooserDialogState();
}

class _LanguageChooserDialogState extends State<LanguageChooserDialog> {
  late Future<List<Language>> _languagesFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _languagesFuture = _apiService.getSupportedLanguages();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Language'),
      content: FutureBuilder<List<Language>>(
        future: _languagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<Language> languages = snapshot.data!;
            return SingleChildScrollView(
              child: ListBody(
                children: languages.map((language) {
                  return GestureDetector(
                    onTap: () {
                      widget.onLanguageSelected(language);
                      Navigator.pop(context);
                    },
                    child: Text(language.englishName),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
