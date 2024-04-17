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
}
