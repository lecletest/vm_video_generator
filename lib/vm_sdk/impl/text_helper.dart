import 'dart:io';

import '../types/types.dart';
import 'resource_fetch_helper.dart';
import 'global_helper.dart';
import 'dart:convert';

const Map<ETextID, String> _textMap = {
  ETextID.Title_DA001: "Title_DA001.json",
  ETextID.Title_DA002: "Title_DA002.json",
  ETextID.Title_DA003: "Title_DA003.json",
  ETextID.Title_DA004: "Title_DA004.json",
  ETextID.Title_DA005: "Title_DA005.json",
  // ETextID.Title_DA006: "Title_DA006.json",
  ETextID.Title_DA007: "Title_DA007.json",
  ETextID.Title_DA008: "Title_DA008.json",
  ETextID.Title_DA009: "Title_DA009.json",
  // ETextID.Title_DA010: "Title_DA010.json",
  ETextID.Title_DA011: "Title_DA011.json",
  ETextID.Title_DA012: "Title_DA012.json",
  ETextID.Title_DA013: "Title_DA013.json",
  ETextID.Title_DA014: "Title_DA014.json",
  ETextID.Title_DA015: "Title_DA015.json",
  ETextID.Title_DA016: "Title_DA016.json",
  ETextID.Title_DA017: "Title_DA017.json",
  ETextID.Title_DA018: "Title_DA018.json",
  // ETextID.Title_DA019: "Title_DA019.json",
  ETextID.Title_DA020: "Title_DA020.json",
  ETextID.Title_DA021: "Title_DA021.json",
  ETextID.Title_DA022: "Title_DA022.json",
  ETextID.Title_DA023: "Title_DA023.json",
  // ETextID.Title_DA024: "Title_DA024.json",
  ETextID.Title_DA025: "Title_DA025.json",
  ETextID.Title_DA026: "Title_DA026.json",
  ETextID.Title_DA027: "Title_DA027.json",
  ETextID.Title_DA028: "Title_DA028.json",
  ETextID.Title_DA029: "Title_DA029.json",
  ETextID.Title_DA030: "Title_DA030.json",
  ETextID.Title_DA031: "Title_DA031.json",
  ETextID.Title_HJ001: "Title_HJ001.json",
  ETextID.Title_HJ002: "Title_HJ002.json",
  ETextID.Title_HJ003: "Title_HJ003.json",
  ETextID.Title_HJ004: "Title_HJ004.json",
  ETextID.Title_HJ005: "Title_HJ005.json",
  ETextID.Title_HJ006: "Title_HJ006.json",
  ETextID.Title_HJ007: "Title_HJ007.json",
  ETextID.Title_HJ008: "Title_HJ008.json",
  ETextID.Title_HJ009: "Title_HJ009.json",
  ETextID.Title_HJ010: "Title_HJ010.json",
  // ETextID.Title_HJ011: "Title_HJ011.json",
  ETextID.Title_HJ012: "Title_HJ012.json",
  ETextID.Title_HJ013: "Title_HJ013.json",
  ETextID.Title_HJ014: "Title_HJ014.json",
  ETextID.Title_HJ015: "Title_HJ015.json",
  ETextID.Title_HJ018: "Title_HJ018.json",
  ETextID.Title_HJ019: "Title_HJ019.json",
  // ETextID.Title_HJ020: "Title_HJ020.json",
  ETextID.Title_HJ021: "Title_HJ021.json",
  ETextID.Title_HJ022: "Title_HJ022.json",
  ETextID.Title_HJ023: "Title_HJ023.json",
  // ETextID.Title_JH001: "Title_JH001.json",
  ETextID.Title_JH002: "Title_JH002.json",
  ETextID.Title_JH003: "Title_JH003.json",
  ETextID.Title_JH004: "Title_JH004.json",
  // ETextID.Title_JH005: "Title_JH005.json",
  // ETextID.Title_JH006: "Title_JH006.json",
  // ETextID.Title_JH007: "Title_JH007.json",
  ETextID.Title_ON001: "Title_ON001.json",
  ETextID.Title_ON002: "Title_ON002.json",
  ETextID.Title_ON003: "Title_ON003.json",
  ETextID.Title_ON005: "Title_ON005.json",
  ETextID.Title_ON006: "Title_ON006.json",
  // ETextID.Title_ON007: "Title_ON007.json",
  ETextID.Title_ON008: "Title_ON008.json",
  ETextID.Title_ON009: "Title_ON009.json",
  ETextID.Title_ON010: "Title_ON010.json",
  ETextID.Title_ON011: "Title_ON011.json",
  ETextID.Title_ON012: "Title_ON012.json",
  // ETextID.Title_ON013: "Title_ON013.json",
  ETextID.Title_SW001: "Title_SW001.json",
  ETextID.Title_SW002: "Title_SW002.json",
  ETextID.Title_SW003: "Title_SW003.json",
  ETextID.Title_SW004: "Title_SW004.json",
  ETextID.Title_SW005: "Title_SW005.json",
  ETextID.Title_SW006: "Title_SW006.json",
  ETextID.Title_SW007: "Title_SW007.json",
  ETextID.Title_SW008: "Title_SW008.json",
  ETextID.Title_SW009: "Title_SW009.json",
  // ETextID.Title_SW010: "Title_SW010.json",
  ETextID.Title_SW011: "Title_SW011.json",
  ETextID.Title_SW012: "Title_SW012.json",
  ETextID.Title_SW013: "Title_SW013.json",
  ETextID.Title_SW014: "Title_SW014.json",
  ETextID.Title_SW015: "Title_SW015.json",
  ETextID.Title_SW016: "Title_SW016.json",
  ETextID.Title_SW017: "Title_SW017.json",
  ETextID.Title_SW018: "Title_SW018.json",
  // ETextID.Title_SW019: "Title_SW019.json",
  ETextID.Title_SW020: "Title_SW020.json",
  ETextID.Title_SW021: "Title_SW021.json",
  ETextID.Title_SW022: "Title_SW022.json",
  // ETextID.Title_SW023: "Title_SW023.json",
  // ETextID.Title_SW024: "Title_SW024.json",
  ETextID.Title_SW025: "Title_SW025.json",
  // ETextID.Title_SW026: "Title_SW026.json",
  // ETextID.Title_SW027: "Title_SW027.json",
  ETextID.Title_SW028: "Title_SW028.json",
  ETextID.Title_SW029: "Title_SW029.json",
  // ETextID.Title_SW030: "Title_SW030.json",
  // ETextID.Title_SW031: "Title_SW031.json",
  // ETextID.Title_SW032: "Title_SW032.json",
  // ETextID.Title_YJ001: "Title_YJ001.json",
  // ETextID.Title_YJ002: "Title_YJ002.json",
  ETextID.Title_YJ003: "Title_YJ003.json",
  ETextID.Title_YJ004: "Title_YJ004.json",
  ETextID.Title_YJ005: "Title_YJ005.json",
  ETextID.Title_YJ006: "Title_YJ006.json",
  ETextID.Title_YJ007: "Title_YJ007.json",
  ETextID.Title_YJ008: "Title_YJ008.json",
  // ETextID.Title_YJ009: "Title_YJ009.json",
  ETextID.Title_YJ010: "Title_YJ010.json",
  ETextID.Title_YJ011: "Title_YJ011.json",
  ETextID.Title_YJ012: "Title_YJ012.json",
  ETextID.Title_YJ013: "Title_YJ013.json",
  // ETextID.Title_YJ014: "Title_YJ014.json",
  ETextID.Title_YJ016: "Title_YJ016.json",
  ETextID.Title_YJ017: "Title_YJ017.json",
  ETextID.Title_YJ018: "Title_YJ018.json",
  ETextID.Title_YJ019: "Title_YJ019.json",
  ETextID.Title_YJ020: "Title_YJ020.json",
  ETextID.Title_YJ021: "Title_YJ021.json",
  ETextID.Title_YJ022: "Title_YJ022.json",
  ETextID.Title_YJ023: "Title_YJ023.json",
  ETextID.Title_YJ025: "Title_YJ025.json",
  // ETextID.Caption_DA001: "Caption_DA001.json",
  // ETextID.Caption_DA002: "Caption_DA002.json",
  // ETextID.Caption_DA003: "Caption_DA003.json",
  // ETextID.Caption_DA004: "Caption_DA004.json",
  // ETextID.Caption_DA005: "Caption_DA005.json",
  // ETextID.Caption_SW001: "Caption_SW001.json",
  // ETextID.Caption_SW002: "Caption_SW002.json",
  // ETextID.Caption_SW003: "Caption_SW003.json",
  // ETextID.Caption_SW004: "Caption_SW004.json",
  // ETextID.Caption_YJ001: "Caption_YJ001.json",
  // ETextID.Caption_YJ002: "Caption_YJ002.json",
  // ETextID.Caption_YJ003: "Caption_YJ003.json",
  // ETextID.Caption_YJ004: "Caption_YJ004.json",
  // ETextID.Caption_YJ005: "Caption_YJ005.json",
  // ETextID.Caption_YJ006: "Caption_YJ006.json",
  // ETextID.Caption_YJ007: "Caption_YJ007.json",
  // ETextID.Caption_YJ008: "Caption_YJ008.json",
};

