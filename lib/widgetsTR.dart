import 'package:flutter/material.dart';
import 'constants.dart';

class WriteLoginButton extends StatelessWidget {
  const WriteLoginButton({
    Key key,
    @required this.size,
    this.iconData,
    this.titulo,
    this.controller,
  }) : super(key: key);

  final IconData iconData;
  final Size size;
  final String titulo;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.6,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: ktriblue,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [shadow1black, shadow1blue],
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(width: 15),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: false,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: titulo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({this.size, this.texto, this.onTap});

  final Size size;
  final String texto;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ktriblue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [shadow1black, shadow1blue],
      ),
      width: size.width * 0.275,
      height: size.height * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FlatButton(
          onPressed: (onTap == null) ? () {} : onTap,
          child: Center(
            child: Text(texto,
                textAlign: TextAlign.center,
                style:
                    ktextTituloStyle.copyWith(fontSize: size.height * 0.015)),
          ),
        ),
      ),
    );
  }
}

class LoginWithButton extends StatelessWidget {
  LoginWithButton({@required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ktriblue,
        borderRadius: BorderRadius.circular(500),
        boxShadow: [shadow1black, shadow1blue],
      ),
      height: size.height * 0.04,
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.login,
                color: Colors.white,
              ),
              Text(
                'Sing in with Google',
                style: ktextTituloStyle.copyWith(
                    fontSize: size.height * 0.015, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FundoTrGas extends StatelessWidget {
  const FundoTrGas({
    Key key,
    @required this.children,
    @required this.size,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ktrigrey1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.05),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: children),
        ),
      ),
    );
  }
}

class LogoTr extends StatelessWidget {
  final Size size;

  const LogoTr({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            width: size.width * 0.8 / 3,
            child: Image.asset(
              'imagens/Logo.png',
              fit: BoxFit.contain,
            )),
        SizedBox(
          width: size.width * 0.1,
        ),
      ],
    );
  }
}

