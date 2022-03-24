

class ColorMethod implements HexaColorConvertColor {
  @override
  static int HexaColorConverter(String ColorHex) {
    return int.parse(ColorHex.replaceAll('#', '0xff'));
  }
}

class HexaColorConvertColor{
  static int ?HexaColorConverter(String ?colorHex){}
}
