import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plansubscription/common/vertical_space.dart';
import '../core/config/colors.dart';
import '../features/plans/data/plans_List_model.dart';
import 'gradient_text.dart';
import 'horizontal_space.dart';

class PlansDetailsIconBox extends StatelessWidget {
   PlansDetailsIconBox({
    super.key,
    required this.plans,
    required this.onTap,
    required this.backgroundColor,
    required this.isSelected,
  });

  final Plans plans;
  final VoidCallback onTap;
  final Color backgroundColor;
  final bool isSelected;

   var today = DateTime.now();


  @override
  Widget build(BuildContext context) {
    var newDate = new DateTime(today.year, today.month + 1, today.day);
    return InkWell(
      onTap: onTap,
      child: Container(
       // margin: const EdgeInsets.all(10.0),
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
                          color: AppColors.greenTextColor,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int index = 0; index<(plans.product?.benefits?.length ?? 0);index++)...[
                      Padding(padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            width: 20,
                            height: 20,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/tick_green.png"),
                          ),
                          HorizontalSpace(5),
                          Flexible(child: Text(
                            plans.product!.benefits![index],
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                          ),)
                        ],
                      ),)
                    ],
                  ],
                ),
                VerticalSpace(10),
                Container(
                  color: AppColors.gradient2Color,
                  width: MediaQuery.of(context).size.width - 20,
                  height: 1,
                ),
                Container(margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                    "Start free month",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30),child: Text(
                    "Today",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                    ),
                  ),)
                ],),),
                Container(margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start billing date",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      ),
                      Text(
                        "${format(newDate)}",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                        ),
                      )
                    ],),),

                Container(padding: EdgeInsets.only(left: 30,right: 30,top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    "\u2022",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 10
                    ),
                  ),
                  HorizontalSpace(5),
                  Flexible(child: Text(
                    "Only ${NumberFormat.simpleCurrency(
                      name: plans.product?.currencyCode ?? "", //currencyCode
                    ).format(plans.product?.price ?? 0)} + tax/month after 1 month trial",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 10
                    ),
                  ))
                ],),),
                Container(padding: EdgeInsets.only(left: 30,right: 30,top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u2022",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                        ),
                      ),
                      HorizontalSpace(5),
                      Flexible(child: Text(
                        "You won’t be charged until ${format(newDate)}.",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                        ),
                      ))
                    ],),),
                Container(padding: EdgeInsets.only(left: 30,right: 30,top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\u2022",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 10
                        ),
                      ),
                      HorizontalSpace(5),
                      Flexible(child: Text.rich(
                        TextSpan(
                          text: 'Cancel anytime ',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 10
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Offer terms',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                )),
                            TextSpan(
                                text: ' apply.',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10
                                )), // can add more TextSpans here...
                          ],
                        ),
                      ))
                    ],),)
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
   format(DateTime date) {
     var suffix = "th";
     var digit = date.day % 10;
     if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
       suffix = ["st", "nd", "rd"][digit - 1];
     }
     return new DateFormat("MMMM d'$suffix', yyyy").format(date);
   }
}
//Wrap widget for fill horizontal then vertical