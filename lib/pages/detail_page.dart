import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_state.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is DetailState) {
            DataModel place = state.place;
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/${place.img}'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 50,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 320,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: place.name,
                                color: Colors.black54.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: '\$ ${place.price}',
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: place.location,
                                color: Colors.lightBlueAccent.withOpacity(0.6),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: index < place.stars
                                              ? AppColors.starColor
                                              : AppColors.textColor1,
                                        )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              AppText(
                                  text: '(5.0)',
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.6))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8),
                            size: 22,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: 'Number of people in your group',
                            color: AppColors.mainColor.withOpacity(0.6),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: List.generate(place.people, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AppLargeText(
                            text: 'Description',
                            color: Colors.black.withOpacity(0.8),
                            size: 22,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AppText(
                            text: place.description,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          AppButton(
                            color: AppColors.textColor2,
                            backgroundColor: Colors.white,
                            size: 60,
                            borderColor: AppColors.textColor2,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ResponsiveButton(
                            isResponsive: true,
                          )
                        ],
                      ))
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
