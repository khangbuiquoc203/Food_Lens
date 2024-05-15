import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_search_view.dart';
import '../models/userprofile_item_model.dart'; 
// ignore_for_file: must_be_immutable

class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(this.userprofileItemModelObj, {Key? key})
      : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;
  var textStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white, 
  );

  var textStyle1 = TextStyle(
    fontSize: 16,
    color: Colors.white, 
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 240.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 222.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgTaIXuNg2,
                      height: 222.v,
                      width: 360.h,
                      radius: BorderRadius.horizontal(
                        right: Radius.circular(0.h),
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 36.v),
                            child: Column(
                              children: [
                                _buildBlackBorderText("Hello $global_username".tr,  textStyle),
                                SizedBox(height: 4.v),
                                _buildBlackBorderText("msg_let_s_learn_more".tr,  textStyle1),
                              ],
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.img13132149334592,
                            height: 79.v,
                            width: 80.h,
                            radius: BorderRadius.circular(
                              39.h,
                            ),
                            margin: EdgeInsets.only(left: 22.h),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomSearchView(
                width: 240.h,
                controller: userprofileItemModelObj.rewindController,
                hintText: "msg_search".tr,
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBlackBorderText(String text, TextStyle style) {
    return Text(
      text,
      style: style.copyWith(
        shadows: [
          Shadow(offset: Offset(-1, -1), color: Colors.black),
          Shadow(offset: Offset(-1, 1), color: Colors.black),
          Shadow(offset: Offset(1, -1), color: Colors.black),
          Shadow(offset: Offset(1, 1), color: Colors.black),
        ]
      ),
    );
  }

}
