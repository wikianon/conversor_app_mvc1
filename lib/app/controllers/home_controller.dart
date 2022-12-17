
import 'package:conversor_app_mvc1/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  late List <CurrencyModel> currencies;

  late final TextEditingController toText;
  late final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}){
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double valor = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency.name.isEmpty){
      return;
    }
    if (fromCurrency.name == 'Real') {
      returnValue = (valor * toCurrency.real);
    }
    if (fromCurrency.name == 'Dolar') {
      returnValue = (valor * toCurrency.dolar);
    }
    if (fromCurrency.name == 'Euro') {
      returnValue = (valor * toCurrency.euro);
    }
    if (fromCurrency.name == 'Bitcoin') {
      returnValue = (valor * toCurrency.bitcoin);
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
