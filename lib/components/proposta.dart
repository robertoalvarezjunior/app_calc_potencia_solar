import 'package:app_calc_potencia/modals/calculos.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

final pdf = pw.Document();

class Proposta extends StatefulWidget {
  const Proposta({
    Key? key,
  }) : super(key: key);

  @override
  State<Proposta> createState() => _PropostaState();
}

class _PropostaState extends State<Proposta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Proposta PDF')),
        actions: [
          IconButton(
            onPressed: () => share(),
            icon: const Icon(
              Icons.share,
            ),
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => pdf.save(),
      ),
    );
  }
}

PdfColor branco = const PdfColor.fromInt(0xffffffff);
PdfColor cinza = const PdfColor.fromInt(0xffb6b6b6);
PdfColor cinzaEscuro = const PdfColor.fromInt(0xff696969);
PdfColor mainColor = const PdfColor.fromInt(0xffFFD700);
PdfColor mainTitleColor = const PdfColor.fromInt(0xffFFCC00);
const double txtTitleSize = 32;
const double txtSize = 16;
creatPdf({
  context,
  String? nomeCliente,
  mediakwh,
  mediaLuz,
  faseTaxa,
  potPlaca,
  valor,
  equip,
  marcaEquip,
  garantEquip,
  marcaFV,
  garantFV,
}) async {
  final imageLogo = await imageFromAssetBundle('assets/logo4.png');
  final imageValorize = await imageFromAssetBundle('assets/valorize.png');
  final imageBomNegocio = await imageFromAssetBundle('assets/bomNegocio.png');
  final imageAmbiente = await imageFromAssetBundle('assets/ambiente.png');
  final imageManutencao = await imageFromAssetBundle('assets/manutencao.png');
  final imageCasa = await imageFromAssetBundle('assets/comoFunciona.png');
  final imageAten = await imageFromAssetBundle('assets/icone_atencao.png');
  final imageFolha = await imageFromAssetBundle('assets/flor.png');
  final imageNuvem = await imageFromAssetBundle('assets/nuvem.png');
  final imageCarro = await imageFromAssetBundle('assets/carro.png');
  final imageGraf = await imageFromAssetBundle('assets/graf.png');

  const double sizeImage = 100;

  // proposta comercial
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          width: double.infinity,
          decoration: const pw.BoxDecoration(
            gradient: pw.LinearGradient(
              begin: pw.Alignment.topLeft,
              end: pw.Alignment.bottomRight,
              colors: [
                PdfColor.fromInt(0xffffffff),
                PdfColor.fromInt(0xffffd700),
                PdfColor.fromInt(0xffffa500),
              ],
            ),
          ),
          child: pw.Padding(
            padding: const pw.EdgeInsets.only(left: 30),
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: -30),
                  child: pw.Center(
                    child: pw.Column(
                      children: [
                        pw.Image(imageLogo, height: 85),
                        pw.Text(
                          'E l e t r o',
                          style: pw.TextStyle(
                            fontSize: 58,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          'S o l a r',
                          style: pw.TextStyle(
                            fontSize: 58,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Text(
                  'Proposta comercial',
                  style: pw.TextStyle(
                    fontSize: 38,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                txtInicio('Cliente: ${nomeCliente!.toUpperCase()}'),
                txtInicio('Data da proposta: ${dataNow()}'),
                txtInicio('Responsável: Paulo'),
                txtInicio('RN: 00170788148'),
                txtInicio('Responsável: Francisco'),
                txtInicio('RN: 76029352334'),
                txtInicio('Contato: 61 99166-3772 / 99596-9737'),
              ],
            ),
          ),
        );
      },
    ),
  );

  // Nosso compromisso
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              color: branco,
              width: double.infinity,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(
                    'Nosso Compromisso',
                    style: pw.TextStyle(
                      color: mainTitleColor,
                      fontSize: txtTitleSize,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Image(imageValorize, height: sizeImage),
                      pw.Image(imageBomNegocio, height: sizeImage),
                    ],
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Image(imageAmbiente, height: sizeImage),
                      pw.Image(imageManutencao, height: sizeImage),
                    ],
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Container(
              width: double.infinity,
              height: 35,
              color: mainColor,
              child: pw.Center(
                child: pw.Text(
                  'COMO FUNCIONA',
                  style: pw.TextStyle(
                    fontSize: 28,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.Image(imageCasa, height: 180),
            pw.Container(
              padding: const pw.EdgeInsets.only(top: 10, bottom: 10),
              color: mainColor,
              width: double.infinity,
              child: pw.Padding(
                padding: const pw.EdgeInsets.only(left: 10, right: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    txtComoFunciona('1) O sol é a fonte primária de energia.'),
                    txtComoFunciona(
                        '2) A luz do sol incide sobre os painéis fotovoltaicos.'),
                    txtComoFunciona(
                        '3) O painel fotovoltaico converte luz em energia elétrica.'),
                    txtComoFunciona(
                        '4) A corrente contínua é injetada na entrada do inversor, passando por dispositivos de segurança.'),
                    txtComoFunciona(
                        '5) O inversor converte corrente contínua em alternada.'),
                    txtComoFunciona(
                        '6) A energia gerada é consumida ou injetada na rede, após passar por dispositivos de segurança.'),
                    txtComoFunciona(
                        'A energia excedente gera créditos de energia que podem ser utilizados em até 60 meses.'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  // escopo projeto
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          width: double.infinity,
          color: mainColor,
          child: pw.Column(
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(top: 10, bottom: 40),
                padding: const pw.EdgeInsets.only(top: 30, bottom: 5),
                color: const PdfColor.fromInt(0xffffffff),
                width: double.infinity,
                child: pw.Text(
                  'Escopo do projeto',
                  style: pw.TextStyle(
                      fontSize: txtTitleSize,
                      color: mainTitleColor,
                      fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.only(left: 10, right: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Table(
                      children: [
                        tableRow([
                          escopoProjeto('Módulos fotovoltaicos', 18),
                          escopoProjeto(
                              '${NumModulos.numModulos(mediakwh, potPlaca)}',
                              18)
                        ]),
                        tableRow([
                          escopoProjeto('Potência do projeto', 18),
                          escopoProjeto(
                              '${calcMediaSolar(mediakwh, potPlaca)} kWp', 18),
                        ]),
                        tableRow([
                          escopoProjeto('Base de consumo', 18),
                          escopoProjeto('$mediakwh kWh/mês', 18),
                        ]),
                        tableRow([
                          escopoProjeto('Geração estimada', 18),
                          escopoProjeto('$mediakwh kWh/mês', 18),
                        ]),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    textMenor(
                        'Notas: -Valor calculado com base na média histórica de radiação solar da região, e sujeito a variação em função das condições climáticas.',
                        16),
                    pw.SizedBox(height: 10),
                    textMenor(
                        '- A geração não é linear, sofrendo variação nos diferentes meses do ano.',
                        16),
                    pw.SizedBox(height: 10),
                    textMenor(
                        '- As estimativas de geração de energia, custos e economia foi baseada e projetada com base nas informações de consumo apresentadas pelo cliente e no estudo de irradiação solar local, tal como na análise da inflação.',
                        16),
                    pw.SizedBox(height: 10),
                    textMenor(
                        '- Não foi considerada a economia com a redução da CIP (Contribuição de Iluminação Pública) com a diminuição do consumo de energia da concessionária.',
                        16),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  // financeiro
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          width: double.infinity,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
            children: [
              pw.Text(
                'Análise financeira',
                style: pw.TextStyle(
                  fontSize: txtTitleSize,
                  fontWeight: pw.FontWeight.bold,
                  color: mainTitleColor,
                ),
              ),
              pw.Container(
                color: mainColor,
                padding: const pw.EdgeInsets.only(left: 10, right: 10, top: 20),
                width: double.infinity,
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Table(
                      border: pw.TableBorder(
                          top: pw.BorderSide(color: branco, width: 2.5),
                          bottom: pw.BorderSide(color: branco, width: 2.5),
                          verticalInside: pw.BorderSide(color: branco)),
                      children: [
                        pw.TableRow(
                          children: [
                            textTable(
                                'Sua conta de luz anual sem a Eletro Solar',
                                'R\$ ${calcAnual(mediaLuz)}'),
                            textTable(
                                'Sua conta de luz anual com a Eletro Solar*',
                                'R\$ ${calcLuzAnualCom(faseTaxa)}'),
                            textTable('Sua economia anual com a Eletro Solar',
                                'R\$ ${calcEco(mediaLuz, faseTaxa)}'),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 10),
                    textMenor(
                        '* Valores podem sofrer variação devido a ajustes tarifários e de impostos.',
                        14),
                    textMenor(
                        '** Esses valores são referências, e podem sofrer alterações de acordo com a faixa de consumo elétrico.',
                        14),
                    textMenor(
                        'Notas: O ano simulado é o primeiro ano após o payback.',
                        14),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      'Investimento proposto',
                      style: pw.TextStyle(
                        fontSize: 22,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Table(
                      children: [
                        tableRow([
                          escopoProjeto('Valor do sistema*', 16),
                          escopoProjeto('R\$ ${formatado(valor)}', 16),
                        ]),
                        tableRow([
                          escopoProjeto('Tempo de Payback**', 16),
                          escopoProjeto('3 anos e 5 meses', 16),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
              pw.Text(
                'Fluxo financeiro',
                style: pw.TextStyle(
                  fontSize: txtTitleSize,
                  fontWeight: pw.FontWeight.bold,
                  color: mainTitleColor,
                ),
              ),
              pw.Image(imageGraf),
            ],
          ),
        );
      },
    ),
  );

  // homologação
  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (pw.Context context) {
      return pw.Container(
        color: branco,
        width: double.infinity,
        child: pw.Container(
          padding: const pw.EdgeInsets.only(top: 10),
          width: 1200,
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
            children: [
              pw.Text(
                'Instalação e homologação',
                style: pw.TextStyle(
                  fontSize: txtTitleSize,
                  fontWeight: pw.FontWeight.bold,
                  color: mainTitleColor,
                ),
                textAlign: pw.TextAlign.center,
              ),
              subText(
                  'Fique tranquilo, nós cuidamos de todo o processo de instalação e homologação do sistema junto à concessionária. O prazo para concessionária aprovar um projeto é de 30 a 60 dias.'),
              subText(
                  'A instalação é um processo simples, seguro e não envolve obras.'),
              subText('Nosso tempo médio é de 3 a 7 dias.'),
              pw.Text(
                'Garantias',
                style: pw.TextStyle(
                  fontSize: txtTitleSize,
                  fontWeight: pw.FontWeight.bold,
                  color: mainTitleColor,
                ),
                textAlign: pw.TextAlign.center,
              ),
              pw.Table(
                border: pw.TableBorder.all(color: cinza),
                children: [
                  tableRowHomo([
                    tableText('Equipamento'),
                    tableText('Marca/Modelo'),
                    tableText('Garantia'),
                  ]),
                  tableRowHomo([
                    tableText('$equip'),
                    tableText('$marcaEquip'),
                    tableText('${formatoAno(garantEquip)} anos'),
                  ]),
                  tableRowHomo([
                    tableText('Módulos FV'),
                    tableText('$marcaFV'),
                    tableText('${formatoAno(garantFV)} anos*'),
                  ]),
                  tableRowHomo([
                    tableText('Estrutura'),
                    tableText('Solar Group'),
                    tableText('12 anos'),
                  ]),
                  tableRowHomo([
                    tableText('Instalação'),
                    tableText('Eletro Solar'),
                    tableText('1 Ano'),
                  ]),
                ],
              ),
              pw.Text(
                '(*) 25 anos de garantia de performance de geração e 12 anos para defeitos de fabricação.',
                style: const pw.TextStyle(fontSize: 14),
              ),
              pw.Text(
                'Manutenção',
                style: pw.TextStyle(
                    fontSize: txtTitleSize,
                    color: mainTitleColor,
                    fontWeight: pw.FontWeight.bold),
                textAlign: pw.TextAlign.center,
              ),
              subText(
                  'A manutenção básica dos sistemas fotovoltaicos é a simples limpeza das placas, sendo na maioria dos casos realizada de forma natural pela chuva.'),
              subText(
                  'Após 15 anos é recomendada a troca do inversor (não aplicável para Microinversores).'),
              subText(
                  'Necessidades específicas poderão ser solucionadas pela Infinity Solar.'),
              pw.Row(
                children: [
                  pw.Image(imageAten, height: 25),
                  pw.SizedBox(width: 5),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      subText(
                          'Este é um pré-orçamento e tem validade de 05 dias.'),
                      subText(
                          'O orçamento definitivo será encaminhado após a visita técnica.'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  ));

  // bom planeta
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Container(
          color: branco,
          width: double.infinity,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                color: mainColor,
                height: 200,
                width: double.infinity,
                child: pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text(
                        'Bom para o planeta',
                        style: pw.TextStyle(
                          fontSize: txtTitleSize,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.Text(
                        'Bom para o seu bolso',
                        style: pw.TextStyle(
                          fontSize: txtTitleSize,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  subTextBP(
                      'Seu sistema está projetado para gerar energia por pelo menos 25 anos. Durante esse período, você estará ajudando a emitir menos CO2. Sabe o que isso significa?',
                      txtSize),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Column(
                        children: [
                          pw.Image(imageFolha),
                          pw.SizedBox(
                            height: 15,
                          ),
                          pw.Image(imageNuvem),
                          pw.SizedBox(
                            height: 20,
                          ),
                          pw.Image(imageCarro),
                        ],
                      ),
                      pw.SizedBox(
                        width: 20,
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(
                            height: 20,
                          ),
                          subTextBP('562', txtSize),
                          subTextBP('Árvores salvas', txtSize),
                          pw.SizedBox(
                            height: 35,
                          ),
                          subTextBP('78,7 toneladas de CO2', txtSize),
                          subTextBP('não emitidas', txtSize),
                          pw.SizedBox(
                            height: 25,
                          ),
                          subTextBP('895.905 Km', txtSize),
                          subTextBP('de um carro fora de circulação', txtSize),
                          pw.SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                  pw.Text(
                    'Participe desta revolução',
                    style: pw.TextStyle(
                        fontSize: txtTitleSize,
                        fontWeight: pw.FontWeight.bold,
                        color: mainTitleColor),
                  ),
                  pw.SizedBox(height: 15),
                  subTextBP('Mais energia, menos consumo.', txtSize),
                  subTextBP(
                      'Faça sua casa ou empresa, mais inteligente e sustentável,',
                      txtSize),
                  subTextBP('na forma como consome e produz energia.', txtSize),
                  pw.Row(
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(
                            height: 20,
                          ),
                          subTextBP('Paulo Roberto| 61 99166-3772', txtSize),
                          subTextBP('Francisco| 61 99596-9737', txtSize),
                          subTextBP('eletro.solarbsb@gmail.com', txtSize),
                          subTextBP('CNPJ: 44511008000198', txtSize),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    ),
  );

  // salva o pdf

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => const Proposta(),
    ),
  );
}

pw.Text txtInicio(value) {
  return pw.Text(
    value,
    style: pw.TextStyle(
      fontSize: 20,
      fontWeight: pw.FontWeight.bold,
    ),
  );
}

pw.TableRow tableRow([escopo]) {
  return pw.TableRow(
    children: escopo,
  );
}

pw.SizedBox escopoProjeto(text, double size) {
  return pw.SizedBox(
    height: 40,
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: size,
        fontWeight: pw.FontWeight.bold,
      ),
    ),
  );
}

pw.Text txtComoFunciona(txt) {
  return pw.Text(txt,
      style: const pw.TextStyle(
        fontSize: txtSize,
      ),
      textAlign: pw.TextAlign.justify);
}

pw.Text textMenor(textM, double size) {
  return pw.Text(
    textM,
    style: pw.TextStyle(
      fontSize: size,
    ),
    textAlign: pw.TextAlign.justify,
  );
}

pw.SizedBox textTable(text, valor) {
  const double textStyle = 18;
  return pw.SizedBox(
    height: 100,
    child: pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
      children: [
        pw.Text(
          text,
          style: const pw.TextStyle(fontSize: textStyle),
          textAlign: pw.TextAlign.center,
        ),
        pw.Text(
          valor,
          style: const pw.TextStyle(fontSize: textStyle),
          textAlign: pw.TextAlign.center,
        ),
      ],
    ),
  );
}

pw.Text subText(subText) {
  return pw.Text(subText,
      style: const pw.TextStyle(fontSize: txtSize),
      textAlign: pw.TextAlign.justify);
}

pw.TableRow tableRowHomo([tableText]) {
  return pw.TableRow(
    children: tableText,
  );
}

pw.Text tableText(text) {
  return pw.Text(
    text,
    style: const pw.TextStyle(
      fontSize: txtSize,
    ),
    textAlign: pw.TextAlign.center,
  );
}

pw.Text subTextBP(subTextBP, fontsize) {
  return pw.Text(
    subTextBP,
    style: pw.TextStyle(
      fontSize: fontsize,
    ),
    textAlign: pw.TextAlign.justify,
  );
}

share() async {
  return await Printing.sharePdf(
      bytes: await pdf.save(), filename: 'proposta.pdf');
}
