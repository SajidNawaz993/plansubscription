import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plansubscription/common/gradient_text.dart';
import 'package:plansubscription/common/plans_details_box.dart';
import 'package:plansubscription/common/save_cancel_button.dart';
import 'package:plansubscription/common/vertical_space.dart';
import 'package:plansubscription/features/plan_detail/bloc/plans_details_bloc.dart';
import 'package:plansubscription/features/plan_detail/bloc/plans_details_state.dart';
import '../../../common/alert_view.dart';
import '../../../common/common_dropdowntext_field_view.dart';
import '../../../common/common_text_field_view.dart';
import '../../../common/gradient_icon.dart';
import '../../../core/config/app_constants.dart';
import '../../../core/config/colors.dart';
import '../../plans/data/plans_List_model.dart';
import '../../upgrade_plans/view/upgradeplans_widget.dart';
import '../bloc/plans_details_event.dart';

//Widget for input

class PlanDetailsWidget extends StatefulWidget {
  Plans? plans;
  @override
   PlanDetailsWidget({
    Key? key,
    required this.plans,
  }) : super(key: key);

  @override
  State<PlanDetailsWidget> createState() => _PlanDetailsViewState();
}

class _PlanDetailsViewState extends State<PlanDetailsWidget> {

  String _streetError = '';
  late TextEditingController _streetController;
  String _townCityError = '';
  late TextEditingController _townCityController;
  String _stateNameError = '';
  late TextEditingController _stateController;
  String _zipCodeNameError = '';
  late TextEditingController _zipCodeController;
  String _cardNbrError = '';
  late TextEditingController _cardNbrController;
  String _expDateError = '';
  late TextEditingController _expDateController;
  String _cvvError = '';
  late TextEditingController _cvvController;
  String statedropdownValue = '';

