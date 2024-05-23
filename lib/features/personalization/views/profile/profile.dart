import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mentalhealth_app/common/widgets/custom_shapes/containers/circle_container.dart';
import 'package:mentalhealth_app/features/personalization/controllers/user_controller.dart';
import 'package:mentalhealth_app/features/personalization/views/profile_setup/profile_setup.dart';
import 'package:mentalhealth_app/utils/constants/colors.dart';

import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            Obx(
              () => Text(controller.user.value.userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: MhColors.blue,
                  )),
            ),
            Obx(
              () => Text(controller.user.value.school,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: MhColors.blue,
                  )),
            ),
            const SizedBox(height: MhSizes.spaceBetweenSections),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 70,
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
                children: [
                  Expanded(child: Container(
                    child:Column(
                      children: [
                        const SizedBox(height: MhSizes.md),
                        Text("Chats",style: TextStyle(color:MhColors.blue,fontWeight: FontWeight.w500),),
                        Text("10",style: TextStyle(color:MhColors.blue,fontWeight: FontWeight.bold,fontSize: 17,))
                      ],
                    )
                  )),
                  const FractionallySizedBox(
                    heightFactor: 0.75, // Height factor set to 80%
                    child: VerticalDivider(
                      color: MhColors.blue, // Color of the divider
                      width: 1, // Width of the divider
                    ),
                  ),
                  Expanded(child: Container(
                    width: 55,
            height: 58,
            alignment: Alignment.center,
            child: Image.asset(
              MhImages.prof,
              fit: BoxFit.cover,
            ),
                  )),
                  const FractionallySizedBox(
                    heightFactor: 0.75, // Height factor set to 80%
                    child: VerticalDivider(
                      color: MhColors.blue, // Color of the divider
                      width: 1, // Width of the divider
                    ),
                  ),
                  Expanded(child: Container(
                    child:Column(
                      children: [
                        const SizedBox(height: MhSizes.md),
                        Text("Tests",style: TextStyle(color:MhColors.blue,fontWeight: FontWeight.w500),),
                        Text("24",style: TextStyle(color:MhColors.blue,fontWeight: FontWeight.bold,fontSize: 17,))
                      ],
                    )
                  )),
                ],
              ),
            ),
            const SizedBox(height: MhSizes.spaceBetweenSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child:Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      const SizedBox(height: MhSizes.md),
                      Row(
                        children: [
                          const SizedBox(width: MhSizes.lg),
                          Icon(Icons.favorite,color: MhColors.white,size: 24,),
                          const SizedBox(width: MhSizes.sm),
                          Text("Score",style:TextStyle(color: MhColors.white,fontWeight: FontWeight.w400,fontSize: 17))
                        ],
                      ),
                      Text("PSS",style: TextStyle(color: MhColors.white,fontWeight: FontWeight.w800,fontSize: 20)),
                       const SizedBox(height: MhSizes.xs),
                      Text("24",style: TextStyle(color:MhColors.white,fontSize:30,fontWeight: FontWeight.w700),),
                      Text("Moderate Stress",style:TextStyle(color:MhColors.white,fontSize:15),),
                    ],

                  ),
                  width: 160,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: MhColors.purple,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(20, 75, 52, 37),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: Offset(0, 8), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: MhSizes.spaceBtwInputFields),
                Container(
                  child:Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      const SizedBox(height: MhSizes.md),
                      Row(
                        children: [
                          const SizedBox(width: MhSizes.lg),
                          Icon(FontAwesomeIcons.solidFrownOpen,color: MhColors.white,size: 23,),
                          const SizedBox(width: MhSizes.sm),
                          Text("Mood",style:TextStyle(color: MhColors.white,fontWeight: FontWeight.w400,fontSize: 17))
                        ],
                      ),
                      Text("Sad",style: TextStyle(color: MhColors.white,fontWeight: FontWeight.w800,fontSize: 20)),
                      Container(
                    width: 105,
                    height: 100,
                    alignment: Alignment.center,
                    child: Image.asset(
                      MhImages.statistique,
                      fit: BoxFit.cover,
                    ),)
                    ],),
                  width: 160,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: MhColors.orange,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(20, 75, 52, 37),
                        spreadRadius: 0,
                        blurRadius: 16,
                        offset: Offset(0, 8), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned(
              top: -340,
              child: MhCircleContainer(
                width: 550,
                height: 550,
                radius: 550,
                backgroundColor: MhColors.blue,
              )),
          Positioned(
              top: 150,
              child: MhCircleContainer(
                width: 120,
                height: 120,
                radius: 120,
                child: ClipOval(
                    child: Image.asset(
                  MhImages.profilePic,
                  fit: BoxFit.cover,
                )),
              )),
          Positioned(
            top: 60,
            right: 20,
            child: GestureDetector(
              onTap: () => Get.to(() => const ProfileSetupScreen()),
              child: const MhCircleContainer(
                width: 30,
                height: 30,
                radius: 30,
                backgroundColor: MhColors.white,
                child: Icon(
                  Icons.settings,
                  color: MhColors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: GestureDetector(
              onTap: () => AuthenticationRepository.instance.logout(),
              child: const MhCircleContainer(
                width: 30,
                height: 30,
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.logout_rounded,
                  color: MhColors.white,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
