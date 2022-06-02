import 'package:equatable/equatable.dart';

abstract class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class OnUpdateChanged extends UpdateEvent {
  @override
  List<Object> get props => [];
}
