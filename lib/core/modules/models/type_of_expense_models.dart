class TypeOfExpenseModels {
  int? id;
  String? name;

  TypeOfExpenseModels({this.id, this.name});

  TypeOfExpenseModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['expenseName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['expenseName'] = name;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'expenseName': name,
    };
  }
}
