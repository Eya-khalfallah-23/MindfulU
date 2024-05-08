import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mentalhealth_app/features/personalization/controllers/user_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String selectedText = 'Students Rights';
  Color selectedColor = MhColors.orange;
  AssetImage selectedImage = const AssetImage(MhImages.student);

  void updateSelected(String newText, Color newColor, String imagePath) {
    setState(() {
      selectedText = newText;
      selectedColor = newColor;
      selectedImage = AssetImage(imagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: MhSizes.spaceBetweenSections * 1.5,
              ),
              Image.asset(MhImages.appLogo, width: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hi!, ",style: TextStyle(
                        fontSize: 20,
                        color: MhColors.blue,
                      ),
                      textAlign: TextAlign.center,),
                  Obx(
                    () => Text(controller.user.value.userName,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: MhColors.blue,
                        ),
                        textAlign: TextAlign.center,),
                  ),
                ],
              ),
              const SizedBox(height: 7,),
              Text("Your Well-being Matters!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: MhColors.blue,
                  )),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: MediaQuery.of(Get.context!).size.width * 0.7,
                child: Text(
                  'Discover Support for Your Mental Health Journey',
                  style: TextStyle(
                    fontSize: 20,
                    color: MhColors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MhSizes.spaceBetweenItems*1.5),
              Container(
                width: MediaQuery.of(Get.context!).size.width * 0.92,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: MhColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(20, 75, 52, 37),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: Offset(0, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: selectedText == 'Students Rights'
                              ? [
                                  BoxShadow(
                                    color: selectedColor.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: TextButton(
                          onPressed: () => updateSelected('Students Rights',
                              MhColors.orange, MhImages.student),
                          style: ButtonStyle(
                            backgroundColor: selectedText == 'Students Rights'
                                ? MaterialStateProperty.all(selectedColor)
                                : null,
                            shadowColor: MaterialStateProperty.all(
                                selectedColor.withOpacity(0.5)),
                          ),
                          child: Text(
                            'Students Rights',
                            style: TextStyle(
                                color: selectedText == 'Students Rights'
                                    ? Colors.white
                                    : MhColors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: selectedText == 'Psychiatrist Contacts'
                              ? [
                                  BoxShadow(
                                    color: selectedColor.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: TextButton(
                          onPressed: () => updateSelected(
                              'Psychiatrist Contacts',
                              MhColors.purple,
                              MhImages.doctors),
                          style: ButtonStyle(
                            backgroundColor:
                                selectedText == 'Psychiatrist Contacts'
                                    ? MaterialStateProperty.all(selectedColor)
                                    : null,
                          ),
                          child: Text(
                            'Psychiatrist Contacts',
                            style: TextStyle(
                                color: selectedText == 'Psychiatrist Contacts'
                                    ? Colors.white
                                    : MhColors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: selectedText == 'Listening Cell'
                              ? [
                                  BoxShadow(
                                    color: selectedColor.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: TextButton(
                          onPressed: () => updateSelected(
                              'Listening Cell', MhColors.green, MhImages.cell),
                          style: ButtonStyle(
                            backgroundColor: selectedText == 'Listening Cell'
                                ? MaterialStateProperty.all(selectedColor)
                                : null,
                          ),
                          child: Text(
                            'Listening Cell',
                            style: TextStyle(
                                color: selectedText == 'Listening Cell'
                                    ? Colors.white
                                    : MhColors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(Get.context!).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: selectedColor.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: selectedColor,
                ),
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      child: Expanded(
                        child: Text(
                          'This is a paragraph that can be changed based on the selected button.',
                          style: TextStyle(fontSize: 14, color: MhColors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Image(image: selectedImage, width: 170),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
