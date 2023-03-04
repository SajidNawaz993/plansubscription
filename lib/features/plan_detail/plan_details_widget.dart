import 'package:flutter/material.dart';
import 'package:plansubscription/common/gradient_text.dart';
import 'package:plansubscription/common/plans_details_box.dart';
import 'package:plansubscription/common/save_cancel_button.dart';
import 'package:plansubscription/common/vertical_space.dart';
import '../../common/common_text_field_view.dart';
import '../../common/gradient_icon.dart';
import '../../core/config/app_constants.dart';
import '../../core/config/colors.dart';
import '../data/plans_List_model.dart';

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
          child:  SafeArea(
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
                      const VerticalSpace(10),
                      Text(
                        "Address",
                        style: TextStyle(
                            color: AppColors.plantextBlacColor,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                      ),
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
                        onChanged: (String txt) {},
                      ),
                      const VerticalSpace(smallSpace),
                      CommonTextFieldView(
                        controller: _townCityController,
                        errorText: _townCityError,
                        hintText: "Town/City",
                        keyboardType: TextInputType.text,
                        onChanged: (String txt) {},
                      ),
                      const VerticalSpace(smallSpace),
                      CommonTextFieldView(
                        controller: _stateController,
                        errorText: _stateNameError,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.gradient2Color,
                        ),
                        hintText: "State",
                        keyboardType: TextInputType.text,
                        onChanged: (String txt) {},
                      ),
                      const VerticalSpace(smallSpace),
                      CommonTextFieldView(
                        controller: _zipCodeController,
                        errorText: _zipCodeNameError,
                        hintText: "ZIP code",
                        keyboardType: TextInputType.text,
                        onChanged: (String txt) {},
                      ),
                      const VerticalSpace(mediumSpace),
                      Text(
                        "Add card",
                        style: TextStyle(
                            fontFamily: 'LondrinaSolid',
                            fontWeight: FontWeight.w400,
                            fontSize: 26
                        ),
                      ),
                      const VerticalSpace(smallSpace),
                      CommonTextFieldView(
                        labelText: "Card number",
                        controller: _cardNbrController,
                        errorText: _cardNbrError,
                        prefixIcon: const Icon(
                          Icons.credit_card,
                        ),
                        hintText: "",
                        keyboardType: TextInputType.text,
                        onChanged: (String txt) {},
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
                              onChanged: (String txt) {},
                            ),),
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 25,
                            child:  CommonTextFieldView(
                              labelText: "CVV",
                              controller: _cvvController,
                              errorText: _cvvError,
                              hintText: "000",
                              keyboardType: TextInputType.text,
                              onChanged: (String txt) {},
                            ),),
                        ],
                      ),
                      const VerticalSpace(largeSpace),
                      SaveCancelButton(
                        title: "Sign Up",
                        isSelected: true,
                        onTap: () {

                        },
                        width: MediaQuery.of(context).size.width,
                      ),
                      const VerticalSpace(smallSpace),
                      Center(child: InkWell(
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
          )));
  }

}
