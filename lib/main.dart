import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uic_test/core/utils/injection_container.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_bloc.dart';
import 'package:uic_test/features/counties/presentation/screen/countries_screen.dart';
import 'package:uic_test/features/main/main_screen.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_bloc.dart';
import 'package:uic_test/features/space_x/presentation/screen/spacex_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CountriesBloc(getIt.get())),
          BlocProvider(create: (_) => SpaceXBloC(getIt.get())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainScreen(),
        ));
  }
}
