import 'package:flutter/material.dart';
import 'package:warehouse_web/src/model/question.dart';

List<Text> rankLevel = [
  const Text(
    'Unrated',
    style: TextStyle(
      color: Color(0xFF89D3FB),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Bronze V',
    style: TextStyle(
      color: Color(0xFFDAA520),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Bronze IV',
    style: TextStyle(
      color: Color(0xFFDAA520),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Bronze III',
    style: TextStyle(
      color: Color(0xFFDAA520),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Bronze II',
    style: TextStyle(
      color: Color(0xFFDAA520),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Bronze I',
    style: TextStyle(
      color: Color(0xFFDAA520),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Silver V',
    style: TextStyle(
      color: Color(0xFFC0C0C0),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Silver IV',
    style: TextStyle(
      color: Color(0xFFC0C0C0),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Silver III',
    style: TextStyle(
      color: Color(0xFFC0C0C0),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Silver II',
    style: TextStyle(
      color: Color(0xFFC0C0C0),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Silver I',
    style: TextStyle(
      color: Color(0xFFC0C0C0),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Gold V',
    style: TextStyle(
      color: Color(0xFFD4AF37),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Gold IV',
    style: TextStyle(
      color: Color(0xFFD4AF37),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Gold III',
    style: TextStyle(
      color: Color(0xFFD4AF37),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Gold II',
    style: TextStyle(
      color: Color(0xFFD4AF37),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Gold I',
    style: TextStyle(
      color: Color(0xFFD4AF37),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Platinum V',
    style: TextStyle(
      color: Color.fromARGB(255, 159, 229, 167),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Platinum IV',
    style: TextStyle(
      color: Color.fromARGB(255, 159, 229, 167),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Platinum III',
    style: TextStyle(
      color: Color.fromARGB(255, 159, 229, 167),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Platinum II',
    style: TextStyle(
      color: Color.fromARGB(255, 159, 229, 167),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  const Text(
    'Platinum I',
    style: TextStyle(
      color: Color.fromARGB(255, 159, 229, 167),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
];

Text getRank(Question question) {
  return rankLevel[question.level!];
}
