import 'package:flutter/material.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
  });
//
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          _customRadioButton,
        ],
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color.fromARGB(74, 5, 9, 250) : Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected
              ? const Color.fromARGB(255, 8, 1, 1)
              : const Color(0xff0F172A),
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
