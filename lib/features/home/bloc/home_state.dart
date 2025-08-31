part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedSuccessfulState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessfulState({required this.products});
}

final class HomeErrorState extends HomeState {}

final class HomeNavigateToWishlistPageActionState extends HomeActionState {}

final class HomeNavigateToCartListPageActionState extends HomeActionState {}

final class HomeProductItemWishlistedActionState extends HomeActionState {}

final class HomeProductItemCartlistedActionState extends HomeActionState {}
