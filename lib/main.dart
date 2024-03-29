import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Telas/ChooseScreen.dart';
import 'Telas/ComprimentosScreen.dart';
import 'Telas/DesniveisScreen.dart';
import 'Telas/DiametrosScreen.dart';
import 'Telas/GasScreen.dart';
import 'Telas/HistoricoScreen.dart';
import 'Telas/MultiResidencialScreen.dart';
import 'Telas/PotenciaInstaladaScreen.dart';
import 'Telas/TesCotovelosScreen.dart';
import 'Telas/TrechosScreen.dart';
import 'Telas/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TrGas());
}

class TrGas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
      ),
      initialRoute: 'loginScreen',
      routes: {
        'loginScreen': (context) => LoginScreen(),
        'chooseScreen': (context) => ChooseScreen(),
        'multiResidencialScreen': (context) => MultiResidencialScreen(),
        'gasScreen': (context) => GasScreen(),
        'trechosScreen': (context) => TrechosScreen(),
        'comprimentosScreen': (context) => ComprimentoScreen(),
        'desniveisScreen': (context) => DesniveisScreen(),
        'tesCotovelosScreen': (context) => TesCotovelosScreen(),
        'potenciaInstaladaScreen': (context) => PotenciaInstaladaScreen(),
        'diametrosScreen': (context) => DiametrosScreen(),
        'historicoScreen': (context) => HistoricoScreen(),
      },
    );
  }
}
