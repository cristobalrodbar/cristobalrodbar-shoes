import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/src/models/zapato_model.dart';
//import 'package:shoes/src/pages/shoes_desc_page.dart';
import 'package:shoes/src/pages/shoes_page.dart';

void main() {
  return runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ZapatoModel())],
      child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shoes app', debugShowCheckedModeBanner: false, home: ShoePage()
        //ZapatosDescPage()
        );
  }
}
