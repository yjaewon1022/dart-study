void main() {
  // null이 무엇인가?
  // null 은 아무런 값이 들어가있지 않은 상태 (아무것도 넣지 않겠다)
  var name = null;

  // 이렇게 값을 작성하고 실행하면 어떻게 될까?
  isEmpty(name);
  // 다음과 같은 에러가 발생하게 됨
  // Exception has occurred.
  // _TypeError (type 'Null' is not a subtype of type 'String')

  // Dart에서는 사용자가 실수로 null 값을 이용하지 않게 하기 위해서 null safety 라는 기본 기능을 제공해줍니다.
  // 다음의 코드에서는 nico 라는 변수는 String 값이 들어갈 것이다. 라고 컴퓨터에게 인식을 시켜주었습니다.
  String? nico = "nico";

  // 하지만 nico 라는 변수에 우리가 null 값도 사용을 할 수 있게 다음과 같이 작성을 하면 에러가 발생하게 되는데,
  nico = null;

  // 그 이유는 String nico = "nico"; 에서 항상 nico 라는 변수는 String이 들어갈 것이다. 라고 작성을 해주었기 때문이죠.
  // 그래서 String 타입도 들어가고, null 도 들어갈 수 있게 하려면 다음과 같은 기능을 이용해주어야 합니다.
  // String? nico = "nico"; -> ? 를 String 타입 뒤에 작성해주었는데
  // 해당 내용은 String 이 들어갈 수 있고, null 도 들어갈 수 있다. 라고 작성을 해주는 것이다.

  // 이후부터 nico 라는 변수를 사용하게 되면 컴퓨터가 자동으로 null 값이 들어갈 수 있다는 것을 인지시켜주며,
  // 사용자는 해당 변수가 null 값이 아니다 라는 것을 컴퓨터에게 확인을 받아줘야 함.
  nico.length;

  // 현재 nico.length 기능을 바로 사용하면 컴퓨터가 nico가 null 이라서 런타임 에러가 발생할 수 있으니, 확인을 해야한다 라고
  // 에러를 전달하고 있어서, 컴퓨터에게 nico 가 null이 아닐때 해당 코드를 실행할 수 있게 해주어야 함.
  if (nico != null) {
    nico.length;
  }
  // if 문으로 null 을 확인하지 않고, 간략하게 사용할 수 있는 방법도 있음
  nico?.length;

  // null 로 적용될 수 있는 변수 뒤에 ? 를 붙여주고, 이후 실행할 코드를 작성해주면 됨.

  // 중요!!!! 기본적으로 우리가 선언한 변수는 null을 사용할 수 없다.
  // null을 사용하게 해주기 위해서는 타입의 뒤에 ? 를 붙여주어야 한다. 예) String? nico;
}

// main 에서 string 이라는 String 타입을 받아와서, 해당 길이가 0인지 확인하는 함수
bool isEmpty(String string) => string.length == 0;
