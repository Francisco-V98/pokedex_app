import 'package:flutter/material.dart';
import 'package:pokedex_app/intrastrucuture/providers/pokemon_basic_provider.dart';
import 'package:pokedex_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
  void didChangeDependencies() {
    getPokemons();
    super.didChangeDependencies();
  }

  Future<void> getPokemons() async {
    await Provider.of<PokemonBasicProvider>(context).getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<PokemonBasicProvider>(
        builder: (context, value, child) {
          final pokemons =
              Provider.of<PokemonBasicProvider>(context).pokemonsList;

          return CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: pokemons.length,
                  (context, index) {
                    final pokemon = pokemons[index];

                    return CardPokemonListView(
                      backgroundColor: Colors.blueAccent,
                      idPokemon: (index + 1),
                      namePokemon: pokemon.name,
                      imgPokemon: (index + 1),
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 150,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
