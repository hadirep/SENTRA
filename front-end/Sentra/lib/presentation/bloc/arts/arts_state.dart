import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';

abstract class ArtsState extends Equatable {
  const ArtsState();

  @override
  List<Object> get props => [];
}

class ArtsEmpty extends ArtsState {}

class ArtsLoading extends ArtsState {}

class ArtsError extends ArtsState {
  final String message;

  const ArtsError(this.message);

  @override
  List<Object> get props => [message];
}

class ArtsHasData extends ArtsState {
  final List<Art> result;

  const ArtsHasData(this.result);

  @override
  List<Object> get props => [result];
}
