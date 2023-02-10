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

  Map<int, String> map = { // obj라고 생각
    1: "",
    2: ""
  }

  var set1 = {};
  var list1 = [];
  Set<String> set2 = {}; // 기본적으로 list와 같으나 모든 요소에 unique를 적용
}
