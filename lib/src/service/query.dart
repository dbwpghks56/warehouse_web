class Queries {
  static String questionList = """
    query questionList(
      \$page: Int,
      \$perPage: Int,
      \$tag: String,
      \$source: String,
      \$title: String,
      ) {
      questionList(
        request: {page: \$page,
        perPage: \$perPage,
        tag: \$tag,
        source: \$source,
        title: \$title,}
        ) {
        total
        perPage
        currentPage
        questions {
          id
          title
          tag
          timeLimit
          memoryLimit
          level
          totalTries
          totalPerson
          successRate
          totalSuccess
          source
        }
      }
    }""";

  static String detailQuestion = """
query detailQuestion(\$id: Long!) {
  detailQuestion(id: \$id) {
    id
    title
    content
    tag
    timeLimit
    memoryLimit
    level
    averageTries
    totalTries
    totalPerson
    successRate
    totalSuccess
    source
  }
}""";
}
