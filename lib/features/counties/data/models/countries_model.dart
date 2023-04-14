

class CountriesModel {
  Country? country;

  CountriesModel({this.country});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  String? name;
  String? native;
  String? capital;
  String? emoji;
  String? currency;
  List<Languages>? languages;

  Country(
      {this.name,
        this.native,
        this.capital,
        this.emoji,
        this.currency,
        this.languages});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    native = json['native'];
    capital = json['capital'];
    emoji = json['emoji'];
    currency = json['currency'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['native'] = native;
    data['capital'] = capital;
    data['emoji'] = emoji;
    data['currency'] = currency;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Languages {
  String? code;
  String? name;

  Languages({this.code, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}