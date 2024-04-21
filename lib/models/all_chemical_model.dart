class AllChemicalModel {
  String? id;
  List<String>? commonNames;
  String? scientificName;
  String? file;

  AllChemicalModel({this.id, this.commonNames, this.scientificName, this.file});

  AllChemicalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonNames = json['commonNames'].cast<String>();
    scientificName = json['scientificName'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['commonNames'] = commonNames;
    data['scientificName'] = scientificName;
    data['file'] = file;
    return data;
  }
}
