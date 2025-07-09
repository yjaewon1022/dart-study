void main() {
  // TODO: 문자열 "가" ~ "사" 를 포함한 Set 를 하나 생성하고,
  //       "라" ~ "하" 를 포함한 Set 를 생성한 뒤,
  //       두 세트를 합친 새로운 세트를 변수에 담아 출력해보자.
  Set set1 = {"가", "나", "다", "라", "마", "바", "사"};
  Set set2 = {"라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"};
  // set1.addAll(set2);
  // print(set1);

  // TODO: Set 심화과정 - 두 개의 세트에서 교집합, 합집합, 차집합을 새로운 세트들로 출력해보자
  Set set4 = set1.intersection(set2); // 교집합
  print(set4);
  Set set5 = set1.difference(set2); // 차집합
  print(set5);
  Set set6 = set1.union(set2); // 합집합
  print(set6);

  // TODO: 과일 상점을 뜻하는 shop 변수에
  //       apple 은 10개, banana 는 5개, mango 는 3개가 존재하도록 Map 을 생성한 뒤,
  //       이 상점에서 망고를 판매하고 있는지, 판매하고 있다면
  //       [이 상점에서는 망고를 $count 개 판매하고 있습니다.]
  //       라고 출력하도록 해보자.
  Map shop = {"apple": 10, "banana": 5, "mango": 3};
  int count = 0;

  if (shop.containsKey('mango')) {
    count = shop["mango"];

    print("이 상점에서는 망고를 $count 개 판매하고 있습니다.");
  }

  // TODO: Map 심화과정 - 상점에서 망고를 2개 판매했다고 가정한 후,
  //       과일 상점에서 현재 팔고있는 망고의 총 개수를 출력해보자
  shop['mango'] = shop['mango'] - 2;

  print(shop);
}
