library core;

export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:cars_expense_management/core/config/theme/theme.dart';
export 'package:cars_expense_management/core/generated/router/router.dart';

// export 'package:car_expense_management/core/constant/endpoints.dart';
// export '../core/config/theme/theme.dart';

//!Screen
export 'package:cars_expense_management/screens/layout.dart';
export 'package:cars_expense_management/screens/cars/add_car/add_car_screen.dart';
export 'package:cars_expense_management/screens/bills/bills_layout.dart';
export 'package:cars_expense_management/screens/cars/cars_screen.dart';
export 'package:cars_expense_management/screens/home/home_screen.dart';
export 'package:cars_expense_management/screens/settings/settings_screen.dart';
export 'package:cars_expense_management/screens/side_menu.dart';
export 'package:cars_expense_management/screens/expense_types/expese_types_screen.dart';
export 'package:cars_expense_management/screens/bills/add_bill/add_bill_screen.dart';
export 'package:cars_expense_management/screens/bills/bills_screen.dart';
export 'package:cars_expense_management/screens/bills/bills_view_model.dart';
export 'package:cars_expense_management/screens/cars/data_source/cars_data_source.dart';
export 'package:cars_expense_management/screens/expense_types/data_source/expense_types_data_source.dart';

//!package
export 'package:get_it/get_it.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:getwidget/getwidget.dart';
export 'package:go_router/go_router.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:window_size/window_size.dart';
export 'package:sqflite/sqflite.dart';
// export 'package:provider/provider.dart';

//!utils
export 'package:cars_expense_management/core/generated/locator/locater.dart';

//!provider

//!modules
export 'package:cars_expense_management/core/modules/models/car_models.dart';
export 'package:cars_expense_management/core/modules/models/type_of_expense_models.dart';
export 'package:cars_expense_management/core/modules/repositories/expense_types_repositories.dart';
export 'package:cars_expense_management/core/modules/models/bill_models.dart';
export 'package:cars_expense_management/core/modules/repositories/bills_repositories.dart';
export 'package:cars_expense_management/core/modules/repositories/car_repositories.dart';

//!views model
export 'package:cars_expense_management/screens/cars/cars_view_model.dart';
export 'package:cars_expense_management/screens/expense_types/expense_types_view_model.dart';
//!widget
export 'package:cars_expense_management/widgets/text_field.dart';

export 'package:cars_expense_management/core/modules/database_service.dart';
