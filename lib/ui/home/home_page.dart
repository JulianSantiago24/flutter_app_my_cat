import 'package:flutter_app_my_cat/ui/details/details_page.dart';
import 'package:flutter_app_my_cat/ui/home/cubit/home_cubit.dart';
import 'package:flutter_app_my_cat/ui/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state.catList == null) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text('Loading...'),
              ],
            )
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.pets),
            title: const Text('Catbreeds'),
            centerTitle: true,
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                TextField(
                  onChanged: (val) {
                    context.read<HomeCubit>().searchBreed(val);
                  },
                  decoration: InputDecoration(
                    hintText: 'Name of Breed',
                    fillColor: theme.cardColor,
                    filled: true,
                    suffixIcon: const Icon(Icons.search),
                    enabledBorder: InputBorder.none
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                  itemCount: state.catList!.length,
                  itemBuilder: (context, int i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      child: CardCustom(
                        breed: '${(state.catList?[i].breed)}',
                        countryOfOrigin: '${state.catList?[i].origin}',
                        intelligence: '${state.catList?[i].intelligence}',
                        image: '${state.catList?[i].urlImage}',
                        onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return DetailsPage(cat: state.catList![i]);
                            }
                          )
                        ),
                      ),
                    );
                  })
                )
              ],
            ),
          )),
        );
      }
    });
  }
}