class FundoTrGas2 extends StatelessWidget {
  const FundoTrGas2({
    Key key,
    @required this.children,
    @required this.size,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ktrigrey1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'TRGas',
                style: ktextTRGasStyle,
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.8,
                    decoration: BoxDecoration(
                        color: ktriblue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [shadow0black, shadow0white]),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.05, bottom: size.height * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: children,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseButton extends StatelessWidget {
  final Size size;
  final String texto;
  final Function onTap;
  final bool padding;
  final double changesize;
  final double changeTextsize;
  final double changesizeWidth;
  final double changePadding;
  const ChooseButton({
    Key key,
    this.texto,
    this.onTap,
    this.size,
    this.padding = true,
    this.changesize = 0.1,
    this.changeTextsize = 34,
    this.changesizeWidth,
    this.changePadding = 0.1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (padding) ? size.width * changePadding : 0),
      child: Container(
        width: (changesizeWidth == null)
            ? double.infinity
            : size.width * changesizeWidth,
        height: size.height * changesize,
        decoration: BoxDecoration(
          color: ktriblue,
          boxShadow: [shadow1black, shadow1blue],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            onPressed: onTap,
            child: Text(
              texto,
              style: ktextTituloStyle.copyWith(fontSize: changeTextsize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class BackIconButton extends StatelessWidget {
  final Size size;

  const BackIconButton({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.1),
      child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: size.height * 0.05,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context)),
    );
  }
}

class WriteButton extends StatelessWidget {
  final Size size;
  final String labeltext;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function onChanged;
  final bool changeSizeWidth;

  const WriteButton(
      {Key key,
      this.size,
      this.labeltext,
      this.controller,
      this.keyboardType,
      this.onChanged,
      this.changeSizeWidth = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (changeSizeWidth) ? size.width * 0.6 : size.width * 0.35,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: ktriblue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [shadow1black, shadow1blue],
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          Expanded(
            child: TextField(
              keyboardType: keyboardType,
              controller: controller,
              obscureText: false,
              onChanged: onChanged,
              style: ktextTituloStyle.copyWith(fontSize: 12),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: labeltext,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForwardIconButton extends StatelessWidget {
  final Size size;
  final Function onPressed;

  const ForwardIconButton({Key key, this.size, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.1),
      child: IconButton(
        icon: Icon(
          Icons.arrow_forward,
          size: size.height * 0.05,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class ChooseSmallerButton extends StatelessWidget {
  final Size size;
  final String texto;
  final Function onTap;
  final bool padding;
  final double changesize;
  const ChooseSmallerButton(
      {Key key,
      this.texto,
      this.onTap,
      this.size,
      this.padding = true,
      this.changesize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: (padding) ? size.width * 0.1 : 0),
      child: Container(
        width: size.width * 0.2,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: ktriblue,
          boxShadow: [shadow1black, shadow1blue],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            onPressed: onTap,
            child: Text(
              texto,
              style: ktextTituloStyle.copyWith(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}

class ChooseDiametro extends StatelessWidget {
  final Size size;
  final String texto;
  final Function onTap;
  final bool padding;
  final double changesize;
  final double changeTextsize;
  final double changesizeWidth;
  final double changePadding;
  const ChooseDiametro({
    Key key,
    this.texto,
    this.onTap,
    this.size,
    this.padding = true,
    this.changesize = 0.1,
    this.changeTextsize = 34,
    this.changesizeWidth,
    this.changePadding = 0.1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (padding) ? size.width * changePadding : 0),
      child: Container(
        width: (changesizeWidth == null)
            ? double.infinity
            : size.width * changesizeWidth,
        height: size.height * changesize,
        decoration: BoxDecoration(
          color: ktriblue,
          boxShadow: [shadow1black, shadow1white],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            onPressed: onTap,
            child: Text(
              texto,
              style: ktextTituloStyle.copyWith(fontSize: changeTextsize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  final Size size;
  final Function onTap;

  const AddTaskScreen({Key key, this.size, this.onTap}) : super(key: key);
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String pinicial;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.35,
      width: double.infinity,
      padding: EdgeInsets.all(widget.size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Digite a pressão inicial',
              textAlign: TextAlign.center,
              style: ktextTituloStyle.copyWith(color: ktrigrey2, fontSize: 24)),
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: false,
            onChanged: (change) {
              pinicial = change;
            },
            style: ktextTituloStyle.copyWith(fontSize: 12, color: ktrigrey2),
          ),
          ChooseButtonPressao(
            size: widget.size,
            onTap: () {
              widget.onTap(pinicial);
            },
          ),
        ],
      ),
    );
  }
}

class AddNomeScreen extends StatefulWidget {
  final Size size;
  final Function onTap;

  const AddNomeScreen({Key key, this.size, this.onTap}) : super(key: key);
  @override
  _AddNomeScreenState createState() => _AddNomeScreenState();
}

class _AddNomeScreenState extends State<AddNomeScreen> {
  String nomefinal;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.35,
      width: double.infinity,
      padding: EdgeInsets.all(widget.size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Digite o nome do projeto',
              textAlign: TextAlign.center,
              style: ktextTituloStyle.copyWith(color: ktrigrey2, fontSize: 24)),
          TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            obscureText: false,
            onChanged: (change) {
              nomefinal = change;
            },
            style: ktextTituloStyle.copyWith(fontSize: 12, color: ktrigrey2),
          ),
          ChooseButtonPressao(
            size: widget.size,
            onTap: () {
              widget.onTap(nomefinal);
            },
          ),
        ],
      ),
    );
  }
}

class ChooseButtonPressao extends StatelessWidget {
  final Size size;
  final String texto;
  final Function onTap;
  final bool padding;
  final double changesize;
  final double changeTextsize;
  final double changesizeWidth;
  final double changePadding;
  const ChooseButtonPressao({
    Key key,
    this.texto = 'Confirmar',
    this.onTap,
    this.size,
    this.padding = true,
    this.changesize = 0.1 / 2,
    this.changeTextsize = 15,
    this.changesizeWidth,
    this.changePadding = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (padding) ? size.width * changePadding : 0),
      child: Container(
        width: (changesizeWidth == null)
            ? double.infinity
            : size.width * changesizeWidth,
        height: size.height * changesize,
        decoration: BoxDecoration(
          color: ktriblue,
          boxShadow: [shadow1black, shadow1white],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            onPressed: onTap,
            child: Text(
              texto,
              style: ktextTituloStyle.copyWith(fontSize: changeTextsize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class HistoricoButton extends StatelessWidget {
  final Size size;
  final String nome;
  final DateTime dateTime;
  final Function onTap;
  final bool padding;
  final double changesize;
  final double changeTextsize;
  final double changesizeWidth;
  final double changePadding;
  const HistoricoButton({
    Key key,
    this.nome,
    this.onTap,
    this.size,
    this.padding = true,
    this.changesize = 0.1,
    this.changeTextsize = 16,
    this.changesizeWidth,
    this.changePadding = 0.1,
    this.dateTime,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (padding) ? size.width * changePadding : 0),
      child: Container(
        width: (changesizeWidth == null)
            ? double.infinity
            : size.width * changesizeWidth,
        height: size.height * changesize,
        decoration: BoxDecoration(
          color: ktriblue,
          boxShadow: [shadow1black, shadow1blue],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    nome,
                    style: ktextTituloStyle.copyWith(fontSize: changeTextsize),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Text(
                    '${dateTime.day} - ${dateTime.month} - ${dateTime.year}',
                    style: ktextTituloStyle.copyWith(fontSize: changeTextsize),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
