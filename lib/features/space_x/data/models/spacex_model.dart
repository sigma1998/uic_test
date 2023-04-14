
class SpaceXModel {
  Company? company;

  SpaceXModel({this.company});

  SpaceXModel.fromJson(Map<String, dynamic> json) {
    company =
    json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class Company {
  String? ceo;
  String? cto;
  String? name;
  String? summary;
  int? valuation;

  Company({this.ceo, this.cto, this.name, this.summary, this.valuation});

  Company.fromJson(Map<String, dynamic> json) {
    ceo = json['ceo'];
    cto = json['cto'];
    name = json['name'];
    summary = json['summary'];
    valuation = json['valuation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ceo'] = ceo;
    data['cto'] = cto;
    data['name'] = name;
    data['summary'] = summary;
    data['valuation'] = valuation;
    return data;
  }
}