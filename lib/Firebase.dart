import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Logica.dart';
import 'package:alert/alert.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

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
    if (kIsWeb)
      showOkAlertDialog(
          context: context, title: 'Sucesso!', message: 'Usuário cadastrado.');
    else
      Alert(message: 'Email cadastrado com sucesso!').show();
  } catch (e) {
    if (e.code == 'weak-password') {
      if (kIsWeb)
        showOkAlertDialog(
            context: context, title: 'Erro!', message: 'Senha muito fraca.');
      else
        Alert(message: 'Senha muito fraca.').show();
    } else if (e.code == 'email-already-in-use') {
      if (kIsWeb)
        showOkAlertDialog(
            context: context, title: 'Erro!', message: 'Email já cadastrado.');
      else
        Alert(message: 'Email já cadastrado.').show();
    } else {
      if (kIsWeb)
        showOkAlertDialog(
            context: context, title: 'Erro!', message: 'tente novamente.');
      else
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
        if (kIsWeb)
          showOkAlertDialog(
              context: context, title: 'Erro!', message: 'Email incorreto.');
        else
          Alert(message: 'Email incorreto.').show();
        break;
      case ('wrong-password'):
        if (kIsWeb)
          showOkAlertDialog(
              context: context, title: 'Erro!', message: 'Senha incorreta.');
        else
          Alert(message: 'Senha incorreta.').show();
        break;
      case ('user-not-found'):
        if (kIsWeb)
          showOkAlertDialog(
              context: context,
              title: 'Erro!',
              message: 'Email não cadastrado.');
        else
          Alert(message: 'Email não cadastrado.').show();
        break;
      default:
        if (kIsWeb)
          showOkAlertDialog(
              context: context, title: 'Erro!', message: 'Tente novamente.');
        else
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
    print(e.toString());
    if (kIsWeb)
      showOkAlertDialog(
          context: context, title: 'Erro!', message: e.toString());
    else
      Alert(message: 'Tente novamente.').show();
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
