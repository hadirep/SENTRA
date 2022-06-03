part of 'detail_bloc.dart';

@immutable
class DetailState extends Equatable {
  final DetailArt? detailArt;
  final RequestState detailArtState;
  final bool getFavoriteStatus;
  final String message;
  final String favoritemessage;

  const DetailState({
    required this.detailArt,
    required this.detailArtState,
    required this.favoritemessage,
    required this.getFavoriteStatus,
    required this.message,
  });

  DetailState copyWith({
    DetailArt? detailArt,
    RequestState? detailArtState,
    bool? getFavoriteStatus,
    String? message,
    String? favoritemessage,
  }) {
    return DetailState(
      detailArt: detailArt ?? this.detailArt,
      detailArtState: detailArtState ?? this.detailArtState,
      getFavoriteStatus: getFavoriteStatus ?? this.getFavoriteStatus,
      message: message ?? this.message,
      favoritemessage: favoritemessage ?? this.favoritemessage,

      );
  }

  factory DetailState.initial() {
    return const DetailState(
      detailArt: null,
      detailArtState: RequestState.Empty,
      getFavoriteStatus: false,
      message: '',
      favoritemessage: '',
    );
  }

  @override
  List<Object?> get props => [
    detailArt,
    detailArtState,
    getFavoriteStatus,
    message,
    favoritemessage

  ];
}
