import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/widgets.dart';

class CardPokemonListView extends StatelessWidget {
  final Color backgroundColor;
  final String idPokemon;
  // final String imgPokemon;
  final String namePokemon;
  const CardPokemonListView({
    super.key,
    required this.backgroundColor,
    required this.idPokemon,
    // required this.imgPokemon,
    required this.namePokemon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              idPokemon,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            Text(
              namePokemon,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.4,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 56,
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