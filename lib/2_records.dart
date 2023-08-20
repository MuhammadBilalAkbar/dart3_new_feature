// import 'dart:ui';

void main() {
  // final json = {'name': 'Andrea', 'age': 38, 'isMale': false};

  /// If you use the json variable as is, you lose type safety because
  /// Dart will infer it to be a Map<String, dynamic>.
  /// Records
  /// Returning multiple values
  (String, int) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['height'] as int);
  }

  /// Patterns
  var (String name, int height) = userInfo({'name': 'Michael', 'height': 180});
  print('User $name is $height cm tall.');
  // var (String namee, _) = userInfo(…);
  String describeDate(DateTime dt) => switch (dt.weekday) {
        1 => 'Feeling the Monday blues?',
        6 || 7 => 'Enjoy the weekend!',
        _ => 'Hang in there.'
      };
  // print(describeDate(DateTime().weekday ));


}

class Person {
  Person({required this.name, required this.age, required this.isMale});

  final String name;
  final int age;
  final bool isMale;

  // factory Person.fromJson(Map<String, dynamic> json) {
  //   return Person(
  //     name: json['name'],
  //     age: json['age'],
  //     isMale: json['isMale'],
  //   );
  // }

  /// you can use a record type to represent your data. This allows you to
  /// create functions with multiple return values.
  (String, int, bool) getPerson(Map<String, dynamic> json) {
    return (
      json['name'],
      json['age'],
      json['isMale'],
    );
  }

  final json = {'name': 'Andrea', 'age': 38, 'isMale': false};

// final person = Person(name: 'Andrea', age: 38, isMale: false);
// person.getPerson(json);

// final person = getPerson(json);
// print(person.name);
// print(person.age);
// print(person.isMale);

// final (name, age, isMale) = getPerson(json);
// print(name); // 'Andrea'
// print(age); // 38
// print(isMale); // 184
}

enum Move {
  up,
  down,
  left,
  right;

  // Offset get offset {
  //   switch (this) {
  //     case up:
  //       return const Offset(0.0, 1.0);
  //     case down:
  //       return const Offset(0.0, -1.0);
  //     case left:
  //       return const Offset(-1.0, 0.0);
  //     case right:
  //       return const Offset(1.0, 0.0);
  //   }
  // }
}

/// with Dart 3, we get switch expressions, and we can rewrite the code above in a much more concise way:

enum Movee {
  up,
  down,
  left,
  right;

  // Offset get offset => switch (this) {
  //       up => const Offset(0.0, 1.0),
  //       down => const Offset(0.0, -1.0),
  //       left => const Offset(-1.0, 0.0),
  //       right => const Offset(1.0, 0.0),
  //     };

  ///Wanna get the movement on the x-axis only? Then leverage pattern matching by using logical operators inside the switch:

  double get xAxisMovement => switch (this) {
        up || down => 0.0, // logical OR operator with pattern matching
        left => -1.0,
        right => 1.0,
      };
}

/// use sealed classes to define all possible auth exceptions that could be
/// returned by your backend:

/// Declaring a sealed class has two important implications:
/// The class becomes abstract (you can’t create a concrete instance of it)
/// All subclasses must be defined in the same library (file).

sealed class AuthException implements Exception {}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException(this.email);

  final String email;
}

class WeakPasswordException extends AuthException {}

class WrongPasswordException extends AuthException {}

class UserNotFoundException extends AuthException {}

String describe(AuthException exception) {
  return switch (exception) {
    EmailAlreadyInUseException(email: final email) =>
      'Email already in use: $email',
    WeakPasswordException() => 'Password is too weak',
    WrongPasswordException() => 'Wrong password',
    UserNotFoundException() => 'User not found',
  };
}

///Before Dart 3, only two class modifiers were available: abstract and mixin.
///With Dart 3, these are six:
// abstract
// base
// final
// interface
// sealed
// mixin
