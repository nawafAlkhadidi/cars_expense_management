class WeeklySummaryModel {
  int? id;
  String? day;
  double? totalPriceBills;

  WeeklySummaryModel({this.id, this.day, this.totalPriceBills});

  WeeklySummaryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    totalPriceBills = json['total_price_bills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['total_price_bills'] = double.parse(totalPriceBills.toString());
    return data;
  }
}
