import 'package:flutter/material.dart';
import 'package:conversor_app_mvc1/app/controllers/home_controller.dart';
import 'package:conversor_app_mvc1/app/views/components/currency_box.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;
/*
  @override
  void initState(){
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }
*/

  //Como a classe HomeViewState não é privada usando o underline antes do nome
  //Podemos usar a propria classe para inicializar os metodos ao iniciar o app
  //o construtor initState deve ser usado quando a classe é privada.
  //classe publica: class HomeViewState
  //classe privada: class _HomeViewState
  HomeViewState () {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //para nao dar erro na tela ao abrir o teclado
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150
                ), //Image.asset
                
                //Distancia da imagen com a CurrencyBox => Row ou Linha usando o SizedBox.
                const SizedBox(height: 30),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: homeController.toText,
                  items: homeController.currencies,

                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                ), //CurrencyBox
      
                const SizedBox(height: 10),
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: homeController.fromText,
                  items: homeController.currencies,

                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ), //CurrencyBox
                
                const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, // background
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),// foreground
                    ),
                    onPressed: () {
                      setState(() {
                        homeController.convert();
                      });
                    }, //onPressed
      
                    child: const Text(
                      'CONVERTER',
                      style: TextStyle(fontSize: 20),
                    ), //Text
                  ), //ElevatedButton
              ], //children
            ), //Column
          ), //Padding
        ), //SizedBox
      ) //SingleChildScrollView
    ); //Scaffold
  }
}
