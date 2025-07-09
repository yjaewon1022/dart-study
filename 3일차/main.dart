void main() {
  // TODO 1: 1 ~ 10 까지의 리스트 를 생성한 뒤, 첫 번째 인덱스에 9 라는 값을 넣어 출력해보자.
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  list.insert(0, 9);

  print(list);

  // TODO 2: 6번째 인덱스에 존재하는 값을 출력해보자.
  print(list[6]);

  // TODO 3: 새로운 리스트 "1" "2" "3" 를 저장한 리스트를 생성하고,
  //         기존에 존재하는 리스트에 추가한 뒤, 값을 출력해보자.
  List newList = ["1", "2", "3"];
  list.addAll(newList);

  print(list);
}
