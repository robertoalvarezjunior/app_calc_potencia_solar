import 'package:app_calc_potencia/components/view_proposta.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final mediakwhInput = TextEditingController();
  final mediaLuzInput = TextEditingController();
  final nomeClienteInput = TextEditingController();
  final faseTaxaInput = TextEditingController();
  final potenciaPlacaInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: nomeClienteInput,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    labelText: 'Nome cliente: ',
                  ),
                ),
                TextFormField(
                  controller: mediakwhInput,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Média consumo (kWh): ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: faseTaxaInput,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Fase + Taxa: ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: potenciaPlacaInput,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Potência placa: ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: mediaLuzInput,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Média conta de luz (R\$): ',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final nomeCliente = nomeClienteInput.text;
                      final mediakwh = double.parse(
                          (mediakwhInput.text).replaceAll(',', '.'));
                      final mediaLuz = double.parse(
                          (mediaLuzInput.text).replaceAll(',', '.'));
                      final faseTaxa = double.parse(
                          (faseTaxaInput.text).replaceAll(',', '.'));
                      final potPlaca = double.parse(
                          (potenciaPlacaInput.text).replaceAll(',', '.'));

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ViewProposta(
                            faseTaxa: faseTaxa,
                            nomeCliente: nomeCliente,
                            mediaLuz: mediaLuz,
                            mediakwh: mediakwh,
                            potPlaca: potPlaca,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.black87),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
