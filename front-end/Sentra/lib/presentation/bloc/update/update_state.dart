import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateEmpty extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateError extends UpdateState {
  final String message;

  const UpdateError(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateHasData extends UpdateState {
  final List<Art> result;

  const UpdateHasData(this.result);

  @override
  List<Object> get props => [result];
}
