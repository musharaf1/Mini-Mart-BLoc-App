part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistInitialState extends WishlistState {}

final class WishlistActionState extends WishlistState {}

final class WishListSuccessState extends WishlistState {
  final List<ProductDataModel> wishlist;

  WishListSuccessState({required this.wishlist});
}
