import 'package:a015_fvd/global/global_firebase.dart';
import 'package:a015_fvd/screen/screen_inner/inner_screen_product_detail_view/inner_screen_product_detail_view_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductThumbnail extends StatefulWidget {
  String name;
  String ID;
  Map<dynamic, dynamic> data;
  static String finalURL;

  ProductThumbnail({this.name, this.ID, this.data});

  @override
  State<ProductThumbnail> createState() => _ProductThumbnailState();
}

class _ProductThumbnailState extends State<ProductThumbnail> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.h),
        onTap: () async {
          String source = await FireStoreService.loadImage(context, widget.ID);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailViewBody(
                name: widget.name,
                source: source,
                data: widget.data,
                ID: widget.ID,
              ),
            ),
          );
        },
        child: Container(
          width: 140.h,
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              FutureBuilder(
                future: _getImage(context, widget.ID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    print(snapshot.connectionState);
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h)),
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    print(snapshot.connectionState);
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h)),
                      child: snapshot.data,
                    );
                  } else if (snapshot.hasError) {
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Image.asset("assets/no_image.jpg"),
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "${widget.name}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15.sp,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> _getImage(BuildContext context, String imageName) async {
    ImageProvider image;

    await FireStoreService.loadImage(context, imageName).then((value) {
      image = NetworkImage(
        value.toString(),
      );
    });
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FadeInImage(
          image: image,
          placeholder: AssetImage("assets/images/no_image.jpg"),
          fit: BoxFit.cover),
    );
  }
}