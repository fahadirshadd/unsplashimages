
import 'package:get/get.dart';

import '../Models/imageModel.dart';
import '../Services/services.dart';

class DashboardController extends GetxController{
  Services services = Services();
  RxList<ImageModel> allImagesList = <ImageModel>[].obs;
  RxInt page=2.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingEnd = false.obs;

  @override
  void onInit() {
    print('initializing...');
    getImages();
    super.onInit();
  }
Future<void> getImages() async {
  List<ImageModel> imgList = <ImageModel>[];
    isLoading.value=true;
  var result = await services.getUnsplashImages(page: page.value);
  isLoading.value=false;
  print('$result');
  if (result!=null) {
    imgList = List.from(result).map((e) => ImageModel.fromJson(e)).toList();
    for(int index=0;index<imgList.length;index++){
      allImagesList.value.add(imgList[index]);
    }
  }
}

  Future<void> getMoreImages() async {
    page.value++;
    List<ImageModel> imgList = <ImageModel>[];
    isLoadingEnd.value=true;
    var result = await services.getUnsplashImages(page: page.value);
    isLoadingEnd.value=false;
    print('$result');
    if (result!=null) {
      imgList = List.from(result).map((e) => ImageModel.fromJson(e)).toList();
      for(int index=0;index<imgList.length;index++){
        allImagesList.value.add(imgList[index]);
      }
    }
  }
}