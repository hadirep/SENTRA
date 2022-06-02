part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class OnDetailChanged extends DetailEvent {
  final String id;

  const OnDetailChanged(this.id);

  @override
  List<Object> get props => [id];
}
