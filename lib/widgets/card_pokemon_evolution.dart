import 'package:flutter/material.dart';

class CardPokemonEvolution extends StatelessWidget {
  final String id;
  final String idEvolution;
  final String name;
  final Color color;
  final String image;
  const CardPokemonEvolution({
    super.key,
    required this.id,
    required this.name,
    required this.color,
    required this.image, required this.idEvolution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(id),
                        Text(name),
                        Text(idEvolution),
                      ],
                    ),
                    trailing: Image.network(image),
                  ),
                  Divider(color: color.withOpacity(0.7)),
                ],
              );
  }
}
