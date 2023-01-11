import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplashimages/AppConstants/appConstants.dart';
import 'package:unsplashimages/Models/imageModel.dart';
import '../Controllers/DashboardController.dart';
import '../Widgets/customText.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Obx(
          ()=> NotificationListener<ScrollEndNotification>(
            onNotification: (ScrollEndNotification notification) {
              if (notification.metrics.extentAfter == 0) {
                controller.getMoreImages();
              }
              return true;
            },
            child: CustomScrollView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              slivers: [
                 SliverAppBar(
                  leading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ImageIcon(color: blackColor,AssetImage('assets/images/unsplash.png')),
                  ),
                  title: customText(text: 'Unsplash',color: blackColor,fontWeight: FontWeight.bold),
                  pinned: true,
                  backgroundColor: whiteColor,
                ),
      SliverToBoxAdapter(
            child: controller.isLoading.value?loader(): controller.allImagesList.isEmpty?const Center(
              child: Text('\nNothing to show.'),
            ):Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: Get.height/3.5,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),fit: BoxFit.cover,image: NetworkImage(controller.allImagesList[4].urls!.regular!)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Text('Best Unsplash Images\n̬̬',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                ),
              ),
            ),
      ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return buildImageCard(image:controller.allImagesList[index]);
                    },
                    childCount: controller.allImagesList.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: controller.isLoadingEnd.value?loader():Container(),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget buildImageCard({required ImageModel image}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
                      height: Get.height/2.2,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                        image: DecorationImage(
                        image: NetworkImage(image.urls!.regular!),
                          fit: BoxFit.cover,
                      ),
                      ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.transparent
                ],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  customText(text: image.user!.firstName!??"",color: whiteColor,fontSize: 20,overFlow: TextOverflow.visible,fontWeight: FontWeight.bold),
                  customText(text: image.altDescription??"",color: whiteColor,fontSize: 17,overFlow: TextOverflow.visible),
                ],
              ),
            ),
          ),
        ),
                    ),
    );
  }
}
