class CarModel {
  int? id;
  int? plateNumbers;
  String? plateLetters;
  String? vin;
  int? carModel;
  int? lastOdometer;
  String? typeOfCar;
  String? licenseExpiration;
  String? inspectionExpiration;

  CarModel(
      {this.id,
      this.plateNumbers,
      this.plateLetters,
      this.vin,
      this.carModel,
      this.typeOfCar,
      this.lastOdometer,
      this.licenseExpiration,
      this.inspectionExpiration});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plateNumbers = json['plateNumbers'];
    plateLetters = json['plateLetters'];
    vin = json['vin'];
    carModel = json['carModel'];
    typeOfCar = json['typeOfCar'];
    lastOdometer = json['lastOdometer'];
    licenseExpiration = json['license_expiration'];
    inspectionExpiration = json['inspection_expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plateNumbers'] = plateNumbers;
    data['plateLetters'] = plateLetters;
    data['vin'] = vin;
    data['carModel'] = carModel;
    data['typeOfCar'] = typeOfCar;
    data['lastOdometer'] = lastOdometer;
    data['license_expiration'] = licenseExpiration;
    data['inspection_expiration'] = inspectionExpiration;

    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plateNumbers': plateNumbers,
      'plateLetters': plateLetters,
      'vin': vin,
      'carModel': carModel,
      'typeOfCar': typeOfCar,
      'lastOdometer': lastOdometer,
      'license_expiration': licenseExpiration,
      'inspection_expiration': inspectionExpiration,
    };
  }
}
