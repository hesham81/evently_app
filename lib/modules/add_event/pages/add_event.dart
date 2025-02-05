import 'package:evently/core/utils/firestore_services.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/utils/firebase_services.dart';
import '/core/extensions/extensions.dart';
import '/core/theme/app_colors.dart';
import '/core/widget/custom_elevated_button.dart';
import '/core/widget/custom_text_button.dart';
import '/core/widget/custom_text_form_field.dart';
import '/core/widget/tab_icons.dart';
import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
  static const routeName = '/add-event';

  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  List<String> imagePaths = [
    "assets/images/Book Club-1.png",
    "assets/images/Book Club-2.png",
    "assets/images/Book Club-3.png",
    "assets/images/Book Club-4.png",
    "assets/images/Book Club-5.png",
    "assets/images/Book Club-6.png",
    "assets/images/Book Club-7.png",
    "assets/images/Book Club-8.png",
  ];
  List<String> category = [
    "Eating",
    "WorkShop",
    "Holiday",
    "Games",
    "Meeting",
    "Birthday",
    "Sports",
    "Exhibition",
  ];
  int selectedTabIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Create Event",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
            color: AppColors.secondary,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: DefaultTabController(
        length: category.length,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              0.02.horSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePaths[selectedTabIndex],
                ),
              ),
              0.01.horSpace,
              TabBar(
                padding: EdgeInsets.symmetric(vertical: 20),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                onTap: _onTabClicked,
                tabs: [
                  TabIcons.createEvent(
                    icon: Icons.fastfood_outlined,
                    text: category[0],
                    isSelected: (selectedTabIndex == 0),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.work_sharp,
                    text: category[1],
                    isSelected: (selectedTabIndex == 1),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.airplay,
                    text: category[2],
                    isSelected: (selectedTabIndex == 2),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.gamepad,
                    text: category[3],
                    isSelected: (selectedTabIndex == 3),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.meeting_room_outlined,
                    text: category[4],
                    isSelected: (selectedTabIndex == 4),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.cake_outlined,
                    text: category[5],
                    isSelected: (selectedTabIndex == 5),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.directions_bike_sharp,
                    text: category[6],
                    isSelected: (selectedTabIndex == 6),
                  ),
                  TabIcons.createEvent(
                    icon: Icons.account_tree_outlined,
                    text: category[7],
                    isSelected: (selectedTabIndex == 7),
                  ),
                ],
              ),
              0.01.horSpace,
              Text(
                "Title",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              CustomTextFormField(
                controller: titleController,
                hintText: "Event title ",
                prefixIcon: Icon(Icons.mode_edit_sharp),
              ),
              0.01.horSpace,
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              0.01.horSpace,
              CustomTextFormField(
                controller: descriptionController,
                hintText: "Event Description ",
                prefixIcon: null,
                maxLine: 3,
              ),
              0.01.horSpace,
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  0.01.verSpace,
                  Text(
                    "Event Date",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: "Choose Date",
                    callBack: () {},
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              0.002.horSpace,
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  0.01.verSpace,
                  Text(
                    "Event Time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: "Choose Time",
                    callBack: () {},
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              0.01.horSpace,
              Text(
                "Location",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
              0.01.horSpace,
              SizedBox(
                height: 0.08.height,
                child: CustomElevatedButton(
                  callBack: () {},
                  backgroundColor: Colors.white,
                  borderColor: AppColors.secondary,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          overlayColor: AppColors.secondary,
                          backgroundColor: AppColors.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: AppColors.secondary,
                              width: 2,
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.gps_fixed,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      0.01.verSpace,
                      Text(
                        "Choose Event Location",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondary,
                      ),
                      0.03.verSpace,
                    ],
                  ),
                ),
              ),
              0.01.horSpace,
              CustomElevatedButton(
                callBack: () {
                  EasyLoading.show();
                  EventModel model = EventModel(
                    id: FireStoreServices.generateId(
                      value1: titleController.text,
                      value2: category[selectedTabIndex],
                    ),
                    event: descriptionController.text,
                    uid: FirebaseAuthServices.getCurrentUser()!.uid,
                    category: category[selectedTabIndex],
                    eventDate: DateTime.now(),
                    imagePath: imagePaths[selectedTabIndex],
                  );
                  FireStoreServices.addNewEvent(event: model);
                  EasyLoading.dismiss();
                  Navigator.pop(context);
                },
                padding: EdgeInsets.all(15),
                text: Text(
                  "Add Event",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ).verPadding(0.03),
        ),
      ),
    );
  }

  _onTabClicked(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
