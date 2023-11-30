import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/pages/home/bloc/home_bloc.dart';
import 'package:football_app/pages/home/home_page.dart';
import 'package:football_app/pages/league/bloc/league_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()..add(LoadLeaguesEvent()),),
        BlocProvider<LeagueBloc>(create: (context) => LeagueBloc())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: const ColorScheme.light(),
          ),
          home: const HomePage(),
        )
    );
  }
}
