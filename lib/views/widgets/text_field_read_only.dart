import 'package:fixit_admin/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextFieldReadOnly extends StatelessWidget {
  const TextFieldReadOnly({
    super.key,
    required this.name,
    this.initialValue,
  });

  final String name;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
      child: FormBuilderTextField(
        name: name.toLowerCase(),
        decoration: InputDecoration(
          labelText: name,
          border: const OutlineInputBorder(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        initialValue: initialValue,
        readOnly: true,
        validator: FormBuilderValidators.required(),
      ),
    );
  }
}
