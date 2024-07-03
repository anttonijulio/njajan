import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class UpdateDateOfBirth extends StatelessWidget {
  const UpdateDateOfBirth({
    super.key,
    required this.showDateBirthPicker,
    required this.selectedDateOfBirth,
    required this.isSelectedDateOfBirth,
  });

  final void Function()? showDateBirthPicker;
  final DateTime selectedDateOfBirth;
  final bool isSelectedDateOfBirth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tanggal Lahir',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: showDateBirthPicker,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (isSelectedDateOfBirth)
                      ? DateFormat('d MMMM yyyy', 'id')
                          .format(selectedDateOfBirth)
                      : 'Kapan tanggal lahir kamu',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                Icon(
                  Iconsax.calendar_1,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
