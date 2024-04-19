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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['commonNames'] = this.commonNames;
    data['scientificName'] = this.scientificName;
    data['file'] = this.file;
    return data;
  }
}
