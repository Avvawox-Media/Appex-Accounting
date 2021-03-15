import 'package:meta/meta.dart';

class FieldValidator {
  final bool validate;
  final String title;
  final String message;

  FieldValidator({@required this.validate, this.title, this.message});
}
