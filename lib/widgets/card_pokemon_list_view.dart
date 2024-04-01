import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class CardPokemonListView extends StatelessWidget {
  final Color backgroundColor;
  final int idPokemon;
  final int imgPokemon;
  final String namePokemon;
  const CardPokemonListView({
    super.key,
    required this.backgroundColor,
    required this.idPokemon,
    // required this.imgPokemon,
    required this.namePokemon,
    required this.imgPokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              namePokemon,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.4,
              ),
            ),
            Text(
              '#${idPokemon.toString().padLeft(3, '0')}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$imgPokemon.png',
                // width: 50,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            const ChipTypePokemon(
              textChip: 'Fuego',
              backgroundChip: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}
