import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/metodoPago.dart';     

class VehicleDetailScreen extends StatelessWidget {
  final Map<String, dynamic> vehiculo;

  const VehicleDetailScreen({super.key, required this.vehiculo});

  @override
  Widget build(BuildContext context) {
    final bool disponible = vehiculo['disponibilidad'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle del Vehículo"),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                vehiculo['imageUrl'],
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Marca: ${vehiculo['marca']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Modelo: ${vehiculo['modelo']}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Año: ${vehiculo['anio']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Disponibilidad: ${disponible ? "Disponible" : "No Disponible"}',
              style: TextStyle(
                fontSize: 16,
                color: disponible ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: disponible
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MetodoPagoScreen(),
                        ),
                      );
                    }
                  : null,
              icon: const Icon(Icons.car_rental),
              label: const Text("Alquilar Vehículo"),
              style: ElevatedButton.styleFrom(
                backgroundColor: disponible ? Colors.redAccent : Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
