import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/models/zapato_model.dart';
import 'package:shoes/src/pages/shoes_desc_page.dart';

class ShoeSpecs extends StatelessWidget {
  final bool fullScreen;

  ShoeSpecs({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZapatosDescPage(),
              ));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: (fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (!fullScreen) ? 410 : 430,
          //color: Colors.amber,
          decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: (!fullScreen)
                  ? BorderRadius.circular(50)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
          child: Column(
            children: [
              //zapato
              ZapatoSombra(),
              //tallas
              if (!fullScreen) _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          )
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [BoxShadow(color: Color(0xffeaa14e), blurRadius: 40)]),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5)
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double talla;

  const _TallaZapatoCaja(this.talla);
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = talla;
      },
      child: Container(
          alignment: Alignment.center,
          child: Text(
            '${talla.toString().replaceAll('.0', '')}',
            style: TextStyle(
                color: (talla == zapatoModel.talla)
                    ? Colors.white
                    : Color(0xfff1a23a),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: (talla == zapatoModel.talla)
                  ? Color(0xfff1a23a)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                if (talla == zapatoModel.talla)
                  BoxShadow(
                      color: Color(0xfff1a23a),
                      blurRadius: 10,
                      offset: Offset(0, 5))
              ])),
    );
  }
}
