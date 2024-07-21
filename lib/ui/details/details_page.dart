import 'package:flutter/material.dart';
import 'package:flutter_app_my_cat/domain/cat_entity.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.cat});
  final Cat? cat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(cat!.breed)
      ),
      body: SafeArea(
        child: SizedBox(
          child:
            Column(
            children: [
             Image.network(
                cat!.urlImage,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
                errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
                  return Image.asset('assets/images/not_found_cat.png',
                    width: width,
                    fit: BoxFit.fitWidth,
                  );
                }
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cat!.description, style: theme.textTheme.bodyLarge,
                        ),
                        const Divider(),
                        ListTitleCustom(title: 'Origen', data: cat!.origin),
                        const Divider(),
                        ListTitleCustom(title: 'Adaptabilidad', data: cat!.adaptability),
                        const Divider(),
                        ListTitleCustom(title: 'Esperanza de vida', data: '${cat!.lifeSpan} años'),
                        const Divider(),
                        ListTitleCustom(title: 'Inteligencia', data: cat!.intelligence),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

// Custom list title and data
class ListTitleCustom extends StatelessWidget {
  const ListTitleCustom({
    super.key,
    required this.title,
    required this.data,
  });
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(title, style: theme.textTheme.titleLarge),
        const Spacer(),
        Text(
          data,
          style: theme.textTheme.headlineSmall,
        ),
      ],
    );
  }
}
