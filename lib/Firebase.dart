import 'package:alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Logica.dart';
import 'Logica.dart';
import 'Logica.dart';
import 'Logica.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

Future<void> registerToFirebase(
    {String email, String senha, BuildContext context}) async {
  print(email);
  print(senha);
  print(auth);
  try {
    await auth.createUserWithEmailAndPassword(email: email, password: senha);
    Navigator.pushNamed(context, 'chooseScreen');
    Alert(message: 'Email cadastrado com sucesso!').show();
  } catch (e) {
    print(e);
    if (e.code == 'weak-password') {
      Alert(message: 'Senha muito fraca.').show();
    } else if (e.code == 'email-already-in-use') {
      Alert(message: 'Email já cadastrado.').show();
    } else {
      Alert(message: 'Erro, tente novamente!').show();
    }
  }
}

Future<void> loginToFirebase(
    {String email, String senha, BuildContext context}) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: senha);
    Navigator.pushNamed(context, 'chooseScreen');
  } catch (e) {
    print(e);
    switch (e.code) {
      case ('invalid-email'):
        Alert(message: 'Email incorreto.').show();
        break;
      case ('wrong-password'):
        Alert(message: 'Senha incorreta.').show();
        break;
      case ('user-not-found'):
        Alert(message: 'Email não cadastrado.').show();
        break;
      default:
        Alert(message: 'Erro, tente novamente').show();
        break;
    }
  }
}

Future<void> signInWithGoogle({context}) async {
  try {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushNamed(context, 'chooseScreen');
  } catch (e) {
    Alert(message: e.toString()).show();
  }
}

Future<void> saveFirestore() async {
  Map<String, List> dados = {};
  int i = 0;
  for (DadosTrechos dado in trechosGlobal) {
    dados[i.toString()] = dado.textstoShow;
    i++;
  }
  await firestore.collection('Projetos').add(
    {
      'Data': DateTime.now(),
      'Nome': nomedoProjeto,
      'Dados': dados,
    },
  );
}
