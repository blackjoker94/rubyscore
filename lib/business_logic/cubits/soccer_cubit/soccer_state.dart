part of 'soccer_cubit.dart';

@immutable
sealed class SoccerState {}

final class SoccerInitial extends SoccerState {}
final class SoccerLoading extends SoccerState {}
final class SoccerSuccess extends SoccerState {}
final class SoccerFailed extends SoccerState {}
