import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final Color fondo = Colors.white;
  final Color iconoColor = Color(0xFFE57373);
  final Color campoColor = Colors.grey.shade100;
  final Color botonColor = Color(0xFFE57373);
  final Color texto = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fondo,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add, size: 80, color: iconoColor),
              const SizedBox(height: 16),
              Text(
                "Empecemos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: iconoColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Crear una nueva cuenta",
                style: TextStyle(fontSize: 16, color: texto.withOpacity(0.6)),
              ),
              const SizedBox(height: 32),
              _buildTextField("Nombre completo", Icons.person, fullNameController),
              const SizedBox(height: 16),
              _buildTextField("Correo electrónico", Icons.email, emailController),
              const SizedBox(height: 16),
              _buildTextField("Contraseña", Icons.lock, passwordController, isPassword: true),
              const SizedBox(height: 16),
              _buildTextField("Confirmar contraseña", Icons.lock_outline, confirmPasswordController, isPassword: true),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Aquí podrías validar los datos antes de navegar
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: botonColor,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("¿Ya tienes una cuenta?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(
                      "Iniciar sesión",
                      style: TextStyle(color: iconoColor),
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

  Widget _buildTextField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: campoColor,
        labelText: label,
        prefixIcon: Icon(icon, color: iconoColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
