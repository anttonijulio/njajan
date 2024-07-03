import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class UpdateGender extends StatelessWidget {
  const UpdateGender({
    super.key,
    required this.showGenderPicker,
    required this.selectedGender,
  });

  final void Function()? showGenderPicker;
  final String selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jenis Kelamin',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: showGenderPicker,
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
                  (selectedGender.isEmpty)
                      ? 'Pilih jenis kelamin kamu'
                      : selectedGender,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                Icon(
                  Iconsax.arrow_down_1,
                  color: Colors.grey.shade600,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
