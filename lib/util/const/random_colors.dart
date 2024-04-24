import 'package:flutter_randomcolor/flutter_randomcolor.dart';

Options options = Options(
    format: Format.rgb,
    luminosity: Luminosity.bright,
    colorType: [ColorType.blue, ColorType.green]);

var color = RandomColor.getColor(options);
