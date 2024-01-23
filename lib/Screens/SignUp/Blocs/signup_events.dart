abstract class SignUpEvents{}

  class EmailEvents extends SignUpEvents{
    String? email;
    EmailEvents({this.email});
  }

  class PasswordEvents extends SignUpEvents{
    String? password;
    PasswordEvents({this.password});
  }
