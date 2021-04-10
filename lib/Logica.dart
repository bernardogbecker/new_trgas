import 'package:flutter/cupertino.dart';

List trechosGlobal = [];
bool multiResidencial;
bool gnv;
String nomedoProjeto;

class DadosTrechos {
  String nome;
  double comprimentoNormal;
  double desniveis;
  int cotovelos90;
  int cotovelos45;
  int tes;
  double kcal;
  List potenciasSalvas;
  String diametroEscolhido = '1.1/4';
  TextEditingController controller = TextEditingController();
  double pinicial;
  double pfinal;
}

List potenciaInstalada = [
  {
    'Aparelho': 'Fogão duas bocas | Portátil',
    'Potência': 2494,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão duas bocas | De bancada',
    'Potência': 3096,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão quatro bocas | Sem forno',
    'Potência': 6966,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão quatro bocas | Com forno',
    'Potência': 9288,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão cinco bocas | Sem forno',
    'Potência': 9976,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão cinco bocas | Com forno',
    'Potência': 13390,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão seis bocas | Sem forno',
    'Potência': 9976,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Fogão seis bocas | Com forno',
    'Potência': 13390,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Forno | De parede',
    'Potência': 3010,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 6 L/min',
    'Potência': 9000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 8 L/min',
    'Potência': 12000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 10 L/min',
    'Potência': 15000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 12 L/min',
    'Potência': 18000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 15 L/min',
    'Potência': 22000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 18 L/min',
    'Potência': 26500,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 25 L/min',
    'Potência': 36000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 30 L/min',
    'Potência': 45500,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de passagem | 35 L/min',
    'Potência': 49000,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de acumulação | 50 L',
    'Potência': 4360,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de acumulação | 75 L',
    'Potência': 6003,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de acumulação | 100 L',
    'Potência': 7078,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de acumulação | 150 L',
    'Potência': 8153,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de acumulação | 200 L',
    'Potência': 10501,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Aquecedor de acumulação | 300 L',
    'Potência': 14998,
    'Contagem': 0,
  },
  {
    'Aparelho': 'Secadora | De roupa',
    'Potência': 6020,
    'Contagem': 0,
  },
];
