import 'package:flutter/material.dart';
import '../models/language.dart';
import '../services/api_services.dart';
import 'package:provider/provider.dart';
import '../providers/languages_provider.dart';

class LanguageChooserDialog extends StatefulWidget {
  final Function(Language) onLanguageSelected;

  const LanguageChooserDialog({Key? key, required this.onLanguageSelected}) : super(key: key);

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
    final languageProvider = Provider.of<LanguageProvider>(context);
    return AlertDialog(
      title: Text('Choose Language'),
      content: FutureBuilder<List<Language>>(
        future: _languagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                width: 40, // Adjust size as needed
                height: 40, // Adjust size as needed
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
                      widget.onLanguageSelected(language); // Call the callback function with the selected language
                      Navigator.pop(context); // Close the dialog
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
