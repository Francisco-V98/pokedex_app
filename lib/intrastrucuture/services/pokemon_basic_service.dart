// import 'package:dio/dio.dart';

// import '../models/pokemon_basic_model.dart';
// class PokemonBasicService {
//     List<PokemonBasicModel> pokemons = [];

//   @override
//   void setState(VoidCallback fn) {
//     super.setState(fn);
//     getPokemonBasic();
//   }

//   Future getPokemonBasic() async {
//     const url = 'https://pokeapi.co/api/v2/pokemon?limit=50';
//     var dio = Dio();
//     try {
//       Response response = await dio.get(url);
//       if (response.statusCode == 200) {
//         List jsonData = response.data['Result'];
//         setState(() {
//           pokemons =
//               jsonData.map((e) => PokemonBasicModel.fromJson(e)).toList();
//         });
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print('Error: $e');
//     }
//   }
// }