  @override
  void initState() {
    _streetController = TextEditingController();
    _townCityController = TextEditingController();
    _stateController = TextEditingController();
    _zipCodeController = TextEditingController();
    _cardNbrController = TextEditingController();
    _expDateController = TextEditingController();
    _cvvController = TextEditingController();
    super.initState();
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
          child: BlocBuilder<PlanDetailsBloc,PlanDetailsState>(
            builder: (context, state) {
              _streetController.text = state.street;
              _townCityController.text = state.townCity;
              statedropdownValue = state.state;
              _zipCodeController.text = state.zipCode;
              _cardNbrController.text = state.cardNbr;
              _expDateController.text = state.expDate;
              _cvvController.text = state.cvv;
              return SafeArea(
                child: Container(
                    padding: EdgeInsets.all(17),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child:SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            widget.plans?.product?.title ?? "",
                            style: TextStyle(
                                color: AppColors.greenTextColor,
                                fontFamily: 'LondrinaSolid',
                                fontWeight: FontWeight.w400,
                                fontSize: 26
                            ),
                          ),),
                          const VerticalSpace(25),
                          PlansDetailsIconBox(
                            plans: widget.plans!,
                            backgroundColor: AppColors.white,
                            isSelected: true,
                            onTap: () {

                            },
                          ),
                          const VerticalSpace(30),
                          Text(
                            "Address",
                            style: TextStyle(
                                color: AppColors.plantextBlacColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 16
                            ),
                          ),
                          const VerticalSpace(10),
                          Flexible(child: Text.rich(
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Learn More ',
                                    recognizer: new TapGestureRecognizer()..onTap = () {
                                      var dialog = CustomAlertDialog(
                                        title: "How we use your address",
                                        message: "Why do you need my address?",
                                        secmessage: "\nWe need this information to comply with applicable laws in the U.S, like determining the amount of sales tax that we collect based on the guidelines in your state.To learn more about how Spotify processes your personal data, please see Spotify's",
                                        onPostivePressed: () {},
                                        positiveBtnText: 'Ok',
                                      );
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) => dialog);
                                    },
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    )),
                                TextSpan(
                                    text: 'Learn More about why we need this information..',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    )), // can add more TextSpans here...
                              ],
                            ),
                          )),
                          const VerticalSpace(smallSpace),
                          CommonTextFieldView(
                            controller: _streetController,
                            errorText: _streetError,
                            hintText: "Street",
                            keyboardType: TextInputType.text,
                            onChanged: (String txt) {
                              context.read<PlanDetailsBloc>().state.street = txt;
                              if(txt.isNotEmpty && _streetError.isNotEmpty) {
                                setState(() {
                                  _streetError = "";
                                });
                              }
                            },
                          ),
                          const VerticalSpace(smallSpace),
                          CommonTextFieldView(
                            controller: _townCityController,
                            errorText: _townCityError,
                            hintText: "Town/City",
                            keyboardType: TextInputType.text,
                            onChanged: (String txt) {
                              context.read<PlanDetailsBloc>().state.townCity = txt;
                              if(txt.isNotEmpty && _townCityError.isNotEmpty) {
                                setState(() {
                                  _townCityError = "";
                                });
                              }
                            },
                          ),
                          const VerticalSpace(smallSpace),
                          CommonDropdownButtonFormFieldView(
                            valueText: statedropdownValue,
                            errorText: _stateNameError,
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.gradient2Color,
                            ),
                            hintText: "State",
                            onChanged: (String? txt) {
                              statedropdownValue = txt ?? "";
                              context.read<PlanDetailsBloc>().state.state = statedropdownValue;
                              if(statedropdownValue.isNotEmpty && _stateNameError.isNotEmpty) {
                                setState(() {
                                  _stateNameError = "";
                                });
                              }
                            },
                          ),
                          const VerticalSpace(smallSpace),
                          CommonTextFieldView(
                            controller: _zipCodeController,
                            errorText: _zipCodeNameError,
                            hintText: "ZIP code",
                            keyboardType: TextInputType.text,
                            onChanged: (String txt) {
                              context.read<PlanDetailsBloc>().state.zipCode = txt;
                              if(txt.isNotEmpty && _zipCodeNameError.isNotEmpty) {
                                setState(() {
                                  _zipCodeNameError = "";
                                });
                              }
                            },
                          ),
                          const VerticalSpace(30),
                          Text(
                            "Add card",
                            style: TextStyle(
                                fontFamily: 'LondrinaSolid',
                                fontWeight: FontWeight.w400,
                                fontSize: 26
                            ),
                          ),
                          const VerticalSpace(largeSpace),
                          CommonTextFieldView(
                            labelText: "Card number",
                            controller: _cardNbrController,
                            errorText: _cardNbrError,
                            prefixIcon: const Icon(
                              Icons.credit_card,
                            ),
                            hintText: "",
                            keyboardType: TextInputType.text,
                            onChanged: (String txt) {
                              context.read<PlanDetailsBloc>().state.cardNbr = txt;
                              if(txt.isNotEmpty && _cardNbrError.isNotEmpty) {
                                setState(() {
                                  _cardNbrError = "";
                                });
                              }
                            },
                          ),
                          const VerticalSpace(smallSpace),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 25,
                                child:  CommonTextFieldView(
                                  labelText: "Exp date",
                                  controller: _expDateController,
                                  errorText: _expDateError,
                                  hintText: "DD.MM.YYYY",
                                  keyboardType: TextInputType.text,
                                  onChanged: (String txt) {
                                    context.read<PlanDetailsBloc>().state.expDate = txt;
                                    if(txt.isNotEmpty && _expDateError.isNotEmpty) {
                                      setState(() {
                                        _expDateError = "";
                                      });
                                    }
                                  },
                                ),),
                              Container(
                                width: MediaQuery.of(context).size.width/2 - 25,
                                child:  CommonTextFieldView(
                                  labelText: "CVV",
                                  controller: _cvvController,
                                  errorText: _cvvError,
                                  hintText: "000",
                                  keyboardType: TextInputType.text,
                                  onChanged: (String txt) {
                                    context.read<PlanDetailsBloc>().state.cvv = txt;
                                    if(txt.isNotEmpty && _cvvError.isNotEmpty) {
                                      setState(() {
                                        _cvvError = "";
                                      });
                                    }
                                  },
                                ),),
                            ],
                          ),
                          const VerticalSpace(50),
                          SaveCancelButton(
                            title: "Sign Up",
                            isSelected: true,
                            onTap: () {
                              if(_streetController.text.toString().isEmpty)
                              {
                                setState(() {
                                  _streetError = "Street is required.";
                                });
                              } else if(_townCityController.text.toString().isEmpty)
                              {
                                setState(() {
                                  _townCityError = "Town/City is required.";
                                });
                              } else if(statedropdownValue.isEmpty)
                              {
                                setState(() {
                                  _stateNameError = "State is required.";
                                });
                              } else if(_zipCodeController.text.toString().isEmpty)
                              {
                                setState(() {
                                  _zipCodeNameError = "Zip code is required.";
                                });
                              } else if(_cardNbrController.text.toString().isEmpty)
                              {
                                setState(() {
                                  _cardNbrError = "Card number is required.";
                                });
                              } else if(_expDateController.text.toString().isEmpty)
                              {
                                setState(() {
                                  _expDateError = "Exp date is required.";
                                });
                              } else if(_cvvController.text.toString().isEmpty)
                              {
                                setState(() {
                                  _cvvError = "CVV is required.";
                                });
                              }else{
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  UpgradePlansWidget(plans: widget.plans,)),
                                );
                              }
                            },
                            width: MediaQuery.of(context).size.width,
                          ),
                          const VerticalSpace(smallSpace),
                          Center(child: InkWell(
                            onTap: (){

                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Color(0xFF16003D).withAlpha(40),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14
                              ),
                            ),
                          ),)
                        ],
                      ),
                    )),
              );
            },
          ),
         ));
  }

}