import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

GalleryZoomSlides({
  List<String>?imageList,
}){

  List<String> imageListNew = [
    "https://kehu.s3.amazonaws.com/property/025d7e77-5b8c-45cd-adcf-65107a029232/IMAGE/1776626750426-51f359990923904360ced3ebe58b56f6.jpeg",
    "https://kehu.s3.amazonaws.com/property/025d7e77-5b8c-45cd-adcf-65107a029232/IMAGE/1776626705916-0bcc9e718495a722a7f1c9b925740dcb.jpg",
    "https://kehu.s3.amazonaws.com/property/025d7e77-5b8c-45cd-adcf-65107a029232/IMAGE/1776626685304-132e300c94bc2678ac3ff35bac31b562%20(1).jpg"
  ];

  return Get.to(
      galleryZoomSlides(
        //required fields
        arrayImages: imageList??imageListNew,
        //Optional fields
        zoomTheme: ZoomTheme.theme3,//.theme1, .theme2, .theme3
        selectedThumbnailColor: AppColors.secondary,
      )
  );
}