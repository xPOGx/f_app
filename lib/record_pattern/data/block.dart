sealed class Block {
  Block();

  factory Block.fromJson(Map<String, Object?> json) {
    return switch (json) {
      {'type': 'h1', 'text': String text} => HeaderBlock(text),
      {'type': 'p', 'text': String text} => ParagraphBlock(text),
      {'type': 'checkbox', 'text': String text, 'checked': bool checked} =>
        CheckboxBlock(text, checked),
      _ => throw const FormatException('Unexpected JSON format'),
    };
  }
}

class HeaderBlock extends Block {
  final String text;
  HeaderBlock(this.text);
}

class ParagraphBlock extends Block {
  final String text;
  ParagraphBlock(this.text);
}

class CheckboxBlock extends Block {
  final String text;
  final bool isChecked;
  CheckboxBlock(this.text, this.isChecked);
}
