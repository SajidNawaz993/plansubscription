import 'package:equatable/equatable.dart';

class PlanDetailsState extends Equatable {
   PlanDetailsState({
     this.street = "",
     this.townCity = "",
     this.state = "",
     this.zipCode = "",
     this.cardNbr = "",
     this.expDate = "",
     this.cvv = "",
  });

   late  String street,townCity,state,zipCode,cardNbr,expDate,cvv;

  @override
  List<Object> get props => [street,townCity,state,zipCode,cardNbr,expDate,cvv];
}

class PlanDetailsValue extends PlanDetailsState {}