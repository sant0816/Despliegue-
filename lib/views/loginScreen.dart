import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/menuPrincipal.dart';
import 'package:flutter_application_4/views/registerScreen.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color fondo = Color(0xFFAFDDFF);
  final Color encabezado = Color(0xFF6DB5FF);
  final Color campos = Color(0xFFFFECD8);
  final Color boton = Color(0xFFFF914D);
  final Color texto = Color(0xFF222222);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Icon(Icons.person_pin, size: 80, color: encabezado),
              SizedBox(height: 16),
              Text(
                "Bienvenido",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: encabezado,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Inicia sesión para continuar",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: texto.withOpacity(0.7)),
              ),
              SizedBox(height: 60),
              TextField(
                controller: emailController,
                style: TextStyle(color: texto),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: campos,
                  labelText: "Correo electrónico",
                  labelStyle: TextStyle(color: texto),
                  prefixIcon: Icon(Icons.email, color: encabezado),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: texto),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: campos,
                  labelText: "Contraseña",
                  labelStyle: TextStyle(color: texto),
                  prefixIcon: Icon(Icons.lock, color: encabezado),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menuprincipal()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: boton,
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text(
                  "Iniciar sesión",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿Olvidaste tu contraseña?", style: TextStyle(color: texto)),
                  TextButton(
                    onPressed: () {}, // Implementar luego
                    child: Text(
                      "Recuperar",
                      style: TextStyle(color: encabezado, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿No tienes cuenta?", style: TextStyle(color: texto)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: Text(
                      "Regístrate",
                      style: TextStyle(color: encabezado, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
