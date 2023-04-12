import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/helpers/helpers.dart';

import '../models/zapato_model.dart';
import '../widgets/custom_widgets.dart';

class ZapatosDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(tag: 'ShoeSpecs', child: ShoeSpecs(fullScreen: true)),
            Positioned(
                top: 20,
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    cambiarStatusDark();

                    Navigator.pop(context);
                  },
                  child:
                      Icon(Icons.chevron_left, color: Colors.white, size: 60),
                ))
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ZapatoDescripcion(
                      titulo: 'Nike Air Max 720',
                      descripcion:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                    _MontoBuyNow(),
                    _ColoresYMas(),
                    _BotonesBottom()
                  ],
                )))
      ],
    ));
  }
}

class _BotonesBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.favorite, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.shopping_cart_outlined,
              color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings,
              color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icono;

  const _BotonSombreado(this.icono);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icono,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                left: 90,
                child:
                    _BotonColor(Color(0xffc6d542), 4, 'assets/imgs/verde.png'),
              ),
              Positioned(
                left: 60,
                child: _BotonColor(
                    Color(0xffffad29), 3, 'assets/imgs/amarillo.png'),
              ),
              Positioned(
                left: 30,
                child:
                    _BotonColor(Color(0xff2099f1), 2, 'assets/imgs/azul.png'),
              ),
              _BotonColor(Color(0xff364d56), 1, 'assets/imgs/negro.png'),
            ],
          )),
          //Spacer(),
          BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);

          zapatoModel.assetImage = urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: BotonNaranja(
                texto: 'Buy now',
                ancho: 120,
                alto: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
