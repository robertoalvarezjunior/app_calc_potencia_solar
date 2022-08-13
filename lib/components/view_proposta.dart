import 'package:app_calc_potencia/components/proposta.dart';
import 'package:app_calc_potencia/modals/calculos.dart';
import 'package:flutter/material.dart';

class ViewProposta extends StatefulWidget {
  const ViewProposta({
    Key? key,
    required this.mediakwh,
    required this.potPlaca,
    required this.faseTaxa,
    required this.mediaLuz,
    required this.nomeCliente,
  }) : super(key: key);

  final double mediakwh;
  final double potPlaca;
  final double mediaLuz;
  final double faseTaxa;
  final String nomeCliente;

  static const preto = Color.fromARGB(255, 0, 0, 0);
  static const mainColor = Color.fromARGB(255, 255, 255, 255);
  @override
  State<ViewProposta> createState() => _ViewPropostaState();
}

class _ViewPropostaState extends State<ViewProposta> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final valorInput = TextEditingController();
  final equipamento = TextEditingController();
  final marcaEquipamento = TextEditingController();
  final marcaFotoV = TextEditingController();
  final garantiaEquip = TextEditingController();
  final garantiaFV = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visualização',
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ViewProposta.mainColor,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffffffff),
                            Color(0xffffd700),
                            Color(0xffffa500),
                          ],
                        ),
                      ),
                      margin: const EdgeInsets.only(top: 15, bottom: 20),
                      padding:
                          const EdgeInsets.only(left: 20, top: 30, bottom: 5),
                      width: double.infinity,
                      child: const Text(
                        'Escopo do Projeto',
                        style: TextStyle(
                          fontSize: 32,
                          color: ViewProposta.preto,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Table(
                          children: [
                            tableRow([
                              escopoProjeto('Módulos fotovoltaicos'),
                              escopoProjeto(
                                  '${NumModulos.numModulos(widget.mediakwh, widget.potPlaca)}'),
                            ]),
                            tableRow([
                              escopoProjeto('Potência do projeto'),
                              escopoProjeto(
                                  '${calcMediaSolar(widget.mediakwh, widget.potPlaca)} kWp'),
                            ]),
                            tableRow([
                              escopoProjeto('Base de consumo'),
                              escopoProjeto('${widget.mediakwh} kWh/mês'),
                            ]),
                            tableRow([
                              escopoProjeto('Geração estimada'),
                              escopoProjeto('${widget.mediakwh} kWh/mês'),
                            ]),
                          ],
                        ),
                        textMenor(
                            'Notas: -Valor calculado com base na média histórica de radiação solar da região, e sujeito a variação em função das condições climáticas.'),
                        textMenor(
                            '- A geração não é linear, sofrendo variação nos diferentes meses do ano.'),
                        textMenor(
                            '- As estimativas de geração de energia, custos e economia foi baseada e projetada com base nas informações de consumo apresentadas pelo cliente e no estudo de irradiação solar local, tal como na análise da inflação.'),
                        textMenor(
                            '- Não foi considerada a economia com a redução da CIP (Contribuição de Iluminação Pública) com a diminuição do consumo de energia da concessionária.'),
                        const SizedBox(
                          height: 20,
                        ),
                        Table(
                          border: const TableBorder(
                            top: BorderSide(
                                color: ViewProposta.preto, width: 2.5),
                            bottom: BorderSide(
                                color: ViewProposta.preto, width: 2.5),
                            verticalInside:
                                BorderSide(color: ViewProposta.preto),
                          ),
                          children: [
                            TableRow(
                              children: [
                                textTable(
                                    'Sua conta de luz anual sem a Eletro Solar',
                                    'R\$ ${calcAnual(widget.mediaLuz)}'),
                                textTable(
                                    'Sua conta de luz anual com a Eletro Solar*',
                                    'R\$ ${calcLuzAnualCom(widget.faseTaxa)}'),
                                textTable(
                                    'Sua econimia anual sem a Eletro Solar',
                                    'R\$ ${calcEco(widget.mediaLuz, widget.faseTaxa)}')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Investimento proposto',
                          style: TextStyle(
                            color: ViewProposta.preto,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                txtFormField(
                                  equipamento,
                                  TextInputType.text,
                                  'Inversor:',
                                ),
                                const SizedBox(height: 10),
                                txtFormField(marcaEquipamento,
                                    TextInputType.text, 'Marca inversor:'),
                                const SizedBox(height: 10),
                                txtFormField(
                                    garantiaEquip,
                                    TextInputType.number,
                                    'Garantia Inversor: (Apenas números)'),
                                const SizedBox(height: 10),
                                txtFormField(marcaFotoV, TextInputType.text,
                                    'Marca Placa:'),
                                const SizedBox(height: 10),
                                txtFormField(garantiaFV, TextInputType.number,
                                    'Garantia placa: (Apenas números)'),
                                const SizedBox(height: 10),
                                txtFormField(valorInput, TextInputType.number,
                                    'Valor do sistema: '),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final nomeCliente = widget.nomeCliente;
                                      final mediakwh = widget.mediakwh;
                                      final mediaLuz = widget.mediaLuz;
                                      final faseTaxa = widget.faseTaxa;
                                      final potPlaca = widget.potPlaca;
                                      final equip = equipamento.text;
                                      final marcaEquip = marcaEquipamento.text;
                                      final garantEquip = double.parse(
                                          (garantiaEquip.text)
                                              .replaceAll(',', '.'));
                                      final marcaFV = marcaFotoV.text;
                                      final garantFV = double.parse(
                                          (garantiaFV.text)
                                              .replaceAll(',', '.'));
                                      final valor = double.parse(
                                          (valorInput.text)
                                              .replaceAll(',', '.'));

                                      creatPdf(
                                        context: context,
                                        faseTaxa: faseTaxa,
                                        mediaLuz: mediaLuz,
                                        mediakwh: mediakwh,
                                        nomeCliente: nomeCliente,
                                        potPlaca: potPlaca,
                                        valor: valor,
                                        equip: equip,
                                        garantEquip: garantEquip,
                                        garantFV: garantFV,
                                        marcaEquip: marcaEquip,
                                        marcaFV: marcaFV,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Calcular',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField txtFormField(controller, TextInputType value, txt) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: value,
      decoration: InputDecoration(
        labelText: txt,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }
}

TableRow tableRow([escopo]) {
  return TableRow(
    children: escopo,
  );
}

SizedBox escopoProjeto(text) {
  return SizedBox(
    height: 40,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ViewProposta.preto,
      ),
      textAlign: TextAlign.start,
    ),
  );
}

Text textMenor(textM) {
  return Text(
    textM,
    style: const TextStyle(
      fontSize: 12,
      color: ViewProposta.preto,
    ),
    textAlign: TextAlign.justify,
  );
}

SizedBox textTable(text, valor) {
  const double textStyle = 18;
  return SizedBox(
    height: 224,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style:
              const TextStyle(color: ViewProposta.preto, fontSize: textStyle),
          textAlign: TextAlign.center,
        ),
        Text(
          valor,
          style:
              const TextStyle(color: ViewProposta.preto, fontSize: textStyle),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
