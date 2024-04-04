import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/providers/pokemon_information_provider.dart';
import 'package:pokedex_app/intrastrucuture/providers/pokemon_stats_provider.dart';
import 'package:pokedex_app/widgets/widgets.dart';
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
    getInformation();
  }

  Future<void> getStats() async {
    await Provider.of<PokemonStatsProvider>(context, listen: false)
        .fetchPokemonDetails(widget.namePokemon);
  }

  Future<void> getInformation() async {
    await Provider.of<PokemonInformationProvider>(context, listen: false)
        .fetchPokemonInformation(widget.namePokemon);
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
    final stats = Provider.of<PokemonStatsProvider>(context).pokemonStats;
    final information =
        Provider.of<PokemonInformationProvider>(context).pokemonInformation;
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
              tabBarPokemonData(stats, information),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarPokemonData(stats, information) {
    if (stats == null || information == null) {
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
              Tab(text: 'Evolucion'),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 377,
                child: TabBarView(
                  children: [
                    statsSection(stats),
                    informationSection(information),
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

  Widget informationSection(information) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextDataInformation(
                title: 'Description',
                description: information.flavorText,
              ),
              TextDataInformation(
                title: 'Name',
                description: information.name,
              ),
              TextDataInformation(
                title: 'ID',
                description: information.id.toString(),
              ),
              TextDataInformation(
                title: 'Evolution ID',
                description: information.evolutionId(),
              ),
              TextDataInformation(
                title: 'Base Happiness:',
                description: information.baseHappiness.toString(),
              ),
              TextDataInformation(
                title: 'Capture Rate',
                description: '${information.captureRate.toString()}%',
              ),
              TextDataInformation(
                title: 'Habitat',
                description: information.habitat,
              ),
              TextDataInformation(
                title: 'Growth Rate',
                description: information.growthRate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statsSection(stats) {
    return Column(
      children: [
        Column(
          children: [
            LineBarIndicator(
              title: 'hp',
              value: stats.hp,
              color: widget.backgroundColor,
            ),
            LineBarIndicator(
              title: 'attack',
              value: stats.attack,
              color: widget.backgroundColor,
            ),
            LineBarIndicator(
              title: 'defense',
              value: stats.defense,
              color: widget.backgroundColor,
            ),
            LineBarIndicator(
              title: 'special. Attack',
              value: stats.specialAttack,
              color: widget.backgroundColor,
            ),
            LineBarIndicator(
              title: 'special. Defense',
              value: stats.specialDefense,
              color: widget.backgroundColor,
            ),
            LineBarIndicator(
              title: 'speed',
              value: stats.speed,
              color: widget.backgroundColor,
            ),
          ],
        ),
      ],
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

class TextDataInformation extends StatelessWidget {
  final String title;
  final String description;
  const TextDataInformation({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: 330,
          child: Text(description.replaceAll('\n', ' ')),
        ),
        const SizedBox(height: 6),
        const Divider(),
      ],
    );
  }
}
