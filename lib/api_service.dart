import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://pokeapi.co/api/v2/pokemon/";

  // Función para obtener una lista de nombres de Pokémon
  Future<List<String>> fetchPokemonNames() async {
    final response = await http.get(Uri.parse(baseUrl + "?limit=100"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<String> names = [];
      for (var pokemon in data['results']) {
        names.add(pokemon['name']);
      }
      return names;
    } else {
      throw Exception("Error al obtener la lista de nombres de Pokémon");
    }
  }

  // Función para buscar un Pokémon por nombre
  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final url = baseUrl + "$name";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar datos para el Pokémon: $name');
    }
  }
}
