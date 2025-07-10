// TODO: name 과 age 를 입력받을 수 있는 Player Class 를 만들고,
// 해당 플레이어의 이름, 나이를 확인할 수 있는 getter 함수와
// 해당 내역을 수정할 수 있는 setter 함수를 만들어라.

class Player {
  // 인스턴스 변수 선언
  late String name;
  late int age;

  // 생성자 만들기
  Player(String givenName, [int givenAge = 0]) {
    name = givenName;
    age = givenAge;
  }

  // get 함수
  // 반환할자료형 함수이름 () { return 반환할값 }
  String returnName() {
    return name;
  }

  int returnAge() {
    return age;
  }

  // set 함수
  // 반환할자료형 함수이름 ( 사용자가 변경할 값 ) {}
  void setName(String givenName) {
    name = givenName;
  }

  void setAge(int givenAge) {
    age = givenAge;
  }

  // getter 의 사용법
  // 반환할자료형 get 함수명 => 반환할값;
  String get getterName => name;
  int get getterAge => age;

  // setter 의 사용법
  // set 함수명(사용자입력값) => 변경할내용;
  set setterName(String givenName) => name = givenName;
  set setterAge(int givenAge) => age = givenAge;
}

void main() {
  var player = Player("홍길동");

  //   print(player.returnName());
  //   print(player.returnAge());

  //   player.setName("김철수");
  //   player.setAge(10);

  //   print(player.returnName());
  //   print(player.returnAge());

  print(player.getterName);
  print(player.getterAge);

  player.setterName = "짱구";
  player.setterAge = 5;

  print(player.getterName);
  print(player.getterAge);
}
