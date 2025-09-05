part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class WishlistInitialEvent extends WishlistEvent {}

final class WishlistRemoveEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveEvent({required this.productDataModel});
}
