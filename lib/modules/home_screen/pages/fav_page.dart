import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/extensions/extensions.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/utils/firebase_services.dart';
import '../../../core/utils/firestore_services.dart';
import '../../../models/event_model.dart';
import '../widget/event_cart.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  TextEditingController searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String searchQuery = "";
  List<EventModel> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            0.01.horSpace,
            SafeArea(
              child: CustomTextFormField(
                hintText: "Search For Event",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                controller: searchController,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.secondary,
                ),
                onChanged: (value) {
                  searchQuery = value!;
                  setState(() {});
                },
              ),
            ),
            Visibility(
              visible: searchList.isEmpty,
              replacement: StreamBuilder(
                stream: FireStoreServices.getStreamEvents(),
                builder: (context, snapshot) {
                  // log("Start Checking");
                  // if (snapshot.hasError) {
                  //   EasyLoading.showError("Error while loading");
                  // } else if (snapshot.connectionState == ConnectionState.done) {
                  //   EasyLoading.dismiss();
                  // } else if (snapshot.connectionState ==
                  //     ConnectionState.waiting) {
                  //   EasyLoading.show();
                  // } else if (snapshot.error == AsyncSnapshot.waiting()) {
                  //   EasyLoading.show();
                  // } else if (snapshot.data == null) {
                  //   log("No Data Available  ");
                  //   return const Text(
                  //     "No Data Available",
                  //     style: TextStyle(
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.red,
                  //     ),
                  //   ).centerWidget();


                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  List<EventModel> filter = [];
                  snapshot.data!.docs
                      .map((QueryDocumentSnapshot<Object?> event) {
                    EventModel model = event.data() as EventModel;
                    if (model.isLiked == true) {
                      log("Found Event");
                      filter.add(model);
                    }
                    return event.data() as EventModel;
                  }).toList();
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => EventCart(
                        model: searchList[index],
                      ),
                      separatorBuilder: (context, _) => 0.01.horSpace,
                      itemCount: searchList.length,
                    ),
                  );
                },
              ),
              child: StreamBuilder(
                stream: FireStoreServices.getStreamEvents(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   EasyLoading.show();
                  // } else if (snapshot.hasError) {
                  //   EasyLoading.showError("Error while loading");
                  // } else if (snapshot.connectionState == ConnectionState.done) {
                  //   EasyLoading.dismiss();
                  // }
                  // else if (snapshot.connectionState == ConnectionState.none)
                  //   {
                  //     EasyLoading.show();
                  //   }
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Text("Loading");
                  // }
                  // if (snapshot.data == null) {
                  //   EasyLoading.dismiss();
                  //   return const Text(
                  //     "No Data Available",
                  //     style: TextStyle(
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.red,
                  //     ),
                  //   ).centerWidget();

                  List<EventModel> filter = [];
                  List data = snapshot.data!.docs
                      .map((QueryDocumentSnapshot<Object?> event) {
                    EventModel model = event.data() as EventModel;
                    if (model.isLiked == true) {
                      log("Found Event");
                      filter.add(model);
                    }
                    return event.data() as EventModel;
                  }).toList();
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => EventCart(
                        model: filter[index],
                      ),
                      separatorBuilder: (context, _) => 0.01.horSpace,
                      itemCount: filter.length,
                    ),
                  );
                },
              ),
            )
          ],
        ).verPadding(0.01),
      ),
    );
  }

  void searchEvents() {
    FireStoreServices.getStreamEvents().map(
      (QuerySnapshot<Object?> event) {
        searchList.clear();
        event.docs.map(
          (model) {
            EventModel data = model.data() as EventModel;
            if (data.event.contains(searchQuery)) {
              searchList.add(data);
            } else if (data.imagePath.contains(searchQuery)) {
              searchList.add(data);
            } else if (data.category.contains(searchQuery)) {
              searchList.add(data);
            }
          },
        );
      },
    );
  }
}
