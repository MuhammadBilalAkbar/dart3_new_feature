void main() {
  var json = {
    'user': ['Lily', 13]
  };

  // var name = json['user']![0];
  // var age = json['user']![1];
  // print(name);
  // print(age);

  var {'user': [name, age]} = json;
  print(name);
  print(age);

  int day = 4;
  var dayName = switch (day) {
    1 => print('Monday'),
    2 => print('Tuesday'),
    3 => print('Wednesday'),
    4 => print('Thursday'),
    _ => throw 'Invalid',
  };
}
