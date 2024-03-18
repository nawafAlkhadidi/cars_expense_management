class BillModels {
  int? id; //
  int? carId; //
  int? expenseId;
  String? price; //
  String? details;
  String? currentOdometer; //
  String? previousOdometer; //
  String? personName; //
  String? distance; //
  String? createdAt; //

  BillModels(
      {this.id,
      this.carId,
      this.expenseId,
      this.price,
      this.details,
      this.currentOdometer,
      this.previousOdometer,
      this.distance,
      this.personName,
      this.createdAt});

  BillModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carId = json['car_id'];
    expenseId = json['expense_id'];
    price = json['price'];
    details = json['details'];
    currentOdometer = json['current_odometer'];
    previousOdometer = json['previous_odometer'];
    distance = json['distance'];
    personName = json['person_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car_id'] = carId;
    data['expense_id'] = expenseId;
    data['price'] = price;
    data['details'] = details;
    data['current_odometer'] = currentOdometer;
    data['previous_odometer'] = previousOdometer;
    data['person_name'] = personName;
    data['distance'] = distance;
    data['created_at'] = createdAt;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'car_id': carId,
      'expense_id': expenseId,
      'price': price,
      'details': details,
      'current_odometer': currentOdometer,
      'previous_odometer': previousOdometer,
      'distance': distance,
      'person_name': personName,
      'created_at': createdAt,
    };
  }
}
