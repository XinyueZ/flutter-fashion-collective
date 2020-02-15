import 'dart:convert';

class DecoderHelper {
  static const Utf8Decoder utf8Decoder = Utf8Decoder();
  static const JsonDecoder jsonDecoder = JsonDecoder();

  static Utf8Decoder getUtf8Decoder() => utf8Decoder;

  static JsonDecoder getJsonDecoder() => jsonDecoder;
}
