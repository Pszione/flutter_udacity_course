import 'package:flutter/material.dart';
import 'package:flutter_udacity_course/constants.dart';
import 'package:flutter_udacity_course/unit.dart';

const _padding = EdgeInsets.all(kDefaultPadding);

Unit? _fromUnit, _toUnit;
List<DropdownMenuItem>? _unitMenuItems;
double? _inputValue;
String _convertedValue = '';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen(
      {Key? key, this.unitName, this.unitColor, required this.units})
      : super(key: key);

  final String? unitName;
  final Color? unitColor;
  final List<Unit> units;

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  bool _showValidationErrorMessage = false;

  @override
  initState() {
    super.initState();
    _setDefaults();
    // _createDropdownMenuItems();
  }

  // TODO: colorSwatch
  late ColorSwatch colorSwatch = ColorSwatch(widget.unitColor!.hashCode, const {
    50: Color(0xFF579186),
    100: Color(0xFF0ABC9B),
    150: Color(0xFF20877E),
    200: Color(0xFF20877E)
  });

  void _setDefaults() {
    setState(() {
      _fromUnit = widget.units[0];
      _toUnit = widget.units[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: widget.unitName,
        color: widget.unitColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        // Un focus keyboard/textfield
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.translucent,
          excludeFromSemantics: true,
          //
          child: Column(
            children: const [
              // inputGroup,
              InputFieldGroup(),
              // arrows
              RotatedBox(
                quarterTurns: 1,
                child: Icon(
                  Icons.compare_arrows,
                  size: 55.0,
                ),
              ),
              // outputGroup,
              OutputFieldGroup(),
            ],
          ),
        ),
      ),
    );
  }

  /// LinQ
  Unit? _findUnit(String unitName) =>
      widget.units.firstWhere((unit) => unit.name == unitName);

  /// Creates fresh list of [DropdownMenuItem] widgets, given a list of [Unit]s.
  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.units) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Text(
          unit.name!,
          softWrap: true,
        ),
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }
}

class InputFieldGroup extends StatelessWidget {
  const InputFieldGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHalfPadding, vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // accepts numbers and calls the onChanged property on update.
          TextField(
            style: Theme.of(context).textTheme.headline4,
            decoration: InputDecoration(
              labelText: 'Input',
              labelStyle: Theme.of(context).textTheme.headline4,
              //errorText: _showValidationError ? 'Invalid number entered' : null,
              border: OutlineInputBorder(borderRadius: kDefaultBorderRadius),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHalfPadding, vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // clone of Input but for displaying data
          InputDecorator(
            child: Text(
              '1234',
              //_convertedValue,
              style: Theme.of(context).textTheme.headline4,
            ),
            decoration: InputDecoration(
              labelText: 'Output',
              labelStyle: Theme.of(context).textTheme.headline4,
              //errorText: _showValidationError ? 'Invalid number entered' : null,
              border: OutlineInputBorder(borderRadius: kDefaultBorderRadius),
            ),
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

// final unitWidgets = widget.units.map((Unit unit) {
//   return Container(
//     margin: const EdgeInsets.all(8.0),
//     padding: const EdgeInsets.all(16.0),
//     child: Column(),
//   );
// }).toList();
