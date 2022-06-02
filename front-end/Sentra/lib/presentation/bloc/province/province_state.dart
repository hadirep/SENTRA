import 'package:equatable/equatable.dart';
import 'package:sentra/domain/entities/art.dart';

abstract class ProvinceState extends Equatable {
  const ProvinceState();

  @override
  List<Object> get props => [];
}

class ProvinceEmpty extends ProvinceState {}

class ProvinceLoading extends ProvinceState {}

class ProvinceError extends ProvinceState {
  final String message;

  const ProvinceError(this.message);

  @override
  List<Object> get props => [message];
}

class ProvinceHasData extends ProvinceState {
  final List<Art> result;

  const ProvinceHasData(this.result);

  @override
  List<Object> get props => [result];
}
