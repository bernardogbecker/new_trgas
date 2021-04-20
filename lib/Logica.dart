import 'dart:math';
import 'package:flutter/cupertino.dart';

List trechosGlobal = [];
bool multiResidencial;
bool gn;
String nomedoProjeto;
double porcentagemfinal;

class DadosTrechos {
  String nome;
  double comprimentoNormal;
  double desniveis;
  int cotovelos90;
  int cotovelos45;
  int tes;
  List potenciasSalvas;
  String diametroEscolhido = '1.1/4';
  double diametroEmMM = 33.6;
  TextEditingController controller = TextEditingController();
  double pinicial;
  double pfinal;
  double deltaP;
  double perdaDeCarga;
  double potenciaInstaladavalor = 0;
  double potenciaInstaladaSoma = 0;
  double potenciaComputadaFinal = 0;
  double potenciaAdotada = 0;
  double fatorSimultaneidade = 100;
  double vazaodoGas = 0;
  double velocidade = 0;
  double pci = 0;
  double densidadeRelativa = 0;
  double leq = 0;
  double ltotal = 0;
  List textstoShow = [];

  void calculatetextstoShow() {
    textstoShow = [
      nome,
      potenciaComputadaFinal.toStringAsFixed(2),
      fatorSimultaneidade.toStringAsFixed(2),
      potenciaAdotada.toStringAsFixed(2),
      vazaodoGas.toStringAsFixed(2),
      velocidade.toStringAsFixed(2),
      comprimentoNormal.toStringAsFixed(2),
      desniveis.toStringAsFixed(2),
      leq.toStringAsFixed(2),
      ltotal.toStringAsFixed(2),
      pinicial.toStringAsFixed(2),
      pfinal.toStringAsFixed(2),
      deltaP.toStringAsFixed(2),
      perdaDeCarga.toStringAsFixed(2),
      diametroEscolhido,
    ];
  }

  void calculatepotenciaInstalada() {
    potenciaInstaladavalor = 0;
    for (Map aparelho in potenciasSalvas) {
      potenciaInstaladavalor += aparelho['Potência'] * aparelho['Contagem'];
    }
  }

  void calculatepotenciaComputada() {
    potenciaComputadaFinal = potenciaInstaladaSoma / 859.84522;
  }

  double calculateFS() {
    if (potenciaComputadaFinal < 24.43) return 100;
    if (potenciaComputadaFinal < 670.9)
      return 100 /
          (1 + 0.01016 * (pow(potenciaComputadaFinal - 24.37, 0.8712)));
    if (potenciaComputadaFinal < 1396)
      return 100 /
          (1 + 0.7997 * (pow(potenciaComputadaFinal - 73.67, 0.19931)));
    return 23;
  }

  void calculatepotenciaAdotada() {
    potenciaAdotada = potenciaInstaladaSoma * fatorSimultaneidade / 100;
  }

  void calculatevazaodoGas() {
    if (gn) {
      pci = 8600;
      densidadeRelativa = 0.6;
    } else {
      pci = 24000;
      densidadeRelativa = 1.8;
    }
    vazaodoGas = potenciaAdotada / pci;
  }

  void calculateLequivalenteEDiamentroEmMM() {
    switch (diametroEscolhido) {
      case '3/8':
        diametroEmMM = 10.4;
        leq = cotovelos45 * 0.4 + cotovelos90 * 1.1 + tes * 2.3;
        break;
      case '1/2':
        diametroEmMM = 14;
        leq = cotovelos45 * 0.4 + cotovelos90 * 1.1 + tes * 2.3;
        break;
      case '3/4':
        diametroEmMM = 20.8;
        leq = cotovelos45 * 0.5 + cotovelos90 * 1.2 + tes * 2.4;
        break;
      case '1':
        diametroEmMM = 26.8;
        leq = cotovelos45 * 0.7 + cotovelos90 * 1.5 + tes * 3.1;
        break;
      case '1.1/4':
        diametroEmMM = 33.6;
        leq = cotovelos45 * 1 + cotovelos90 * 2 + tes * 4.6;
        break;
      case '1.1/2':
        diametroEmMM = 40.4;
        leq = cotovelos45 * 1 + cotovelos90 * 3.2 + tes * 7.3;
        break;
      case '2':
        diametroEmMM = 52.2;
        leq = cotovelos45 * 1.3 + cotovelos90 * 3.4 + tes * 7.6;
        break;
      case '2.1/2':
        diametroEmMM = 64.7;
        leq = cotovelos45 * 1.7 + cotovelos90 * 3.7 + tes * 7.8;
        break;
      case '3':
        diametroEmMM = 77;
        leq = cotovelos45 * 1.8 + cotovelos90 * 3.9 + tes * 8.0;
        break;
      case '4':
        diametroEmMM = 102.4;
        leq = cotovelos45 * 1.9 + cotovelos90 * 4.3 + tes * 8.3;
        break;
      default:
        leq = 0;
    }
  }

  void calculateltotal() {
    ltotal = comprimentoNormal + leq + desniveis;
  }

  void calculatedeltaP() {
    deltaP = ((467000 *
            densidadeRelativa *
            ltotal *
            pow(vazaodoGas, 1.82) /
            pow(diametroEmMM, 4.82))) -
        (0.01318 * desniveis * (densidadeRelativa - 1));
  }

  void calculatePerdadeCarga() => perdaDeCarga = pinicial - pfinal;
  void calculateVelocidade() => velocidade = 354 *
      vazaodoGas *
      pow(((pfinal / 100) + 1.033), -0.1) *
      (pow(diametroEmMM, -2));
}

void calculatePfinalEInicial() {
  trechosGlobal.asMap().forEach((index, trecho) {
    trecho.pfinal = sqrt(pow(trecho.pinicial, 2) - trecho.deltaP);
    if (index < trechosGlobal.length - 1)
      trechosGlobal[index + 1].pinicial = trecho.pfinal;
  });
}

void calculateponteciaInstaladaSoma() {
  trechosGlobal[trechosGlobal.length - 1].potenciaInstaladaSoma =
      trechosGlobal[trechosGlobal.length - 1].potenciaInstaladavalor;
  for (int i = trechosGlobal.length - 2; i >= 0; i--) {
    trechosGlobal[i].potenciaInstaladaSoma =
        trechosGlobal[i].potenciaInstaladavalor +
            trechosGlobal[i + 1].potenciaInstaladaSoma;
  }
}

void calculoGeral() {
  for (DadosTrechos trecho in trechosGlobal)
    trecho.calculatepotenciaInstalada();
  calculateponteciaInstaladaSoma();
  for (DadosTrechos trecho in trechosGlobal) {
    trecho.calculatepotenciaComputada();
    trecho.fatorSimultaneidade = trecho.calculateFS();
    trecho.calculatepotenciaAdotada();
    trecho.calculatevazaodoGas();
    trecho.calculateLequivalenteEDiamentroEmMM();
    trecho.calculateltotal();
    trecho.calculatedeltaP();
  }
  calculatePfinalEInicial();
  for (DadosTrechos trecho in trechosGlobal) {
    trecho.calculatePerdadeCarga();
    trecho.calculateVelocidade();
  }
  for (DadosTrechos trecho in trechosGlobal) trecho.calculatetextstoShow();
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
