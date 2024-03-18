// ignore_for_file: prefer_collection_literals

class BillModels {
  int? id;
  int? carId;
  int? expenseId;
  double? price;
  String? details;
  String? personName;
  int? currentOdometer;
  int? newOdometer;
  int? previousOdometer;
  int? distance;
  String? createdAt;
  String? updatedAt;
  int? plateNumbers;
  String? plateLetters;
  String? vin;
  int? carModel;
  String? typeOfCar;
  String? name;

  BillModels(
      {this.id,
      this.carId,
      this.expenseId,
      this.price,
      this.details,
      this.personName,
      this.currentOdometer,
      this.newOdometer,
      this.previousOdometer,
      this.distance,
      this.createdAt,
      this.updatedAt,
      this.plateNumbers,
      this.plateLetters,
      this.vin,
      this.carModel,
      this.typeOfCar,
      this.name});

  BillModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    carId = json['car_id'];
    expenseId = json['expense_id'];
    price = json['price'];
    details = json['details'];
    personName = json['person_name'];
    currentOdometer = json['current_odometer'];
    previousOdometer = json['previous_odometer'];
    distance = json['distance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    plateNumbers = json['plateNumbers'];
    plateLetters = json['plateLetters'];
    vin = json['vin'];
    carModel = json['carModel'];
    newOdometer = json['odometer_bill'];
    typeOfCar = json['typeOfCar'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['vin'] = vin;
    data['carModel'] = carModel;
    data['currentOdometer'] = currentOdometer;
    data['typeOfCar'] = typeOfCar;
    data['name'] = name;
    data['odometer_in_bill'] = newOdometer;
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
      'updated_at': updatedAt,
      'plateNumbers': plateNumbers,
      'plateLetters': plateLetters,
      'vin': vin,
      'carModel': carModel,
      'currentOdometer': currentOdometer,
      'typeOfCar': typeOfCar,
      'name': name,
      'current_odometer': newOdometer,
    };
  }
}
