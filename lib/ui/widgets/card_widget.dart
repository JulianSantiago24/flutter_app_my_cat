import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final String breed;
  final String countryOfOrigin;
  final String intelligence;
  final String image;
  final VoidCallback? onTap;

  const CardCustom({
    required this.breed,
    required this.countryOfOrigin,
    required this.intelligence,
    required this.image,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        shadowColor: Colors.pink.shade100,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          width: width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(breed, style: theme.textTheme.titleMedium),
                    const Text('Más...')
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
                child: SizedBox(
                  height: height * 0.3,
                  child: Image.network(
                    image ,
                    fit: BoxFit.fitWidth,
                    width: width,
                    errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
                      return Image.asset('assets/images/not_found_cat.png',
                        width: width,
                        fit: BoxFit.fitWidth,
                      );
                    }
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(countryOfOrigin, style: theme.textTheme.bodySmall),
                    Text('Inteligencia: $intelligence'),
                    //style: theme.textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
