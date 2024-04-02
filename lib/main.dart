import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/providers/pokemon_basic_provider.dart';
import 'package:pokedex_app/intrastrucuture/providers/pokemon_detail_provider.dart';
import 'package:pokedex_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PokemonBasicProvider()),
        ChangeNotifierProvider(create: (context) => PokemonDetailProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardListPokemonScreen(),
      ),
    );
  }
}
