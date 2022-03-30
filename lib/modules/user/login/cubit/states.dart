
abstract class Logingstates {}

class LogingInitialstate extends Logingstates{}

class LogingLoadingstate extends Logingstates{}

class LogingSuccessstate extends Logingstates{}

class LogingErrorstate extends Logingstates{
  final String error;
  LogingErrorstate(this.error);
}

class Changepasswordstate extends Logingstates{}