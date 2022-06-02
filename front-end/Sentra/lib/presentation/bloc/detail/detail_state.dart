part of 'detail_bloc.dart';

// @immutable
class DetailState extends Equatable {
  final DetailArt? detailArt;

  const DetailState({
    required this.detailArt,
  });

  DetailState copyWith({
    DetailArt? detailArt,
    RequestState? detailArtState,
  }) {
    return DetailState(
      detailArt: detailArt ?? this.detailArt,
      );
  }

  factory DetailState.initial() {
    return const DetailState(
      detailArt: null,
    );
  }

  @override
  List<Object?> get props => [
    detailArt,
  ];
}

// abstract class DetailState extends Equatable {
//   const DetailState();
  
//   @override
//   List<Object> get props => [];
// }

// class DetailInitial extends DetailState {}
