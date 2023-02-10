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
