import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/loginScreen.dart';
import 'package:flutter_application_4/views/menuDrawerPerfil.dart';
import 'package:flutter_application_4/views/detalleVehiculo.dart'; // Asegúrate de que esta ruta esté correcta

class Menuprincipal extends StatefulWidget {
  const Menuprincipal({super.key});

  @override
  State<Menuprincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<Menuprincipal> {
  final Color fondo = Color(0xFFFFFFFF);
  final Color primario = Color(0xFF60B5FF);
  final Color secundario = Color(0xFFAFDDFF);
  final Color detalle = Color(0xFFFF9149);
  final Color texto = Color(0XFF222222);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      appBar: AppBar(
        title: Text("Alquiler de vehículos"),
        backgroundColor: primario,
        foregroundColor: fondo,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primario),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nombre de Usuario',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'correo@ejemplo.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuDrawerPerfil()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: primario),
                hintText: "Buscar vehículo",
                hintStyle: TextStyle(color: texto.withOpacity(0.5)),
                filled: true,
                fillColor: secundario,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listaDeAutos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.network(
                      listaDeAutos[index]["imageUrl"],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      '${listaDeAutos[index]['marca']} Modelo ${listaDeAutos[index]['modelo']}',
                    ),
                    subtitle: Text(
                      'Año: ${listaDeAutos[index]['anio']} - ${listaDeAutos[index]['precio']}',
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue[300],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VehicleDetailScreen(
                            vehiculo: listaDeAutos[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Alquiler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> listaDeAutos = [
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Toyota",
    "modelo": "Corolla",
    "anio": 2020,
    "disponibilidad": true,
    "precio": '\$89.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Honda",
    "modelo": "Civic",
    "anio": 2019,
    "disponibilidad": false,
    "precio": '\$99.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Ford",
    "modelo": "Focus",
    "anio": 2018,
    "disponibilidad": true,
    "precio": '\$199.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Chevrolet",
    "modelo": "Cruze",
    "anio": 2021,
    "disponibilidad": true,
    "precio": '\$150.00/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Hyundai",
    "modelo": "Elantra",
    "anio": 2022,
    "disponibilidad": true,
    "precio": '\$190.00/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Kia",
    "modelo": "Forte",
    "anio": 2020,
    "disponibilidad": false,
    "precio": '\$89.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Mazda",
    "modelo": "Mazda3",
    "anio": 2019,
    "disponibilidad": true,
    "precio": '\$89.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Nissan",
    "modelo": "Sentra",
    "anio": 2021,
    "disponibilidad": true,
    "precio": '\$99.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Volkswagen",
    "modelo": "Jetta",
    "anio": 2020,
    "disponibilidad": true,
    "precio": '\$99.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "BMW",
    "modelo": "Serie 3",
    "anio": 2017,
    "disponibilidad": false,
    "precio": '\$89.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Audi",
    "modelo": "A4",
    "anio": 2018,
    "disponibilidad": true,
    "precio": '\$89.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Mercedes-Benz",
    "modelo": "Clase C",
    "anio": 2019,
    "disponibilidad": false,
    "precio": '\$89.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Subaru",
    "modelo": "Impreza",
    "anio": 2021,
    "disponibilidad": true,
    "precio": '\$99.99/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Tesla",
    "modelo": "Model 3",
    "anio": 2022,
    "disponibilidad": true,
    "precio": '\$150.00/día'
  },
  {
    "imageUrl": "https://picsum.photos/200/300",
    "marca": "Peugeot",
    "modelo": "308",
    "anio": 2020,
    "disponibilidad": false,
    "precio": '\$89.99/día'
  },
];
