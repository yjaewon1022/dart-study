// 반환 값이 있는 함수
int getMax(int num1, int num2) {
  if (num1 > num2) {
    return num1;
  } else {
    return num2;
  }
}

void createPlayer({required String name, int level = 1, double exp = 0.00}) {
  print('Player $name is $level Level and $exp exp.');
}

void main() {
  createPlayer(name: 'jaewon', level: 5, exp: 0.00);
}
