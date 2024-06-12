part of 'home_cubit.dart';


sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState
 {
  final String message;

  HomeFailure({required this.message});
 }
final class HomeSucsess extends HomeState 
{
  final ShipmentModel shipmentModel;

  HomeSucsess({required this.shipmentModel});
}

