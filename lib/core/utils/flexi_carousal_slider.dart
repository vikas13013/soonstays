// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
// import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';
// import 'package:soonstays/core/constants/app_colors.dart';
//
// class FlexiCarosalSlider extends StatefulWidget {
//   const FlexiCarosalSlider({super.key, required this.ImageList});
//
//   final List<String> ImageList;
//
//   @override
//   State<FlexiCarosalSlider> createState() => _FlexiCarosalSliderState();
// }
//
// class _FlexiCarosalSliderState extends State<FlexiCarosalSlider> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     log("ImageList ${widget.ImageList}");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body:  SingleChildScrollView(
//         child: Column(
//
//           children: <Widget>[
//
//             flexiProductimageSlider(
//
//               //required fields
//               arrayImages: widget.ImageList,
//
//               // optional fields
//
//               //set where you want to set your thumbnail
//               sliderStyle: SliderStyle.overSlider,//.nextToSlider
//
//               // set you slider height like 1.0,1.5,2.0 etc...
//               aspectRatio: 1.4,
//
//               //set content mode of image
//               boxFit: BoxFit.fill,
//
//               //set this if you want to set any default image index when it loads
//               selectedImagePosition: 0,
//
//               //set your thumbnail alignment in slider
//               thumbnailAlignment: ThumbnailAlignment.bottom,//.right , .bottom
//               thumbnailBorderType: ThumbnailBorderType.all,//.bottom, .all
//               thumbnailBorderWidth: 1.5,//double value
//
//               //set corner radius of your thumbnail
//               thumbnailBorderRadius: 5,
//
//               //set your thumbnail height & width
//               //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
//               thumbnailWidth: 50,
//               thumbnailHeight: 50,
//
//               //set color of current image thumbnail border
//               thumbnailBorderColor: AppColors.secondary,
//
//               //make you action when user click on image
//               onTap: (index){
//                 print("selected index : $index");
//
//                 //for zooming effect on click
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
//                     galleryZoomSlides(
//
//                       //required fields
//                       arrayImages: widget.ImageList,
//
//                       //Optional fields
//                       zoomTheme: ZoomTheme.theme3,//.theme1, .theme2, .theme3
//                       selectedImagePosition: index,
//                       selectedThumbnailColor: AppColors.secondary,
//                     )
//                 )
//                 );
//
//               },
//             ),
//
//
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }