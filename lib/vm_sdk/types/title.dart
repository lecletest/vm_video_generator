enum ETitleType {
  title01,
  title02,
  title03,
  title04,
  title05,
  title06,
  title07,
  title08,
  title09,
  title10,
  title11,
  title12,
  title13,
  title14,
  title15,
  title16,
  title17,
  title18,
  title19,
  title20,
  title21,
  title22,
  title23,
  title24,
  title25,
  title26,
  title27,
  title28,
  title29,
  title30,
  title31,
  title32,
  title33,
  title34,
  title35,
  title36,
  title37,
  title38,
  title39,
  title40,
  title41,
  title42,
  title43,
  title44,
  title45,
  title46,
  title47,
  title48,
  title49,
  title50,
  title51,
  title52,
  title53,
  title54,
  title55,
  title56,
  title57,
  title58,
  title59,
  title60,
  title61,
  title62,
  title63,
  title64,
  title65,
  title66,
  title67,
  title68,
  title69,
  title70,
  title71,
  title72,
  title73,
  title74,
  title75,
  title76,
  title77,
  title78,
  title79,
  title80,
  title81,
  title82,
  title83,
  title84,
  title85,
  title86,
  title87,
  title88,
  title89,
  title90,
  title91,
  title92,
  title93,
  title94,
  title95,
  title96,
  title97,
  title98,
  title99,
  title100,
  title101,
  title102,
  title103,
  title104,
  title105,
  title106,
  title107,
  title108,
  title109,
  title110,
  title111,
  title112,
  title113,
  title114,
  title115,
  title116,
  title117,
  title118,
  title119,
  title120
}

class TitleData {
  String json;
  List<String> fontFamily;
  List<String> fontBase64;
  List<String> texts = [];

  TitleData(this.json, this.fontFamily, this.fontBase64);
}

class ExportedTitlePNGSequenceData {
  String folderPath;
  double width;
  double height;
  double frameRate;

  ExportedTitlePNGSequenceData(
      this.folderPath, this.width, this.height, this.frameRate);
}