const Map<EMusicSpeed, List<ETextID>> oneLineTitles = {
  EMusicSpeed.slow: [
    ETextID.Title_DA009,
    ETextID.Title_YJ016,
    ETextID.Title_YJ019
  ],
  EMusicSpeed.medium: [
    ETextID.Title_HJ001,
    ETextID.Title_HJ003,
    ETextID.Title_HJ004,
    ETextID.Title_HJ005,
    ETextID.Title_HJ007,
    ETextID.Title_HJ008,
    ETextID.Title_HJ009,
    ETextID.Title_HJ010,
    ETextID.Title_ON001,
    ETextID.Title_ON002,
    ETextID.Title_ON003,
    ETextID.Title_ON005,
    ETextID.Title_ON006,
    ETextID.Title_ON008,
    ETextID.Title_ON009,
    ETextID.Title_SW004,
    ETextID.Title_SW006,
    ETextID.Title_SW008
  ],
  EMusicSpeed.fast: [
    ETextID.Title_HJ002,
    // ETextID.Title_ON007
  ]
};

const Map<EMusicSpeed, List<ETextID>> twoLineTitles = {
  EMusicSpeed.slow: [
    ETextID.Title_DA003,
    ETextID.Title_DA020,
    ETextID.Title_DA021,
    ETextID.Title_HJ013,
    ETextID.Title_HJ015,
    ETextID.Title_SW003,
    ETextID.Title_SW007,
    ETextID.Title_SW015,
    ETextID.Title_SW016,
    ETextID.Title_YJ004
  ],
  EMusicSpeed.medium: [
    ETextID.Title_DA001,
    ETextID.Title_DA004,
    ETextID.Title_DA005,
    // ETextID.Title_DA006,
    ETextID.Title_DA007,
    ETextID.Title_DA008,
    ETextID.Title_DA012,
    ETextID.Title_DA013,
    ETextID.Title_DA015,
    ETextID.Title_DA016,
    ETextID.Title_DA017,
    ETextID.Title_DA018,
    ETextID.Title_DA022,
    ETextID.Title_HJ006,
    // ETextID.Title_HJ011,
    ETextID.Title_HJ012,
    ETextID.Title_HJ019,
    ETextID.Title_ON010,
    ETextID.Title_ON011,
    ETextID.Title_ON012,
    ETextID.Title_SW001,
    ETextID.Title_SW002,
    ETextID.Title_SW011,
    ETextID.Title_SW012,
    ETextID.Title_SW013,
    ETextID.Title_SW014,
    ETextID.Title_SW017,
    ETextID.Title_SW018,
    ETextID.Title_SW020,
    ETextID.Title_SW021,
    ETextID.Title_SW022,
    ETextID.Title_YJ003,
    ETextID.Title_YJ005,
    ETextID.Title_YJ006,
    ETextID.Title_YJ007,
    ETextID.Title_YJ008,
    ETextID.Title_YJ010,
    ETextID.Title_YJ011,
    ETextID.Title_YJ012,
    ETextID.Title_YJ013,
    ETextID.Title_YJ017,
    ETextID.Title_YJ018,
    ETextID.Title_YJ020,
    ETextID.Title_YJ021,
    ETextID.Title_YJ022
  ],
  EMusicSpeed.fast: [
    ETextID.Title_DA002,
    ETextID.Title_DA011,
    ETextID.Title_DA014,
    ETextID.Title_DA023,
    ETextID.Title_HJ014,
    ETextID.Title_HJ018,
    ETextID.Title_SW005,
    ETextID.Title_SW009
  ]
};

Future<String> _loadFontBase64(String fontFamily, String fontFileName) async {
  File file = await downloadFont(fontFamily, fontFileName);
  return base64.encode(await file.readAsBytes());
}

Future<TextData?> loadTextData(ETextID id) async {
  if (!_textMap.containsKey(id)) return null;

  final Map<String, dynamic> loadedMap =
      jsonDecode(await loadResourceString("text/${_textMap[id]}"));

  final ETextType type =
      id.toString().startsWith("Caption") ? ETextType.Caption : ETextType.Title;
  final String filename = loadedMap["filename"];
  final List<String> fontFamily = List<String>.from(loadedMap["fontFamily"]);
  final List<String> fontFileName =
      List<String>.from(loadedMap["fontFileName"]);

  final String json = await loadResourceString("raw/lottie-jsons/$filename");

  List<Future<String>> loadFontBase64Futures = [];
  for (int i = 0; i < fontFamily.length; i++) {
    loadFontBase64Futures.add(_loadFontBase64(fontFamily[i], fontFileName[i]));
  }

  List<String> fontBase64 = await Future.wait(loadFontBase64Futures);

  return TextData(type, json, fontFamily, fontBase64);
}
