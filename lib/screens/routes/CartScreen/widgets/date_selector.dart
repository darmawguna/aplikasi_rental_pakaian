import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final Function(DateTime startDate, DateTime endDate) onDateSelected;

  const DateSelector({Key? key, required this.onDateSelected})
    : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange:
          startDate != null && endDate != null
              ? DateTimeRange(start: startDate!, end: endDate!)
              : null,
    );

    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });

      widget.onDateSelected(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Date: ${startDate != null ? dateFormat.format(startDate!) : 'Not Selected'}',
                style: const TextStyle(color: Color(0xFF797780)),
              ),
              const SizedBox(height: 8),
              Text(
                'End Date: ${endDate != null ? dateFormat.format(endDate!) : 'Not Selected'}',
                style: const TextStyle(color: Color(0xFF797780)),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _selectDateRange,
            child: const Text('Select Dates'),
          ),
        ],
      ),
    );
  }
}
