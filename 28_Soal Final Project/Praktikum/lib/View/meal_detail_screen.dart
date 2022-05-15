import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_alta/Data_API/meal_data.dart';
import 'package:project_alta/Model/meal_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key, required this.MealID}) : super(key: key);
  final String MealID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          FutureBuilder<List<MealModel>>(
            future: MealData.GetMealByID(MealID),
            builder: (context, snapshot) {
              List<dynamic> Ingredient = snapshot.hasData
                  ? [
                      snapshot.data![0].strIngredient1,
                      snapshot.data![0].strIngredient2,
                      snapshot.data![0].strIngredient3,
                      snapshot.data![0].strIngredient4,
                      snapshot.data![0].strIngredient5,
                      snapshot.data![0].strIngredient6,
                      snapshot.data![0].strIngredient7,
                      snapshot.data![0].strIngredient8,
                      snapshot.data![0].strIngredient9,
                      snapshot.data![0].strIngredient10,
                      snapshot.data![0].strIngredient11,
                      snapshot.data![0].strIngredient12,
                      snapshot.data![0].strIngredient1,
                      snapshot.data![0].strIngredient14,
                      snapshot.data![0].strIngredient15,
                      snapshot.data![0].strIngredient16,
                      snapshot.data![0].strIngredient17,
                      snapshot.data![0].strIngredient18,
                      snapshot.data![0].strIngredient19,
                      snapshot.data![0].strIngredient20,
                    ]
                  : [];
              List<dynamic> Measure = snapshot.hasData
                  ? [
                      snapshot.data![0].strMeasure1,
                      snapshot.data![0].strMeasure2,
                      snapshot.data![0].strMeasure3,
                      snapshot.data![0].strMeasure4,
                      snapshot.data![0].strMeasure5,
                      snapshot.data![0].strMeasure6,
                      snapshot.data![0].strMeasure7,
                      snapshot.data![0].strMeasure8,
                      snapshot.data![0].strMeasure9,
                      snapshot.data![0].strMeasure10,
                      snapshot.data![0].strMeasure11,
                      snapshot.data![0].strMeasure12,
                      snapshot.data![0].strMeasure13,
                      snapshot.data![0].strMeasure14,
                      snapshot.data![0].strMeasure15,
                      snapshot.data![0].strMeasure16,
                      snapshot.data![0].strMeasure17,
                      snapshot.data![0].strMeasure18,
                      snapshot.data![0].strMeasure19,
                      snapshot.data![0].strMeasure20,
                    ]
                  : [];
              return snapshot.hasData
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: snapshot.hasData
                                      ? DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data![0].strMealThumb!,
                                          ),
                                          fit: BoxFit.cover)
                                      : null,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                snapshot.data![0].strMeal!,
                                                maxLines: 5,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          'Deskripsi',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data![0].strInstructions!,
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Divider(
                                            height: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Bahan-bahan',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: 20,
                                          itemBuilder: (context, index) {
                                            return Ingredient[index] != "" &&
                                                    Ingredient[index] != null
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 5.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          ' - ' +
                                                              Ingredient[index],
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade800,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Measure[index] != "" &&
                                                                Measure[index] !=
                                                                    null
                                                            ? Text(
                                                                ': ' +
                                                                    Measure[
                                                                        index],
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200,
                                                                ),
                                                              )
                                                            : Container(),
                                                      ],
                                                    ),
                                                  )
                                                : Container();
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        snapshot.data![0].strTags != null
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20),
                                                      child: Divider(
                                                        height: 1,
                                                        color: Colors
                                                            .grey.shade200,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    const Text(
                                                      'Tags',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      ' - ' +
                                                          snapshot.data![0]
                                                              .strTags!,
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ])
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(-1, 1),
                                  blurRadius: 5,
                                  color: Color.fromARGB(117, 0, 0, 0),
                                )
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                onTap: () async {
                                  final String url =
                                      snapshot.data![0].strYoutube!;

                                  await launch(
                                    url,
                                    forceSafariVC:
                                        false, // false : lunching your url in another Browser of iOS
                                    forceWebView:
                                        false, //  false :lunching your url in another Browser of Android
                                    enableJavaScript: true, // Android
                                  );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffC3211A),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 5,
                                          color: Color.fromARGB(117, 0, 0, 0),
                                        )
                                      ]),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Tonton Sekarang',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    )
                  : Container();
            },
          ),
          const ArrowBackButton(),
        ],
      ),
    );
  }
}

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffC3211A),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 1,
                color: Color.fromARGB(82, 0, 0, 0),
              )
            ]),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
