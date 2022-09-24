import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/arrow_widget.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/custom_input_field.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = '/payment';

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isCheck = false;

  final _cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 830,
              child: ScreenBgWidget(isHideHeading: true),
            ),
            Positioned(
              top: 50.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                height: 730,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24.0),
                    _buildTitleViewWithBackArrow(),
                    // const SizedBox(height: 16.0),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text('Select Card', style: kBodyStyle),
                    //       arrowWidget(
                    //         icon: const Icon(Icons.add, size: 18.0, color: Colors.white),
                    //         onTap: () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    _buildSliderView(),
                    const SizedBox(height: 16.0),
                    _buildAddCardFormView(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleViewWithBackArrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          arrowWidget(
            onTap: () {
              Get.back();
            },
          ),
          const Spacer(),
          Text('Payment Method', style: kBodyStyle),
          const Spacer(),
          const Text(''),
        ],
      ),
    );
  }

  Widget _buildSliderView() {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [1, 2, 3, 4, 5].map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage('assets/images/credit_card.png'),
                  ),
                ),
                // child: Text(
                //   'text $i',
                //   style: const TextStyle(fontSize: 16.0),
                // ),
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget _buildAddCardFormView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Add Card Detail",
              style: kBodyStyle.copyWith(fontSize: 18.0),
            ),
            const SizedBox(height: 18.0),
            CustomInputField(
              hintText: 'Card Name',
              controller: _cardNameController,
              prefixIcon: const Icon(Icons.card_membership_rounded),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 18.0),
            CustomInputField(
              hintText: 'Card Number',
              controller: _cardNameController,
              prefixIcon: const Icon(Icons.numbers),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 18.0),
            FormBuilderDateTimePicker(
              name: 'date',
              decoration: const InputDecoration(
                hintText: 'Expiry Date',
                hintStyle: TextStyle(fontSize: 14.0),
                prefixIcon: Icon(Icons.date_range),
              ),
              inputType: InputType.date,
              validator: (value) {
                if (value == null) {
                  return 'Required';
                }
                return null;
              },
            ),
            const SizedBox(height: 18.0),
            CustomInputField(
              hintText: 'CVV',
              controller: _cardNameController,
              prefixIcon: const Icon(Icons.numbers),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 18.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: isCheck
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      child: const Icon(Icons.check_box, color: kPrimaryColor),
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      child: const Icon(Icons.check_box_outline_blank),
                    ),
              title: RichText(
                text: TextSpan(
                  text: 'I agree to the ',
                  style: kBodyStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms and Conditions',
                      style: kBodyStyle.copyWith(
                        // fontSize: 10.0,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            CustomAsyncBtn(
              width: MediaQuery.of(context).size.width * 0.8,
              btnTxt: 'Pay Now',
              onPress: () {
                // if (_formKey.currentState!.validate()) {
                //   _formKey.currentState!.save();
                //   FocusScopeNode currentFocus = FocusScope.of(context);
                //   if (!currentFocus.hasPrimaryFocus) {
                //     currentFocus.unfocus();
                //   }
                //   if (isCheck) {
                //   } else {
                //     displayToastMessage('Check Privacy policy');
                //   }
                // }
                Get.defaultDialog(
                  titlePadding: const EdgeInsets.only(top: 20.0),
                  contentPadding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  title: 'Payment Done!',
                  middleText: 'You have purchased your Diet Plan Successfully.',
                  backgroundColor: Colors.black45,
                  titleStyle: kBodyStyle.copyWith(color: Colors.white),
                  middleTextStyle: const TextStyle(color: Colors.white),
                  buttonColor: Colors.transparent,
                  // cancel: Text(
                  //   'Done',
                  //   style: kBodyStyle.copyWith(
                  //     color: Colors.white,
                  //   ),
                  // ),
                  textCancel: 'Done',
                  cancelTextColor: Colors.white,
                  onCancel: () {
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
