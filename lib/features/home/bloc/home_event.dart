part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel productDataModel;

  HomeProductWishListButtonClickedEvent({required this.productDataModel});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel productDataModel;

  HomeProductCartButtonClickedEvent({required this.productDataModel});
}

class HomeWishListButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
