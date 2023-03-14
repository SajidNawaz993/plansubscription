import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plansubscription/common/save_cancel_button.dart';
import 'package:plansubscription/common/vertical_space.dart';
import '../core/config/colors.dart';
import '../features/plans/data/plans_List_model.dart';
import 'gradient_text.dart';
import 'horizontal_space.dart';

class PlansIconBox extends StatelessWidget {
  const PlansIconBox({
    super.key,
    required this.plans,
    required this.onTap,
    required this.backgroundColor,
    required this.isSelected,
    required this.isPlanDetail,
  });

  final Plans plans;
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool isSelected;
  final bool isPlanDetail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: isSelected ? AppColors.gradient1Color:Colors.transparent,
              width: 4,
            ),
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Text(
                      plans.product?.title ?? "",
                      style: TextStyle(
                          fontFamily: 'LondrinaSolid',
                          fontWeight: FontWeight.w900,
                          fontSize: 24
                      ),
                    ),),
                    ((plans.product?.isPro ?? false) && !(plans.product?.isPopular ?? false)) ? Container(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.only(left: 5,right: 5),
                        width: 30,
                        height: 30,
                        decoration: new BoxDecoration(
                          color: Color(0xFFFECEB7),
                          shape: BoxShape.circle,
                        ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/star_pro.png"),
                      ),
                    ): Container(),
                    HorizontalSpace(10),
                    Row(
                      children: [
                        GradientText(
                          "${NumberFormat.simpleCurrency(
                            name: plans.product?.currencyCode ?? "", //currencyCode
                          ).format(plans.product?.price ?? 0)}",
                          style: TextStyle(
                            fontFamily: 'LondrinaSolid',
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                          gradient: LinearGradient(colors: [
                            AppColors.gradient1Color, AppColors.gradient2Color
                          ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        HorizontalSpace(5),
                        Text(
                          "/month",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                VerticalSpace(10),
                Text(
                  plans.product?.description ?? "",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                  ),
                ),
                VerticalSpace(10),
                Padding(padding: EdgeInsets.only(right: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int index = 0; index<(plans.product?.benefits?.length ?? 0);index++)...[
                        Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 6),
                                width: 7,
                                height: 7,
                                decoration: new BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      AppColors.gradient1Color, AppColors.gradient2Color
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                )),
                            Padding(padding: EdgeInsets.only(left: 12,right: 20),
                              child: Text(
                                plans.product!.benefits![index],
                                style: TextStyle(
                                    fontFamily: 'LondrinaSolid',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                              ),)
                          ],
                        )
                      ],
                    ],
                  ),),
                ),
                if(isPlanDetail)
                  VerticalSpace(20),
                if(isPlanDetail)
                  SaveCancelButton(
                    title: "Upgrade",
                    isSelected: true,
                    onTap: () {

                    },
                    width: 80,
                    height: 40,
                    style: TextStyle(
                        fontFamily: 'LondrinaSolid',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing:0.04
                    ),
                  ),
                VerticalSpace(10),
              ],
            ),
            ((plans.product?.isPro ?? false) && !(plans.product?.isPopular ?? false)) ?
            Positioned(
                bottom: 0,
                right:0,
                child: Transform.translate(
                  offset: const Offset(30, 30),
                  child: Image(
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/pro_bg.png"),
                  ),
                )
            ):Container(),
            ((plans.product?.isPro ?? false) && !(plans.product?.isPopular ?? false)) ?
            Positioned(
                bottom: 0,
                right:0,
                child: Transform.translate(offset: const Offset(8, 5),
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(310 / 360),
                    child: new Text(
                      "Pro",
                      style: TextStyle(
                        fontFamily: 'LondrinaSolid',
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),)
            ):Container(),
            ((plans.product?.isPro ?? false) && (plans.product?.isPopular ?? false)) ?
            Positioned(
                bottom: 0,
                right:0,
                child: Transform.translate(
                  offset: const Offset(30, 30),
                  child: Image(
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/popular_bg.png"),
                  ),
                )
            ):Container(),
            ((plans.product?.isPro ?? false) && (plans.product?.isPopular ?? false)) ?
            Positioned(
                bottom: 0,
                right:0,
                child: Transform.translate(offset: const Offset(19.5, 3),
                  child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(310 / 360),
                    child: new Text(
                      "Popular",
                      style: TextStyle(
                        fontFamily: 'LondrinaSolid',
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),)
            ):Container(),
          ],
        ),
      ),
    );
  }
}
//Wrap widget for fill horizontal then vertical