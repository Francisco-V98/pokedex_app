import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Color backgroundColor;
  final String namePokemon;
  final int idPokemon;
  final int imgPokemon;
  const PokemonDetailScreen(
      {super.key,
      required this.backgroundColor,
      required this.namePokemon,
      required this.idPokemon,
      required this.imgPokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(namePokemon),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Expanded(
                child: Center(
                  heightFactor: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(48),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        pokemonId(),
                        tanBarPokemonInformation(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            heightFactor: 1,
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$imgPokemon.png',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  DefaultTabController tanBarPokemonInformation() {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Estadisticas'),
              Tab(text: 'Informacion'),
              Tab(text: 'Movimientos'),
            ],
          ),
        ],
      ),
    );
  }

  Column pokemonId() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Pokemon ID',
          style: TextStyle(color: Colors.black38),
        ),
        Text(
          idPokemon.toString().padLeft(3, '0'),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: backgroundColor,
          ),
        ),
      ],
    );
  }
}
