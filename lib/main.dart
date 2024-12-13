import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscar Pokémon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonScreen(),
    );
  }
}

class PokemonScreen extends StatefulWidget {
  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final ApiService apiService = ApiService();
  List<String> pokemonNames = [];
  String? selectedPokemon;
  Map<String, dynamic>? pokemon;
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadPokemonNames();
  }

  // Cargar la lista de nombres de Pokémon
  Future<void> _loadPokemonNames() async {
    try {
      final names = await apiService.fetchPokemonNames();
      setState(() {
        pokemonNames = names;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'No se pudo cargar la lista de Pokémon';
      });
    }
  }

  // Buscar el detalle del Pokémon seleccionado
  Future<void> fetchPokemonDetails(String name) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      final data = await apiService.fetchPokemon(name);
      setState(() {
        pokemon = data;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'No se pudo encontrar el Pokémon';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo con gradiente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFEF3B36)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Imagen en la parte superior
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.network(
                  'https://img.icons8.com/color/344/pokemon.png',
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(height: 10),
              // Campo de búsqueda
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  hint: Text(
                    'Selecciona un Pokémon',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: selectedPokemon,
                  dropdownColor: Colors.redAccent,
                  items: pokemonNames.map((name) {
                    return DropdownMenuItem<String>(
                      value: name,
                      child: Text(
                        name[0].toUpperCase() + name.substring(1),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedPokemon = value;
                      });
                      fetchPokemonDetails(value);
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              isLoading
    ? Center(
        child: CircularProgressIndicator(),
      )
    : pokemon != null
        ? SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    pokemon!['sprites']['front_default'] ?? '',
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 10),
                  Text(
                    pokemon!['name']?.toString().toUpperCase() ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Peso: ${pokemon!['weight']?.toString() ?? 'N/A'}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(
                    'Habilidad principal: ${pokemon!['abilities'][0]['ability']['name'] ?? 'N/A'}',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        : errorMessage.isNotEmpty
            ? Center(
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              )
            : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
