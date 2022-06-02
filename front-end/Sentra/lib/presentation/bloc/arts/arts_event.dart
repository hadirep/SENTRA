import 'package:equatable/equatable.dart';

abstract class ArtsEvent extends Equatable {
  const ArtsEvent();

  @override
  List<Object> get props => [];
}

class OnArtsChanged extends ArtsEvent {
  @override
  List<Object> get props => [];
}
