class SummaryModel {
  int? totalCars;
  int? totalBills;
  int? totalExpenseTypes;
  double? totalPrice;

  SummaryModel({this.totalCars, this.totalBills, this.totalExpenseTypes, this.totalPrice});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    totalCars = json['total_cars'];
    totalBills = json['total_bills'];
    totalExpenseTypes = json['total_expense_types'];
    totalPrice = json['total_price'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_cars'] = totalCars;
    data['total_bills'] = totalBills;
    data['total_expense_types'] = totalExpenseTypes;
    data['total_price'] = totalPrice;
    return data;
  }
}
