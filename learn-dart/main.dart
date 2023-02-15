void main() {
  print("hello world");
}

void vaiable() {
  String str = ""; // property나 class에서 선언시 사용

  var i = 0; // 지역 변수 선언시 주로 사용

  dynamic value = ""; // 여러 타입을 넣을 수 있음
  value = 10;
  value = {};

  String? nullable = null; // 타입 뒤에 ? == nullable var

  final a = ""; // run time에서의 init 상수임. like js
  const b = ""; // compile에서의 init 상수이되 컴파일 단에서 해당 상수에 들어갈 값을 알아야만 함.

  late final String later; // 초기 데이터 없이 변수 생성을 가능토록 함.
  later = "late";
}

void dataType() {
  String a = "";
  bool b = false;

  int c = 12;
  double d = 12.12;
  num cd = 123.21; // int 와 double 모두 될 수 있음

  // 위의 변수들은 Object를 기반으로 짜임

  List list = [];
  var list2 = [];

  var item = [
    1,
    2,
    3,
    if (true) 10, // list를 init 할 때 if문 사용 가능.
  ];

  String str = "${item} is item";

  for (var e in item) {
    print(e);
  }

  Map<int, String> map = {
    // obj라고 생각
    1: "",
    2: "",
  };

  var set1 = {};
  var list1 = [];
  Set<String> set2 = {}; // 기본적으로 list와 같으나 모든 요소에 unique를 적용
}

// List<String>을 StringL로 명명해서 사용 ㄱㄴ
typedef StringL = List<String>;

void functionRun() {
  namedParamater(contry: "korea", name: "momin");

  optionalParamater("name");
  qqOperator("name");

  String? name = null;
  name ??= "anon"; // name이 null이라면 anon을 대입
}

// default value를 적용해 null에 대응하거나 required로 not nullable하게 막음
void namedParamater({String contry = 'no data', required String name}) =>
    print("contry is $contry");

// optional임에도 []안에 넣어 ?를 붙임으로 써 nullable하게 만들 수 있음
void optionalParamater(String name, [String? contry]) =>
    "hello $name from $contry";

// name이 null이면 ANON을 return
void qqOperator(String? name) => name?.toUpperCase() ?? "ANON";

void classRun() {
  // new 필수 아님
  Player1 p = Player1(age: 12, name: "")
    ..age = 13
    ..sayName();
  var p1 = Player2(
      age: 12, name: "momin", number: 1, locate: Locate.Busan.toString());
}

class Player1 extends Player {
  String name = 'jisoung';
  int age = 17;

  Player1({required age, required name});

  void sayName() {
    // class method안에서는 this를 쓰지 않는 것을 권장한다.
    print("Hi my name is $name");
  }

  @override
  void move() {
    print("move");
  }
}

class Player2 {
  final String name;
  final int age, number;
  final String locate;

  Player2(
      {required this.age,
      required this.name,
      required this.number,
      required this.locate});

  Player2.createOnePlayer(
      {required this.age, required this.name, required this.locate})
      : this.number = 1;

  Player2.parseJson(Map<String, dynamic> json)
      : this.age = json["age"],
        this.name = json["name"],
        this.number = json["number"],
        this.locate = json["locate"];
}

enum Locate { Busan, Haeundae }

abstract class Player {
  void move();
}
