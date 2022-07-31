import 'package:intl/intl.dart';

calcAnual(valor) {
  double valorAno;

  valorAno = valor * 12;

  NumberFormat formato = NumberFormat('####0.00');

  return formato.format(valorAno);
}

calcMediaSolar(media) {
  double irs = 5.23;
  double calc = media / (irs * 30 * 0.75);

  NumberFormat formato = NumberFormat('0.00');

  return formato.format(calc);
}

numModulos(value, potPlaca) {
  double irs = 5.26;
  double calc = value / (irs * 30 * 0.88);
  double numM = (calc / potPlaca) * 1000;

  return numM.round();
}

calcLuzAnualCom(value) {
  double calc = value * 12;
  NumberFormat formato = NumberFormat('0.00');
  return formato.format(calc);
}

calcEco(value, taxa) {
  double valorAno = value * 12;
  double valorTaxa = taxa * 12;

  double calc = valorAno - valorTaxa;

  NumberFormat formato = NumberFormat('####0.00');

  return formato.format(calc);
}

dataNow() {
  DateTime data = DateTime.now();
  final formato = DateFormat('dd/MM/yyyy');
  final formatado = formato.format(data);

  return formatado;
}

formatado(value) {
  NumberFormat formato = NumberFormat('#####0.00');

  return formato.format(value);
}

formatoAno(value) {
  NumberFormat formato = NumberFormat('##.#');

  return formato.format(value);
}
