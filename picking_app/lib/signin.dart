import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                // Shield Logo
                Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 0, 0, 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
  
                  margin: EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(0),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
                // Sign in text
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: const Text(
                    '¡Bienvenido!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Inicia Sesión en tu Cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                // Email field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      hintText: 'Usuario',
                      hintStyle: TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Password field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
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
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      hintText: 'Contraseña',
                      hintStyle: const TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF000000),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      "Iniciar Sesion",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
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
    super.dispose();
  }
}