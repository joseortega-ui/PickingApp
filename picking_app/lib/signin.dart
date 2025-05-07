import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart' as http;
import 'dart:convert';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    var url = Uri.parse('https://intranetcorporativo.avantetextil.com/Auth/Applogin');

    var client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    var ioClient = http.IOClient(client);

    try {
      final response = await ioClient.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({
          "username": username,
          "password": password,
        }),
      );

      print('STATUS: ${response.statusCode}');
      print('BODY: ${response.body}');
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  height: 150,
                  margin: const EdgeInsets.only(top: 30),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Text(
                  '¡Bienvenido!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const Text(
                  'Inicia Sesión en tu Cuenta',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                const SizedBox(height: 22),

                // Usuario
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      border: InputBorder.none,
                      hintText: 'Usuario',
                      hintStyle: TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Contraseña
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                      hintStyle: const TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Botón login
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Iniciar Sesion",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}