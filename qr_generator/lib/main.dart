import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String uuid = const Uuid().v4();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _createLoginRequest();
  }

  void _createLoginRequest() {
    // Crear documento en Firestore con el UUID
    fireStore
        .collection('login_requests')
        .doc(uuid)
        .set({'authenticated': false});
    // Escuchar cambios en el documento
    fireStore
        .collection('login_requests')
        .doc(uuid)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists && snapshot.data()?['authenticated'] == true) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: QrImageView(
          data: uuid,
          size: 400,
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Login Successful!')),
    );
  }
}
