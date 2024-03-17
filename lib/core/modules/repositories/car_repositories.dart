import 'package:cars_expense_management/library.dart';

class CarRepositories {
  final DatabaseService databaseService;

  CarRepositories(this.databaseService);

  Future<List<CarModel>> getCars() async {
    List<CarModel> cars = [];
    Database db = await databaseService.database;
    List<Map<String, dynamic>> carData = await db.query('cars');
    for (var car in carData) {
      cars.add(CarModel.fromJson(car));
    }
    return cars;
  }

  Future<bool> addcar(CarModel newCar) async {
    Database db = await databaseService.database;
    await db.insert('cars', newCar.toMap()).then((value) => null);
    return true;
  }

  Future<bool> deleteTheCar(int carID) async {
    Database db = await databaseService.database;
    await db.delete('cars', where: 'id = ?', whereArgs: [carID]);
    return true;
  }

  Future<bool> upadteTheCar(int carID, CarModel car) async {
    Database db = await databaseService.database;
    await db.update('cars', car.toMap(), where: 'id = ?', whereArgs: [carID]);
    return true;
  }
}
