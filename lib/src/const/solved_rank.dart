import 'package:warehouse_web/src/model/question.dart';

List<String> rankLevel = [
  'Unrated',
  'Bronze V',
  'Bronze IV',
  'Bronze III',
  'Bronze II',
  'Bronze I',
  'Silver V',
  'Silver IV',
  'Silver III',
  'Silver II',
  'Silver I',
  'Gold V',
  'Gold IV',
  'Gold III',
  'Gold II',
  'Gold I',
  'Platinum V',
  'Platinum IV',
  'Platinum III',
  'Platinum II',
  'Platinum I',
  'Diamond V',
  'Diamond IV',
  'Diamond III',
  'Diamond II',
  'Diamond I',
  'Ruby V',
  'Ruby IV',
  'Ruby III',
  'Ruby II',
  'Ruby I'
];

String getRank(Question question) {
  if (question.source == "solved.ac") {
    return rankLevel[question.level!];
  } else if (question.source == "leetcode") {
    switch (question.level) {
      case 1:
        return "Easy";
        break;
      case 2:
        return "Medium";
        break;
      case 3:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  } else {
    return "Level ${question.level}";
  }
}
