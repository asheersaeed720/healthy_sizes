import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthy_sizes/utils/constants.dart';
import 'package:healthy_sizes/widgets/arrow_widget.dart';
import 'package:healthy_sizes/widgets/custom_async_btn.dart';
import 'package:healthy_sizes/widgets/screen_bg_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentScreen extends StatefulWidget {
  static const String routeName = '/appointment';

  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final kToday = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String? _value = '09:00 AM';

  List<String> timingList = ['09:00 AM', '10:00 AM', '11:30 AM'];
  // List<String> afterNoonTimingList = ['10:00 AM', '09:00 AM', '11:30 AM'];
  // List<String> eveningTimingList = ['10:00 AM', '11:30 AM', '09:00 AM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SizedBox(
              height: 700,
              child: ScreenBgWidget(isHideHeading: true),
            ),
            Positioned(
              top: 50.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                height: 600,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
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
                    _buildTitleViewWithBackArrow(),
                    const SizedBox(height: 20.0),
                    _buildDateSelectCalenderView(),
                    const SizedBox(height: 20.0),
                    Text('Timings', style: kBodyStyle),
                    const SizedBox(height: 8.0),
                    _buildTimingChipView(),
                    const SizedBox(height: 20.0),
                    CustomAsyncBtn(
                      btnTxt: 'Book Now',
                      onPress: () {},
                    ),
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
    return Row(
      children: [
        arrowWidget(
          onTap: () {
            Get.back();
          },
        ),
        const Spacer(),
        Text('Appointments', style: kBodyStyle),
        const Spacer(),
        const Text(''),
      ],
    );
  }

  Widget _buildDateSelectCalenderView() {
    final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      headerStyle: HeaderStyle(
        headerPadding: const EdgeInsets.only(bottom: 14.0),
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: kBodyStyle,
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
        leftChevronPadding: EdgeInsets.zero,
        rightChevronPadding: EdgeInsets.zero,
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: const BoxDecoration(
          color: kSecondaryColor,
          shape: BoxShape.circle,
        ),
        todayTextStyle: kBodyStyle,
      ),
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }

  Widget _buildTimingChipView() {
    return Wrap(spacing: 10.0, children: [
      ...timingList
          .map(
            (e) => ChoiceChip(
              selectedColor: kPrimaryColor,
              backgroundColor: Colors.white,
              side: BorderSide(color: _value == e ? kPrimaryColor : Colors.grey.shade800),
              label: Text(
                e,
                style: kBodyStyle.copyWith(color: _value != e ? kPrimaryColor : Colors.white),
              ),
              selected: _value == e,
              onSelected: (bool selected) {
                setState(() {
                  // _value = selected ? e : null;
                  _value = e;
                });
              },
            ),
          )
          .toList(),
    ]
        // List<Widget>.generate(
        //   3,
        //   (int index) {
        //     return ChoiceChip(
        //       label: Text('Item $index'),
        //       selected: _value == index,
        //       onSelected: (bool selected) {
        //         setState(() {
        //           _value = selected ? index : null;
        //         });
        //       },
        //     );
        //   },
        // ).toList(),
        );
  }
}
