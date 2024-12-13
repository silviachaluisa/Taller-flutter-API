import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://pokeapi.co/api/v2/pokemon/";

  // Función para obtener una lista de nombres de Pokémon
  Future<List<String>> fetchPokemonNames() async {
    try {
      final url = Uri.parse(baseUrl + "?limit=100");
      print("Realizando solicitud para obtener nombres de Pokémon en URL: $url");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<String> names = [];
        for (var pokemon in data['results']) {
          names.add(pokemon['name']);
        }
        print("Lista de nombres obtenida: $names");
        return names;
      } else {
        throw Exception(
            "Error al obtener la lista de nombres de Pokémon. Código de estado: ${response.statusCode}");
      }
    } catch (e) {
      print("Error al realizar solicitud para nombres de Pokémon: $e");
      throw Exception("No se pudo cargar la lista de Pokémon.");
    }
  }

  // Función para buscar un Pokémon por nombre
  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    try {
      final url = Uri.parse(baseUrl + "$name");
      print("Realizando solicitud para obtener detalles del Pokémon en URL: $url");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("Datos obtenidos para el Pokémon: $data");
        return data;
      } else {
        throw Exception(
            'Error al cargar datos para el Pokémon: $name. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print("Error al realizar solicitud para el Pokémon: $e");
      throw Exception("No se pudo cargar los datos del Pokémon.");
    }
  }
}
