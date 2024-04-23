List<String> getTags(String questionTag) {
  final List<String> tags = questionTag.split(',');
  tags.removeWhere((element) => element.isEmpty || element == " ");
  return tags;
}
