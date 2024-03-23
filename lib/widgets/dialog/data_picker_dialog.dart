// import 'package:cars_expense_management/library.dart';

// // expensePickerDialog({required BuildContext context}) {
// //     return showDialog(
// //       context: context,
// //       builder: (context) {
// //         return Dialog(
// //             backgroundColor: Colors.white,
// //             surfaceTintColor: Colors.white,
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const Padding(
// //                     padding: EdgeInsets.only(top: 30, right: 20), child: Text("أختر نوع المصروف من القائمة التالية :", style: TextStyle(fontSize: 19))),
// //                 Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
// //                     height: 450,
// //                     width: 450,
// //                     child: FutureBuilder(
// //                         future: locator<ExpenseTypesRepositories>().getAllExpense(),
// //                         builder: (context, dataSnapshot) {
// //                           if (dataSnapshot.connectionState == ConnectionState.waiting) {
// //                             return const CircularProgressIndicator();
// //                           }
// //                           return ListView.builder(
// //                               padding: const EdgeInsets.only(top: 10),
// //                               itemCount: dataSnapshot.data?.length ?? 0,
// //                               scrollDirection: Axis.vertical,
// //                               shrinkWrap: false,
// //                               itemBuilder: (_, index) => ListTile(
// //                                     onTap: () {
// //                                       selectExpense(selectedExpense: dataSnapshot.data![index]);
// //                                       Navigator.pop(context);
// //                                     },
// //                                     leading: CircleAvatar(backgroundColor: AppBrand.drawerButtonColor, child: Text(dataSnapshot.data![index].id.toString())),
// //                                     title: Text(dataSnapshot.data![index].name!, style: const TextStyle(fontSize: 20)),
// //                                     trailing: const Icon(Icons.arrow_forward_ios),
// //                                   ));
// //                         })),
// //               ],
// //             )).animate().moveY(begin: 500, delay: const Duration(milliseconds: 10));
// //       },
// //     );
// //   }