
abstract class Registerstates {}

class RegisterInitialstate extends Registerstates{}

class RegisterLoadingstate extends Registerstates{}

class RegisterSuccessstate extends Registerstates{}

class RegisterErrorstate extends Registerstates{
  final String error;
  RegisterErrorstate(this.error);
}

class CreateUserSuccessstate extends Registerstates{}

class CreateUserErrorstate extends Registerstates{
  final String error;
  CreateUserErrorstate(this.error);
}


class Changepasswordvisabiltystate extends Registerstates{}

class Changeprivacystate extends Registerstates{}

class Changevaluesstate extends Registerstates{}