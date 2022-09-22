import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/src/plan_detail/plan_detail_screen.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/expandable_container.dart';

class MealPlanScreen extends StatefulWidget {
  static const String routeName = '/meal-plan';

  const MealPlanScreen({super.key});

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<String> dayList = ['Day 01', 'Day 02', 'Day 03', 'Day 04', 'Day 05', 'Day 06', 'Day 07'];

  bool expand = false;

  String? tapped;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Meal Plan', style: kTitleStyle),
                  const Text('Select Your Meal Plan'),
                ],
              ),
              Image.asset('assets/images/meal.png'),
            ],
          ),
          const SizedBox(height: 24.0),
          _buildSelectMealView(),
          const SizedBox(height: 18.0),
          _buildSelectWeekView(),
          const SizedBox(height: 18.0),
          ...dayList
              .map(
                (e) => InkWell(
                  onTap: () {},
                  child: expandableListView(
                    e,
                    e == tapped ? expand : false,
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }

  Widget _buildSelectMealView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownSearch<String>(
        popupProps: const PopupProps.menu(fit: FlexFit.loose),
        items: const ["Based on Weight", "Based on Height", 'Based on Meditation'],
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            // labelText: "Menu mode",
            // hintText: "country in menu mode",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        onChanged: print,
        selectedItem: "Based on Weight",
      ),
    );
  }

  Widget _buildSelectWeekView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownSearch<String>(
        popupProps: const PopupProps.menu(fit: FlexFit.loose),
        items: const ["Week 1", "Week 2", 'Week 3', 'Week 4', 'Week 5', 'Week 6'],
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            // filled: true,
            // fillColor: kPrimaryColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        onChanged: print,
        selectedItem: "Week 1",
      ),
    );
  }

  Widget expandableListView(String title, bool isExpanded) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                /// XOR operand returns when either or both conditions are true
                /// `tapped == null` on initial app start, [tapped] is null
                /// `index == tapped` initiate action only on tapped item
                /// `!expand` should check previous expand action
                expand = ((tapped == null) || ((title == tapped) || !expand)) ? !expand : expand;

                /// This tracks which index was tapped
                tapped = title;
                debugPrint('current expand state: $expand');
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(kBorderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          ExpandableContainer(
              expanded: isExpanded,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(
                          PlanDetailScreen.routeName,
                          arguments: {
                            'title': 'Breakfast',
                          },
                        );
                      },
                      leading: ClipRRect(
                        child: Image.asset('assets/images/breakfast.png'),
                      ),
                      title: const Text('Break Fast'),
                      subtitle: const Text('Tropical Green Smoothie'),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(
                          PlanDetailScreen.routeName,
                          arguments: {
                            'title': 'Lunch',
                          },
                        );
                      },
                      leading: ClipRRect(
                        child: Image.asset('assets/images/lunch.png'),
                      ),
                      title: const Text('Lunch'),
                      subtitle: const Text('Tropical Chicken Breast'),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(kBorderRadius),
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(
                          PlanDetailScreen.routeName,
                          arguments: {
                            'title': 'Dinner',
                          },
                        );
                      },
                      leading: ClipRRect(
                        child: Image.asset('assets/images/dinner.png'),
                      ),
                      title: const Text('Dinner'),
                      subtitle: const Text('Liberato Chicken Breast'),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
