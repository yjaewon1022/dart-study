void main() {
  var name = "nico";
  String name2 = "nico2";

  // 기본적으로 var 또는 다른 타입으로 생성된 변수는 계속해서 수정이 가능합니다.
  name = "hi";
  name2 = "hello";

  // 수정을 할 수 없는 변수를 만들어야 할 때 저희는 final 이라는 자료형을 사용하면 됩니다.
  final name3 = "HELLLLO";

  name3 = "HIIIIIIIIIII";
  // final 자료형은 단 한 번 변수의 값을 지정하고 난 후에는 추가적인 수정이 불가능합니다.

  // final 자료형은 변수의 타입도 지정을 해줄 수 있습니다.
  final String name4;
}
