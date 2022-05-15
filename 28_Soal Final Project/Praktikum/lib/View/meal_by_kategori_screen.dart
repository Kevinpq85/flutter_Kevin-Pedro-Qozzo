// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:project_alta/Data_API/meal_by_data.dart';
import 'package:project_alta/Model/meal_by_kategori_model.dart';
import 'package:project_alta/View/meal_detail_screen.dart';

class MealsByCategotrieScreen extends StatelessWidget {
  const MealsByCategotrieScreen(
      {Key? key, required this.categoryname, required this.filterType})
      : super(key: key);
  final String categoryname;
  final String filterType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
          elevation: 0,
          titleSpacing: 0,
          title: Text(
            categoryname + ' Meals',
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder<List<MealsByCategorie>>(
          future: filterType == 'Kategori'
              ? MealByData.GetMealByCategory(categoryname)
              : filterType == 'Area'
                  ? MealByData.GetMealByArea(categoryname)
                  : filterType == 'Ingredient'
                      ? MealByData.GetMealByCIntegration(categoryname)
                      : null,
          builder: (context, snapshot) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: snapshot.hasData ? snapshot.data!.length : 33,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      MealDetailsScreen(
                                          MealID: snapshot.data![index].idMeal
                                              .toString()),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final tween = Tween(
                                    begin: const Offset(0, 5),
                                    end: Offset.zero);
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              }));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 5, top: 5, bottom: 5, right: 5),
                          width: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 5,
                                  color: Color.fromARGB(76, 0, 0, 0),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.shade300,
                                    image: snapshot.hasData
                                        ? DecorationImage(
                                            image: NetworkImage(
                                              snapshot
                                                  .data![index].strMealThumb!,
                                            ),
                                            fit: BoxFit.cover)
                                        : null,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    snapshot.hasData
                                        ? Text(
                                            snapshot.data![index].strMeal!,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        : Container(
                                            height: 15,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }));
          },
        ));
  }
}
