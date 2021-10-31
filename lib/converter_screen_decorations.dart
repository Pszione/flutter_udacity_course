import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'converter_screen.dart';

const _padding = EdgeInsets.all(kDefaultPadding);

class InputFieldGroup extends StatelessWidget {
  const InputFieldGroup({Key? key, this.categoriesIndex}) : super(key: key);

  final int? categoriesIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHalfPadding, vertical: kHalfPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // accepts numbers and calls the onChanged property on update.
          TextField(
            key: PageStorageKey<String>('pageKey4${categoriesIndex ?? -1}'),
            style: Theme.of(context).textTheme.headline4,
            minLines: 1,
            maxLines: 2,
            cursorWidth: 4,
            decoration: buildInputDecorationStyle(context, 'Value').copyWith(
              helperText: 'Keep numbers short, this is just a demo',
              focusedBorder: OutlineInputBorder(
                borderRadius: kDefaultBorderRadius,
                borderSide: const BorderSide(width: 3, color: kSecondaryColor),
              ),
              //border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            // TODO
            //onChanged: _updateInputValue,
          ),
        ],
      ),
    );
  }
}

class OutputFieldGroup extends StatelessWidget {
  const OutputFieldGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _outputEmptyText = '';

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHalfPadding, vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // clone of Input but for displaying data
          InputDecorator(
            child: Text(
              convertedValue != null && convertedValue!.isNotEmpty
                  ? convertedValue!
                  : _outputEmptyText,
              //_convertedValue,
              style: Theme.of(context).textTheme.headline4,
            ),
            decoration: buildInputDecorationStyle(context, 'Result output'),
            // TODO
            //onChanged: _updateInputValue,
          ),
          // TODO
          //_createDropdown(_toUnit!.name, _updateToConversion);
        ],
      ),
    );
  }
}

InputDecoration buildInputDecorationStyle(BuildContext context, String? label) {
  return InputDecoration(
    labelText: label,
    labelStyle: Theme.of(context).textTheme.headline4,
    //errorText: _showValidationError ? 'Invalid number entered' : null,
    border: OutlineInputBorder(
      borderRadius: kDefaultBorderRadius,
    ),
  );
}

class UnitDropdownOptions extends StatelessWidget {
  const UnitDropdownOptions(
      {Key? key, required this.currentValue, required this.onChanged})
      : super(key: key);

  final String? currentValue;
  final ValueChanged<dynamic> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: kDefaultBorderRadius,
        color: Theme.of(context).colorScheme.background, //colorScheme.onPrimary
        border: Border.all(color: Colors.grey[400]!),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Theme(
        // This sets the color of the [DropdownMenuItem]
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).colorScheme.onPrimary,
        ),
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              borderRadius: kDefaultBorderRadius,
              enableFeedback: true,
              value: currentValue,
              onChanged: onChanged,
              items: unitOptionItems,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}

// final unitWidgets = widget.units.map((Unit unit) {
//   return Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: const EdgeInsets.all(16.0),
//     child: Column(),
//   );
// }).toList();
