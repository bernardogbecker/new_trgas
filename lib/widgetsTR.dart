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
