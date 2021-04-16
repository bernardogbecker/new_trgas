import 'package:flutter/material.dart';
import 'Telas/ChooseScreen.dart';
import 'Telas/GasScreen.dart';
import 'Telas/MultiResidencialScreen.dart';
import 'Telas/loginscreen.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
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
        /*'trechosScreen': (context) => TrechosScreen(),
        'comprimentosScreen': (context) => ComprimentoScreen(),
        'desniveisScreen': (context) => DesniveisScreen(),
        'tesCotovelosScreen': (context) => TesCotovelosScreen(),
        'potenciaInstaladaScreen': (context) => PotenciaInstaladaScreen(),
        'diametrosScreen': (context) => DiametrosScreen(),
        'pdfScreen': (context) => PdfScreen(),
        'historicoScreen': (context) => HistoricoScreen(), */
      },
    );
  }
}
