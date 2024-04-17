
class Establishment {
  final int id;
  final String name;
  final String address;
  final String city;
  final String zipCode;
  final double longitude;
  final double latitude;
  final int companyId;
  final String email;
  final String phoneNumber;
  final String particularity;
  final String description;
  final String equipe;
  final String valeur;
  final String img;
  final String covImg;
  final String slogan;
  final int showHome; 
  final String syntheseEvalSanit;
  final String numeroInspection;
  final bool isChecked;
  final int siteId;
  final int bookingDuration;
  final String imageArticle;
  final String contentArticle;

  Establishment({
    required this.id,
    required this.name,
    this.address = '',
    this.city = '',
    this.zipCode = '',
    this.longitude = 0.0,
    this.latitude = 0.0,
    this.companyId = 0,
    this.email = '',
    this.phoneNumber = '',
    this.particularity = '',
    this.description = '',
    this.equipe = '',
    this.valeur = '',
    this.img = '',
    this.covImg = '',
    this.slogan = '',
    required this.showHome, 
    this.syntheseEvalSanit = '',
    this.numeroInspection = '',
    this.isChecked = false,
    this.siteId = 0,
    this.bookingDuration = 0,
    this.imageArticle = '',
    this.contentArticle = '',
  });

  factory Establishment.fromJson(Map<String, dynamic> json) {
    return Establishment(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      zipCode: json['zip_code'] ?? '',
      longitude: json['longitude'] != null ? double.parse(json['longitude'].toString()) : 0.0,
      latitude: json['latitude'] != null ? double.parse(json['latitude'].toString()) : 0.0,
      companyId: json['company_id'] ?? 0,
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      particularity: json['particularity'] ?? '',
      description: json['description'] ?? '',
      equipe: json['equipe'] ?? '',
      valeur: json['valeur'] ?? '',
      img: json['img'] ?? '',
      covImg: json['cov_img'] ?? '',
      slogan: json['Slogan'] ?? '',
      showHome: json['show_home'] ?? 0,
      syntheseEvalSanit: json['synthese_eval_sanit'] ?? '',
      numeroInspection: json['numero_inspection'] ?? '',
      isChecked: json['is_checked'] == 1,
      siteId: json['site_id'] ?? 0,
      bookingDuration: json['booking_duration'] ?? 0,
      imageArticle: json['image_article'] ?? '',
      contentArticle: json['content_article'] ?? '',
    );
    
  }
}
