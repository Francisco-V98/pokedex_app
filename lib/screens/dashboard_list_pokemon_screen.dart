import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_basic_model.dart';

class DashboardListPokemonScreen extends StatelessWidget {
  const DashboardListPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  List<PokemonBasicModel> pokemons = [];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    getPokemonBasic();
  }

  Future getPokemonBasic() async {
    const url = 'https://pokeapi.co/api/v2/pokemon?limit=50';
    var dio = Dio();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        List jsonData = response.data['Result'];
        setState(() {
          pokemons = jsonData.map((e) => PokemonBasicModel.fromJson(e)).toList();
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('data'),
    );
  }
}
