import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/core/base/cubits/nasa_vehicle_cubit/nasa_vehicle_cubit.dart';
import 'package:nasa_app/core/base/repositories/nasa_more_photo_repository.dart';
import 'package:nasa_app/core/components/box/custom_box.dart';
import 'package:nasa_app/core/components/button/back_to_top_button.dart';
import 'package:nasa_app/core/components/card/custom_card.dart';
import 'package:nasa_app/core/components/list_tile/filter_list_tile.dart';
import 'package:nasa_app/core/components/pop_up/detail_pop_up.dart';
import 'package:nasa_app/core/components/pop_up/filter_pop_up.dart';
import 'package:nasa_app/core/components/progress_indicator/custom_progress_indicator.dart';
import 'package:nasa_app/core/constants/text_constant.dart';
import 'package:nasa_app/core/extensions/context_extension.dart';

import '../../../core/base/cubits/home_cubit/home_cubit.dart';
import '../../../core/base/model/nasa_vehicle_model.dart';
import '../../../core/utils/locator.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  ScrollController _scrollController = ScrollController();
  bool backtoTop = false;
  bool isLastIndex = false;
  bool check = false;
  int _maxLenght = 10;
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  _getPagination() async {
    setState(() {
      isLoading = true;
    });
    getImagesPagination(page);
    setState(() {
      isLoading = false;
      page = page + 1;
      hasMore =
          sl<NasaVehicleCubit>().nasaCuriosityVehicles.length < _maxLenght;
    });
  }

  @override
  void initState() {
    _getPagination();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.95 &&
          !isLoading) {
        if (hasMore) {
          _getPagination();
        }
      }
      setState(() {
        backtoTop = _scrollController.offset > 100 ? true : false;
        isLastIndex = _scrollController.offset >
                _scrollController.position.maxScrollExtent
            ? true
            : false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<HomeCubit>()..init(page)),
      ],
      child: BlocBuilder<NasaVehicleCubit, NasaVehicleState>(
        builder: (context, state) {
          if (state is NasaVehicleLoading) {
            return const CustomProgressIndicator();
          } else {
            return buildBody(
                context,
                sl<NasaVehicleCubit>().nasaSpiritVehicles,
                sl<NasaVehicleCubit>().nasaOpportunityVehicles,
                sl<NasaVehicleCubit>().nasaCuriosityVehicles);
          }
        },
      ),
    );
  }

  DefaultTabController buildBody(
      BuildContext context,
      List<Photo> nasaSpiritVehicles,
      List<Photo> nasaOpportunityVehicles,
      List<Photo> nasaCuriosityVehicles) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildTabBarViews(context, nasaSpiritVehicles,
            nasaCuriosityVehicles, nasaOpportunityVehicles),
      ),
    );
  }

  TabBarView buildTabBarViews(
      BuildContext context,
      List<Photo> nasaSpiritVehicles,
      List<Photo> nasaCuriosityVehicles,
      List<Photo> nasaOpportunityVehicles) {
    return TabBarView(controller: tabController, children: [
      buildSpiritTabView(context, nasaSpiritVehicles),
      buildCuriosityTabView(context, nasaCuriosityVehicles),
      buildOpportunityTabView(context, nasaOpportunityVehicles),
    ]);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [buildFilterButton(context)],
      automaticallyImplyLeading: false,
      bottom: buildTabBar(context),
      title: Text(
        TextConstants.titleAppBar,
        style: context.textTheme.headline4!.copyWith(color: Colors.white),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: context.customColors!.bilobaFlower,
      labelPadding: EdgeInsets.symmetric(vertical: 10),
      tabs: [
        Text(TextConstants.spirit),
        Text(TextConstants.curiosity),
        Text(TextConstants.opportunity),
      ],
    );
  }

  IconButton buildFilterButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          buildFilterPopUp(context);
        },
        icon: Icon(
          Icons.filter_alt_rounded,
          color: Colors.white,
        ));
  }

  Future<bool?> buildFilterPopUp(BuildContext context) {
    return filterPopUp(
        context,
        ListView.builder(
            itemCount: sl<NasaVehicleCubit>().vehiclesCamera.length,
            itemBuilder: ((context, index) {
              return FilterListTile(
                onPressed: () {
                  setState(() {
                    check = !check;
                    sl<NasaVehicleCubit>().vehiclesCameraFilter(index, context);
                  });
                },
                index: index,
              );
            })));
  }

  Padding buildSpiritTabView(
      BuildContext context, List<Photo> nasaSpiritVehicles) {
    return Padding(
      padding: context.paddingLowAll,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: nasaSpiritVehicles.length,
          itemBuilder: (BuildContext context, index) {
            return CustomBox(
              onTap: () {
                detailPopUp(
                    context,
                    nasaSpiritVehicles[index].imgSrc!,
                    nasaSpiritVehicles[index].rover!.name!,
                    nasaSpiritVehicles[index].camera!.fullName!,
                    nasaSpiritVehicles[index].rover!.status!,
                    DateFormat("dd/MM/yyyy")
                        .format(nasaSpiritVehicles[index].rover!.landingDate!)
                        .toString(),
                    DateFormat("dd/MM/yyyy")
                        .format(nasaSpiritVehicles[index].rover!.launchDate!)
                        .toString(),
                    DateFormat("dd/MM/yyyy")
                        .format(nasaSpiritVehicles[index].earthDate!)
                        .toString());
              },
              child: filter(nasaSpiritVehicles, index),
            );
          }),
    );
  }

  filter(List<Photo> nasaVehicles, int index) {
    if (check == false) {
      return CustomCard(
        imageSrc: nasaVehicles[index].imgSrc!,
      );
    } else if (check == true &&
        nasaVehicles[index].camera!.name == sl<NasaVehicleCubit>().filterName) {
      return CustomCard(
        imageSrc: nasaVehicles[index].imgSrc!,
      );
    } else {
      return SizedBox();
    }
  }

  Padding buildOpportunityTabView(
      BuildContext context, List<Photo> nasaOpportunityVehicles) {
    return Padding(
      padding: context.paddingLowAll,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: nasaOpportunityVehicles.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                detailPopUp(
                    context,
                    nasaOpportunityVehicles[index].imgSrc!,
                    nasaOpportunityVehicles[index].rover!.name!,
                    nasaOpportunityVehicles[index].camera!.fullName!,
                    nasaOpportunityVehicles[index].rover!.status!,
                    DateFormat("dd/MM/yyyy")
                        .format(
                            nasaOpportunityVehicles[index].rover!.landingDate!)
                        .toString(),
                    DateFormat("dd/MM/yyyy")
                        .format(
                            nasaOpportunityVehicles[index].rover!.launchDate!)
                        .toString(),
                    DateFormat("dd/MM/yyyy")
                        .format(nasaOpportunityVehicles[index].earthDate!)
                        .toString());
              },
              child: filter(nasaOpportunityVehicles, index),
            );
          }),
    );
  }

  Stack buildCuriosityTabView(
      BuildContext context, List<Photo> nasaCuriosityVehicles) {
    return Stack(
      children: [
        Padding(
          padding: context.paddingLowAll,
          child: GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: nasaCuriosityVehicless.length + (hasMore ? 1 : 0),
              itemBuilder: (BuildContext context, index) {
                if (index == nasaCuriosityVehicless.length) {
                  return CustomProgressIndicator();
                }
                return GestureDetector(
                  onTap: () {
                    detailPopUp(
                        context,
                        nasaCuriosityVehicless[index].imgSrc!,
                        nasaCuriosityVehicless[index].rover!.name!,
                        nasaCuriosityVehicless[index].camera!.fullName!,
                        nasaCuriosityVehicless[index].rover!.status!,
                        DateFormat("dd/MM/yyyy")
                            .format(nasaCuriosityVehicless[index]
                                .rover!
                                .landingDate!)
                            .toString(),
                        DateFormat("dd/MM/yyyy")
                            .format(nasaCuriosityVehicless[index]
                                .rover!
                                .launchDate!)
                            .toString(),
                        DateFormat("dd/MM/yyyy")
                            .format(nasaCuriosityVehicless[index].earthDate!)
                            .toString());
                  },
                  child: filter(nasaCuriosityVehicless, index),
                );
              }),
        ),
        BackToTopButton( scrollController: _scrollController, backtoTop: backtoTop,)
      ],
    );
  }
}
