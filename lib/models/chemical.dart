class Chemical {
  String? msg;
  List<Chemicals>? chemicals;

  Chemical({this.msg, this.chemicals});

  Chemical.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['Chemicals'] != null) {
      chemicals = <Chemicals>[];
      json['Chemicals'].forEach((v) {
        chemicals!.add(new Chemicals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.chemicals != null) {
      data['Chemicals'] = this.chemicals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chemicals {
  String? sId;
  String? scientificName;
  String? commonName;
  String? pdfPath;
  int? iV;

  Chemicals(
      {this.sId, this.scientificName, this.commonName, this.pdfPath, this.iV});

  Chemicals.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    scientificName = json['scientificName'];
    commonName = json['commonName'];
    pdfPath = json['pdfPath'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['scientificName'] = this.scientificName;
    data['commonName'] = this.commonName;
    data['pdfPath'] = this.pdfPath;
    data['__v'] = this.iV;
    return data;
  }
}
