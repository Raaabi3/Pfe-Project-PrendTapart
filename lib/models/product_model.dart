class Product {
  final int id;
  final String name;
  final String desc;
  final bool hasImage;
  final String sourceLink;
  final String aLair;
  final String img;
  final String imgCover;
  final bool auFrigo;
  final String astucePreparation;
  final String good;
  final String bad;
  final String advice;
  final String nutritionGrades;
  final int nutriscoreScore;
  final String ingredients;
  final String codeCiqual;
  final String codeBar;
  final String originsLc;
  final bool isVerified;
  final String ingredientImg;
  final String marque;
  final String origin;
  final String adresse;
  final int qte;
  final bool hasCover;
  final int professionalId;

  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.hasImage,
    required this.sourceLink,
    required this.aLair,
    required this.img,
    required this.imgCover,
    required this.auFrigo,
    required this.astucePreparation,
    required this.good,
    required this.bad,
    required this.advice,
    required this.nutritionGrades,
    required this.nutriscoreScore,
    required this.ingredients,
    required this.codeCiqual,
    required this.codeBar,
    required this.originsLc,
    required this.isVerified,
    required this.ingredientImg,
    required this.marque,
    required this.origin,
    required this.adresse,
    required this.qte,
    required this.hasCover,
    required this.professionalId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      desc: json['desc'] ?? '',
      hasImage: json['hasImage'] ?? false,
      sourceLink: json['source_link'] ?? '',
      aLair: json['a_lair'] ?? '',
      img: json['img'] ?? '',
      imgCover: json['img_cover'] ?? '',
      auFrigo: json['au_frigo'] ?? false,
      astucePreparation: json['astuce_preparation'] ?? '',
      good: json['good'] ?? '',
      bad: json['bad'] ?? '',
      advice: json['advice'] ?? '',
      nutritionGrades: json['nutrition_grades'] ?? '',
      nutriscoreScore: json['nutriscore_score'] ?? 0,
      ingredients: json['ingredients'] ?? '',
      codeCiqual: json['code_ciqual'] ?? '',
      codeBar: json['code_bar'] ?? '',
      originsLc: json['origins_lc'] ?? '',
      isVerified: json['is_verified'] ?? false,
      ingredientImg: json['ingredient_img'] ?? '',
      marque: json['marque'] ?? '',
      origin: json['origin'] ?? '',
      adresse: json['adresse'] ?? '',
      qte: json['qte'] ?? 0,
      hasCover: json['hasCover'] ?? false,
      professionalId: json['professional_id'] ?? 0,
    );
  }
}
