import 'package:equatable/equatable.dart';

abstract class ProvinceEvent extends Equatable {
  const ProvinceEvent();

  @override
  List<Object> get props => [];
}

class OnProvinceChanged extends ProvinceEvent {
  final String query;

  const OnProvinceChanged(this.query);

  @override
  List<Object> get props => [query];
}
