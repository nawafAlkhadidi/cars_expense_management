class BillModels {
  int? id;
  int? carId;
  int? expenseId;
  double? price;
  String? details;
  String? personName;
  int? lastOdometer;
  int? newOdometer;
  int? previousOdometer;
  int? distance;
  String? createdAt;
  String? updatedAt;
  int? plateNumbers;
  String? plateLetters;
  String? expenseName;
  String? typeOfCar;

  BillModels({
    this.id,
    this.carId,
    this.expenseId,
    this.price,
    this.details,
    this.personName,
    this.lastOdometer,
    this.newOdometer,
    this.previousOdometer,
    this.distance,
    this.createdAt,
    this.updatedAt,
    this.plateNumbers,
    this.plateLetters,
    this.expenseName,
    this.typeOfCar,
  });

  BillModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carId = json['car_id'];
    expenseId = json['expense_id'];
    price = json['price'];
    details = json['details'];
    personName = json['person_name'];
    lastOdometer = json['lastOdometer'];
    previousOdometer = json['previous_odometer'];
    distance = json['distance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    plateNumbers = json['plateNumbers'];
    plateLetters = json['plateLetters'];
    newOdometer = json['new_odometer'];
    expenseName = json['expenseName'];
    typeOfCar = json['typeOfCar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['car_id'] = carId;
    data['expense_id'] = expenseId;
    data['price'] = price;
    data['details'] = details;
    data['person_name'] = personName;
    data['current_odometer'] = newOdometer;
    data['previous_odometer'] = previousOdometer;
    data['distance'] = distance;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['plateNumbers'] = plateNumbers;
    data['plateLetters'] = plateLetters;
    data['lastOdometer'] = lastOdometer;
    data['new_odometer'] = newOdometer;
    data['expenseName'] = expenseName;
    data['typeOfCar'] = typeOfCar;

    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'car_id': carId,
      'expense_id': expenseId,
      'price': price,
      'details': details,
      'person_name': personName,
      'previous_odometer': previousOdometer,
      'distance': distance,
      'created_at': createdAt,
      'new_odometer': newOdometer,
    };
  }
}
