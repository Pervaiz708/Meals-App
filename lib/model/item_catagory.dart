import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ItemsCatagory{
  ItemsCatagory({
    required this.id,
    required this.title,
    required this.color
  });

  final String id;
  final String title;
  final Color color;
}