class Mutations {
  static String uploadExcelAndSaveQuestions = """
    mutation uploadExcelAndSaveQuestions(
      \$excelInput:Upload!
    ) {
      uploadExcelAndSaveQuestions(
        excelInput: \$excelInput
      )
      }
""";

  static String updateQuestion = """
    mutation updateQuestion(
      \$id: Long!,
      \$request: QuestionUpdateRequestDto,
    ) {
      updateQuestion(
        id: \$id,
        request: \$request
      ) {
        id
        title
        content
        problemId
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
    }
""";
}
