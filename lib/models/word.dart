abstract class Word {
  final int id;
  final String text;

  const Word({required this.id, required this.text});
  factory Word.fromJson(Map json) {
    switch (json["type"]) {
      case "word":
        return NormalWord.fromJson(json);
      case "end":
        return EndWord.fromJson(json);
      default:
        throw Exception("word type isn't word or end");
    }
  }
}

class NormalWord extends Word {
  final String codeV1;
  const NormalWord({
    required super.id,
    required super.text,
    required this.codeV1,
  });
  factory NormalWord.fromJson(Map json) {
    return NormalWord(
      codeV1: json["c_v1"],
      id: json["id"],
      text: json["text"],
    );
  }
}

class EndWord extends Word {
  final String codeV1;
  const EndWord({
    required super.id,
    required super.text,
    required this.codeV1,
  });
  factory EndWord.fromJson(Map json) {
    return EndWord(
      id: json["id"],
      text: json["text"],
      codeV1: json["c_v1"],
    );
  }
}
