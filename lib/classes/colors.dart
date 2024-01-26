import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
part 'colors.g.dart';

@collection
class Personalize {
  Id id = 0;
  @enumerated
  Brightness customBrightness = Brightness.dark;
  List<int> tdDelete = [255, 218, 64, 64];
  List<int> tdText = [255, 58, 58, 58];
  List<int> tdBGColor = [255, 11, 11, 14];
  List<int> tdTile = [255, 255, 255, 255];
  List<int> tdCheckbox = [255, 95, 82, 238];
  List<int> tdIcon = [255, 255, 255, 255];
  List<int> tdTextWithoutBackground = [255, 255, 255, 255];

  Personalize() {
    id = 0;
    customBrightness = Brightness.dark;
    tdDelete = [255, 218, 64, 64];
    tdText = [255, 58, 58, 58];
    tdBGColor = [255, 11, 11, 14];
    tdTile = [255, 255, 255, 255];
    tdCheckbox = [255, 95, 82, 238];
    tdIcon = [255, 255, 255, 255];
    tdTextWithoutBackground = [255, 255, 255, 255];
  }
}
