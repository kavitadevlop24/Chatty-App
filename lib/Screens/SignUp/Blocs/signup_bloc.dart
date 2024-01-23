import 'package:chatty_app/Screens/SignUp/Blocs/signup_events.dart';
import 'package:chatty_app/Screens/SignUp/Blocs/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents,SignUpStates>{
  SignUpBloc():super(SignUpStates()){
    on<EmailEvents>(_emailEvents);
    on<PasswordEvents>(_passwordEvents);
  }
  _emailEvents(EmailEvents emailEvents,Emitter<SignUpStates>emit){
    emit(state.copyWith(email: emailEvents.email));
  }
  _passwordEvents(PasswordEvents passwordEvents,Emitter<SignUpStates>emit){
    emit(state.copyWith(password: passwordEvents.password));
  }
}