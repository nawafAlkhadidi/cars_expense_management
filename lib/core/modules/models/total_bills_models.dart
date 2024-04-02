class TotalBillsModels {
  String? date;
  int? monthNumber;
  double? totalPrice;

  TotalBillsModels({
    this.date,
    this.monthNumber,
    this.totalPrice,
  });

  TotalBillsModels.fromJson(Map<String, dynamic> json) {
    date = json['month'];
    monthNumber = int.tryParse(json['month_number']);
    totalPrice = json['total_price'];
  }
}
