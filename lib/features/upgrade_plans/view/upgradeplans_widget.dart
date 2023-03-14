import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:plansubscription/common/horizontal_space.dart';
import 'package:plansubscription/common/save_cancel_button.dart';
import 'package:plansubscription/common/vertical_space.dart';
import 'package:plansubscription/features/plan_detail/view/plan_details_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/gradient_icon.dart';
import '../../../common/gradient_text.dart';
import '../../../common/plans_box.dart';
import '../../../common/small_button.dart';
import '../../../core/config/colors.dart';
import '../../../core/helper/loading_screen.dart';
import '../../plans/data/plans_List_model.dart';
import '../bloc/upgradeplans_bloc.dart';

//Widget for input

class UpgradePlansWidget extends StatefulWidget {

  Plans? plans;
  @override
   UpgradePlansWidget({
    Key? key,
    required this.plans,
  }) : super(key: key);

  @override
  State<UpgradePlansWidget> createState() => _UpgradePlansViewState();
}

class _UpgradePlansViewState extends State<UpgradePlansWidget> {

  String _selectedWidgetName = "Monthly";
  PlansListModel? plansListModel;
  int _selectedPlanIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UpgradePlansBloc>().add(PerformUpgradePlansList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient:
              LinearGradient(
                  begin: Alignment(-1.0, -1),
                  end: Alignment(-1.0, 1),
                  colors: [Color(0xFFEEFAFC), Color(0xFFEFF5FB),Color(0xFFF0F1FA), Color(0xFFF8EBFF)]),
            ),
          child: BlocListener<UpgradePlansBloc, UpgradePlansState>(
              listener: (context, state) async {
                 if (state is UpgradePlansLoading) {
                  LoadingScreen().show(
                    context: context,
                    text: 'Please wait a moment',
                  );
                } else {
                  LoadingScreen().hide();
                }
                if (state is UpgradePlansLoaded) {
                  setState(() {
                    plansListModel = state.plansListModel;
                  });
                }
                if (state is UpgradePlansError) {
                  displaySnackBar(state.errorMessage);
                }
              },
        child:SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GradientIcon(Icon(Icons.arrow_back_ios),gradient: LinearGradient(colors: [
                          AppColors.gradient1Color, AppColors.gradient2Color
                        ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),),
                        GradientText('Back', style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                          gradient: LinearGradient(colors: [
                            AppColors.gradient1Color, AppColors.gradient2Color
                          ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),),
                      ],
                    ),
                  ),
                  const VerticalSpace(20),
                  Center(child: Text(
                    "Plan details",
                    style: TextStyle(
                        color: AppColors.plantextBlacColor,
                        fontFamily: 'LondrinaSolid',
                        fontWeight: FontWeight.w400,
                        fontSize: 26
                    ),
                  ),),
                  const VerticalSpace(25),
                  PlansIconBox(
                    plans: widget.plans!,
                    backgroundColor: AppColors.white,
                    isSelected: true,
                    isPlanDetail: false,
                    onTap: () {

                    },
                  ),
                  const VerticalSpace(30),
                  Align(
                    alignment: Alignment.topLeft,
                    child:Padding(padding: EdgeInsets.only(left: 10),
                      child:  Text(
                        "Plan usage",
                        style: TextStyle(
                            color: AppColors.plantextBlacColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [
                              Text(
                                "Conferences",
                                style: TextStyle(
                                    color: AppColors.plantextBlacColor,
                                    fontFamily: 'LondrinaSolid',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                              ),
                              Divider(height: 5,color: Colors.transparent,),
                              CircularPercentIndicator(
                                radius: 44.0,
                                lineWidth: 8.0,
                                animation: true,
                                percent: 4/5,
                                center: GradientText(
                                  "4/5",
                                  style: TextStyle(
                                      fontFamily: 'LondrinaSolid',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      letterSpacing: 0.4
                                  ),
                                  gradient: LinearGradient(colors: [
                                    AppColors.gradient1Color, AppColors.gradient2Color
                                  ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                footer: Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    "1 conference left",
                                    style:TextStyle(
                                        color: AppColors.progressbottomColor,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10
                                    ),
                                  ),
                                ),
                                linearGradient: LinearGradient(colors: [
                                  AppColors.gradient1Color,AppColors.gradient2Color
                                ],
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: AppColors.nonProgressColor,
                                //  progressColor: AppColors.nonProgressColor,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 1,child: Container(
                          height: 150,
                          width: 1,
                          color: AppColors.tabUnselectTextColor,
                        ),),
                        Padding(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            children: [
                              Text(
                                "Sessions",
                                style: TextStyle(
                                    color: AppColors.plantextBlacColor,
                                    fontFamily: 'LondrinaSolid',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14
                                ),
                              ),
                              Divider(height: 5,color: Colors.transparent,),
                              CircularPercentIndicator(
                                radius: 44.0,
                                lineWidth: 8.0,
                                animation: true,
                                percent: 12/15,
                                center: GradientText(
                                  "12/15",
                                  style: TextStyle(
                                      fontFamily: 'LondrinaSolid',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      letterSpacing: 0.4
                                  ),
                                  gradient: LinearGradient(colors: [
                                    AppColors.gradient1Color, AppColors.gradient2Color
                                  ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                footer: Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    "3 Sessions left",
                                    style:TextStyle(
                                        color: AppColors.progressbottomColor,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10
                                    ),
                                  ),
                                ),
                                linearGradient: LinearGradient(colors: [
                                  AppColors.gradient1Color,AppColors.gradient2Color
                                ],
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: AppColors.nonProgressColor,
                                //  progressColor: AppColors.nonProgressColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalSpace(30),
                  Align(
                    alignment: Alignment.topLeft,
                    child:Padding(padding: EdgeInsets.only(left: 10),
                      child:  Text(
                        "Change plan options",
                        style: TextStyle(
                            color: AppColors.plantextBlacColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 12
                        ),
                      ),),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: plansListModel?.plans?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return PlansIconBox(
                        plans: plansListModel!.plans![index],
                        backgroundColor: AppColors.white,
                        isSelected: _selectedPlanIndex == index ? true:false,
                        isPlanDetail: true,
                        onTap: () {
                          setState(() {
                            _selectedPlanIndex = index;
                          });
                        },
                      ) ;
                    },
                  ),
                  const VerticalSpace(10),
                ],
              ),
            ),
          ),
        )),
        ));
  }

  void displaySnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white, fontSize: 16.0,),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

}
