import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/models/pokemon_basic_model.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class DashboardListPokemonScreen extends StatelessWidget {
  const DashboardListPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarPokedex(title: 'Pokedex'),
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) {
                return const CardPokemonListView(
                  backgroundColor: Colors.blueAccent,
                  idPokemon: '004',
                  namePokemon: 'charmander',
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
          ),
        ],
      ),
    );
  }
}




