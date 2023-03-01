import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plansubscription/common/horizontal_space.dart';
import 'package:plansubscription/common/save_cancel_button.dart';
import 'package:plansubscription/common/vertical_space.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/plans_box.dart';
import '../../common/small_button.dart';
import '../../core/config/colors.dart';
import '../../core/helper/loading_screen.dart';
import '../bloc/plans_bloc.dart';
import '../data/plans_List_model.dart';

//Widget for input

class PlansWidget extends StatefulWidget {

  @override
  const PlansWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PlansWidget> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansWidget> {

  String _selectedWidgetName = "Monthly";
  PlansListModel? plansListModel;
  int _selectedPlanIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PlansBloc>().add(PerformPlansList());
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
          child: BlocListener<PlansBloc, PlansState>(
              listener: (context, state) async {
                 if (state is PlansLoading) {
                  LoadingScreen().show(
                    context: context,
                    text: 'Please wait a moment',
                  );
                } else {
                  LoadingScreen().hide();
                }
                if (state is PlansLoaded) {
                  setState(() {
                    plansListModel = state.plansListModel;
                  });
                }
                if (state is PlansError) {
                  displaySnackBar(state.errorMessage);
                }
              },
        child:SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select a plan',
                  style: TextStyle(
                      fontFamily: 'LondrinaSolid',
                      fontWeight: FontWeight.w400,
                      fontSize: 26
                  ),
                ),
                 const VerticalSpace(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton(
                      title: "Annualy",
                      isSelected: _selectedWidgetName == "Annualy" ? true : false,
                      onTap: () {
                        setState(() {
                          _selectedWidgetName = "Annualy";
                        });
                      },
                    ),
                    SmallButton(
                      title: "Monthly",
                      isSelected: _selectedWidgetName == "Monthly" ? true : false,
                      onTap: () {
                        setState(() {
                          _selectedWidgetName = "Monthly";
                        });
                      },
                    ),
                  ],
                ),
                const VerticalSpace(15),
                Expanded(child: ListView.builder(
                  itemCount: plansListModel?.plans?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return PlansIconBox(
                      plans: plansListModel!.plans![index],
                      backgroundColor: AppColors.white,
                      isSelected: _selectedPlanIndex == index ? true:false,
                      onTap: () {
                        setState(() {
                          _selectedPlanIndex = index;
                        });
                      },
                    ) ;
                  },
                )),
                const VerticalSpace(10),
                Padding(padding: EdgeInsets.only(left: 30,right: 30,),
                  child:InkWell(
                      child: Column(
                        children: [
                          Text(
                            "Don't forget to add your subscription terms and conditions. Read more about this here:",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "https://www.google.com",
                            style: TextStyle(
                              color: AppColors.linktextBlacColor,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      onTap: () => launch('http://google.com/')
                  ),),
                const VerticalSpace(10),
               _selectedPlanIndex >= 0 ? Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SaveCancelButton(
                     title: "Cancel",
                     isSelected: false,
                     onTap: () {
                       setState(() {
                         _selectedWidgetName = "Annualy";
                       });
                     },
                   ),
                   const HorizontalSpace(10),
                   SaveCancelButton(
                     title: "Select",
                     isSelected: true,
                     onTap: () {
                       setState(() {
                         _selectedWidgetName = "Monthly";
                       });
                     },
                   ),
                 ],
               ):Container()
              ],
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
