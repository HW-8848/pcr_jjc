import 'package:wanzi/tool/RoleData.dart';

enum RoleEnum {
  youshu(id: "000", name: "佑树", location: "0"),
  lima(id: "105", name: "莉玛", location: "1"),
  gongzi(id: "125", name: "宫子", location: "1"),
  konghua(id: "130", name: "空花", location: "1"),
  konghua_dajianghu(id: "140", name: "空花(大江户)", location: "1"),
  fangxi_wanshengjie(id: "152", name: "纺希(万圣节)", location: "1"),
  lian_xinnian(id: "153", name: "怜(新年)", location: "1"),
  lin(id: "153", name: "凛(偶像大师)", location: "1"),
  peikelimu(id: "155", name: "佩可莉姆", location: "1"),
  peikelimu_gongzhu(id: "155", name: "佩可莉姆(公主)", location: "1"),
  kekeluo_xinnian(id: "159", name: "可可萝(新年)", location: "1"),
  // wang(id: "160", name: "望", location: "1"),
  maoyiwei(id: "162", name: "矛依未", location: "1"),
  jiaye(id: "168", name: "嘉夜", location: "1"),
  riheli_xinnian(id: "170", name: "日和莉(新年)", location: "1"),
  qiunai(id: "180", name: "秋乃", location: "1"),
  fangxi(id: "195", name: "纺希", location: "1"),
  qili(id: "197", name: "祈梨", location: "1"),
  riheli(id: "200", name: "日和莉", location: "1"),
  lingyin(id: "210", name: "绫音", location: "1"),
  zhuxi(id: "215", name: "珠希", location: "1"),
  huilizi(id: "230", name: "惠理子", location: "1"),
  jita(id: "245", name: "姬塔", location: "1"),
  lian(id: "250", name: "怜", location: "1"),
  jingliu(id: "285", name: "静流", location: "1"),
  kelisitina(id: "290", name: "克莉丝提娜", location: "1"),
  meimei_wanshengjie(id: "365", name: "美美(万圣节)", location: "2"),
  // lian_wanshengjie(id: "375", name: "怜(万圣节)", location: "2"),
  zhenyang_youqibing(id: "390", name: "真阳(游骑兵)", location: "2"),
  zhenyang(id: "395", name: "真阳", location: "2"),
  youjiali(id: "405", name: "由加莉", location: "2"),
  monika(id: "410", name: "莫妮卡", location: "2"),
  ninong(id: "415", name: "妮侬", location: "2"),
  meidong(id: "420", name: "美冬", location: "2"),
  ling_youqibing(id: "422", name: "铃(游骑兵)", location: "2"),
  xiangzhi_xiari(id: "425", name: "香织(夏日)", location: "2"),
  xiaolian(id: "430", name: "咲恋", location: "2"),
  meidong_xiari(id: "495", name: "美冬(夏日)", location: "2"),
  kekeluo(id: "500", name: "可可萝", location: "2"),
  leimu(id: "540", name: "雷姆", location: "2"),
  lamu(id: "545", name: "拉姆", location: "2"),
  ling(id: "550", name: "铃", location: "2"),
  kekeluo_gongzhu(id: "555", name: "可可萝(新年)", location: "2"),
  labilisita(id: "560", name: "菈比莉斯塔", location: "2"),
  sisihua_xinnian(id: "562", name: "似似花(新年)", location: "2"),
  shenyue(id: "565", name: "深月", location: "2"),
  chuyin_xiari(id: "567", name: "初音(夏日)", location: "2"),
  qianli(id: "570", name: "茜里", location: "2"),
  yili(id: "575", name: "依里", location: "2"),
  xiaolian_xiari(id: "585", name: "咲恋(夏日)", location: "2"),
  gongzi_wanshengjie(id: "590", name: "宫子(万圣节)", location: "2"),
  an(id: "630", name: "安", location: "3"),
  sisihua(id: "660", name: "似似花", location: "3"),
  // bi_chabansheng(id: "680", name: "碧(插班生)", location: "3"),
  linai(id: "700", name: "璃乃", location: "3"),
  lingnai(id: "705", name: "玲奈", location: "3"),
  yixu(id: "715", name: "伊绪", location: "3"),
  lingmei_xinnian(id: "722", name: "铃莓(新年)", location: "3"),
  aimiliya(id: "725", name: "爱蜜莉雅", location: "3"),
  xiangcheng(id: "730", name: "香澄", location: "3"),
  xiangcheng_mofashaonv(id: "730", name: "香澄(魔法少女)", location: "3"),
  chuyin(id: "755", name: "初音", location: "3"),
  luna(id: "765", name: "露娜", location: "3"),
  youyi_gongzhu(id: "767", name: "优衣(公主)", location: "3"),
  qiange_shengdanjie(id: "770", name: "千歌(圣诞节)", location: "3"),
  kailu_xiari(id: "780", name: "凯露(夏日)", location: "3"),
  bi(id: "785", name: "碧", location: "3"),
  qiange(id: "790", name: "千歌", location: "3"),
  zhenbu(id: "795", name: "真步", location: "3"),
  youyi(id: "800", name: "优衣", location: "3"),
  xue(id: "805", name: "雪", location: "3"),
  youni(id: "807", name: "优妮", location: "3");
  // jinghua(id: "810", name: "镜华", location: "3"),
  // jinghua_wanshengjie(id: "820", name: "镜华(万圣节)", location: "3");

  const RoleEnum(
      {required this.id, required this.name, required this.location});

  final String id;
  final String name;
  final String location;

  String get getId {
    return id;
  }

  String get getName {
    return name;
  }

  String get getLocation {
    return location;
  }

  RoleEnum get getNullRole {
    return RoleEnum.youshu;
  }

  static List<RoleEnum> get getARoleList {
    return RoleEnum.values
        .where((role) => role.getLocation == RoleData.qianwei)
        .toList();
  }

  static List<RoleEnum> get getBRoleList {
    return RoleEnum.values
        .where((role) => role.getLocation == RoleData.zhongwei)
        .toList();
  }

  static List<RoleEnum> get getCRoleList {
    return RoleEnum.values
        .where((role) => role.getLocation == RoleData.houwei)
        .toList();
  }
}
