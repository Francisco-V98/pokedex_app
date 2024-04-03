import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/providers/pokemon_detail_provider.dart';
import 'package:provider/provider.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Color backgroundColor;
  final String namePokemon;
  final int idPokemon;
  final int imgPokemon;
  const PokemonDetailScreen({
    super.key,
    required this.backgroundColor,
    required this.namePokemon,
    required this.idPokemon,
    required this.imgPokemon,
  });

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
      body: _Body(
        idPokemon: idPokemon,
        backgroundColor: backgroundColor,
        imgPokemon: imgPokemon,
        namePokemon: namePokemon,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    required this.idPokemon,
    required this.backgroundColor,
    required this.imgPokemon,
    required this.namePokemon,
  });

  final int idPokemon;
  final Color backgroundColor;
  final int imgPokemon;
  final String namePokemon;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    getStats();
  }

  Future<void> getStats() async {
    await Provider.of<PokemonDetailsProvider>(context, listen: false)
        .fetchPokemonDetails(widget.namePokemon);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            whiteSectionData(context),
          ],
        ),
        Center(
          heightFactor: 1,
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.imgPokemon}.png',
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget whiteSectionData(BuildContext context) {
    final stats = Provider.of<PokemonDetailsProvider>(context).pokemonStats;
    return Expanded(
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
              pokemonID(),
              tabBarPokemonData(stats),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarPokemonData(stats) {
    if (stats == null) {
      return const CircularProgressIndicator();
    }
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Estadisticas'),
              Tab(text: 'Informacion'),
              Tab(text: 'Movimientos'),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 377,
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Text('hp: ${stats.hp}'),
                            Text('attack: ${stats.attack}'),
                            Text('defense: ${stats.defense}'),
                            Text('special-attack: ${stats.specialAttack}'),
                            Text('special-defense: ${stats.specialDefense}'),
                            Text('speed: ${stats.speed}'),
                          ],
                        ),
                      ],
                    ),
                    const Center(child: Text('Hola 2')),
                    const Center(child: Text('Hola 3')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pokemonID() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Pokemon ID',
          style: TextStyle(color: Colors.black38),
        ),
        Text(
          widget.idPokemon.toString().padLeft(3, '0'),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: widget.backgroundColor,
          ),
        ),
      ],
    );
  }
}



