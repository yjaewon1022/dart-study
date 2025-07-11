// 사람을 뜻하는 Human 클래스를 생성하고,
// 이름(name), 나이(age), 성별(gender) 을 담을 수 있는 인스턴스 변수를 생성하세요.
// 모든 값들은 클래스 호출 시 필수적으로 입력을 해야 하며,
// 생성자를 작성할 땐 named parameter 를 이용해야 합니다.
// 이후 사용자의 정보를 출력하는 함수인 profile 을 구현해야 하며, 다음의 내용을 출력해야 합니다.
// [안녕하세요. 제 이름은 $name 이며, $age 살 $gender 입니다.]
class Human {
  late String name;
  late int age;
  late String gender;

  // // 기본적으로 생성자를 만드는 방법
  // Human(String givenName, int givenAge, String givenGender)
  //   : age = givenAge,
  //     name = givenName,
  //     gender = givenGender;

  // named parameter를 이용해 생성자를 만드는 방법
  Human({
    required String givenName,
    required int givenAge,
    required String givenGender,
  }) {
    age = givenAge;
    name = givenName;
    gender = givenGender;
  }

  // void profile() {
  //   print("안녕하세요. 제 이름은 $name 이며, $age 살 $gender 입니다.");
  // }

  String profile() {
    return "안녕하세요. 제 이름은 $name 이며, $age 살 $gender 입니다.";
  }
}

void main() {
  // named paramter 를 사용하지 않았을 때 클래스를 호출하는 방법
  // var asdf = Human("짱구", 5, "남성");

  // named paramter 를 사용했을 때 클래스를 호출하는 방법
  var asdf = Human(givenGender: "남성", givenName: "철수", givenAge: 5);

  print(asdf.profile());
}
