class KoleksiBenda {
  String? id;
  final String? namaBenda;
  final int? hargaBenda;
  final int? tahunBeliBenda;
  final String? deskripsiBenda;

  KoleksiBenda({
    this.id,
    this.namaBenda,
    this.hargaBenda,
    this.tahunBeliBenda,
    this.deskripsiBenda,
  });

  factory KoleksiBenda.fromJson(Map<String, dynamic> json) {
    return KoleksiBenda(
      id: json['id'] as String,
      namaBenda: json['namaBenda'] as String,
      hargaBenda: json['hargaBenda'] as int,
      tahunBeliBenda: json['tahunBeliBenda'] as int,
      deskripsiBenda: json['deskripsiBenda'] as String,
    );
  }
}
