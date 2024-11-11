import 'package:flutter/material.dart';
import 'package:multipantallas/bienvenida.dart';

// Método main
void main() {
  runApp(const Primera());
}

class Primera extends StatelessWidget {
  const Primera({super.key});
  // Método que construye los widgets de la app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiformularios",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Pantalla(),
    );
  }
}

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  // Id de los campos de texto
  var txtLogin = TextEditingController();
  var txtPassword = TextEditingController();
  // Variables para almacenar los datos ingresados por el usuario
  var nombre = "";
  var clave = " ";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("img/background.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Multiformularios"),
        ),
        body: ListView(
          children: [
            // Agregamos el logo
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              alignment: Alignment.center,
              child: Image.asset("img/dart_logo.png"),
            ),
            // Agregamos el campo de texto para el login con ícono
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Nombre de Usuario",
                  prefixIcon: const Icon(Icons.person, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                controller: txtLogin,
              ),
            ),
            // Agregamos el campo de texto para el password con ícono
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Clave de usuario",
                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                obscureText: true,
                controller: txtPassword,
              ),
            ),
            // Agregamos el botón de validar con estilo mejorado
            Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Código del botón
                  nombre = txtLogin.text;
                  clave = txtPassword.text;
                  if (nombre == "Rafael" && clave == "password") {
                    Navigator.of(context).push(
                      MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return Bienvenida(nombre);
                        },
                      ),
                    );
                    } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                        children: const [
                          Icon(Icons.warning, color: Colors.red),
                          SizedBox(width: 10),
                          Text("Advertencia"),
                        ],
                        ),
                        content: const SingleChildScrollView(
                        child: ListBody(
                          children: [
                          Text("Verifica tus Credenciales"),
                          ],
                        ),
                        ),
                        actions: [
                        TextButton(
                          onPressed: () {
                          Navigator.of(context).pop();
                          },
                          child: const Text("Aceptar"),
                        ),
                        ],
                      );
                      },
                    );
                    }
                  },
                label: const Text(
                  "Validar",
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.check_circle, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
