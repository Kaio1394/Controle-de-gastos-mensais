class Gastos{
  final String descricao;
  final double valor;

  Gastos(this.descricao, this.valor);

  @override
  String toString() {
    // TODO: implement toString
    return 'Descrição: $descricao, Valor:$valor';
  }
}