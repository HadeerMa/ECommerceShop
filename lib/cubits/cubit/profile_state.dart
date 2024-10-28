abstract class ProfileState {}

class profileInitialestate extends ProfileState {}

class bottomnavindexState extends ProfileState {}

class profileSuccessstate extends ProfileState {}

class profileLoadingstate extends ProfileState {}

class profileErrorstate extends ProfileState {
  String message;
  profileErrorstate({required this.message});
}

class BannerSuccessstate extends ProfileState {}

class BannerLoadingstate extends ProfileState {}

class BannerErrorstate extends ProfileState {}

class CategorySuccessstate extends ProfileState {}

class CategoryLoadingstate extends ProfileState {}

class CategoryErrorstate extends ProfileState {}

class ProductSuccessstate extends ProfileState {}

class ProductLoadingstate extends ProfileState {}

class ProductErrorstate extends ProfileState {}

class FilterProductSuccessstate extends ProfileState {}

class FavoriteSuccessstate extends ProfileState {}

class FavoriteLoadingstate extends ProfileState {}

class FavoriteErrorstate extends ProfileState {}

class addFavoriteSuccessstate extends ProfileState {}

class addFavoriteLoadingstate extends ProfileState {}

class addFavoriteErrorstate extends ProfileState {}

class CartsSuccessstate extends ProfileState {}

class CartsLoadingstate extends ProfileState {}

class CartsErrorstate extends ProfileState {}

class addCartsSuccessstate extends ProfileState {}

class addCartsLoadingstate extends ProfileState {}

class addCartsErrorstate extends ProfileState {}

final class LogoutInitial extends ProfileState {}

final class LogoutLoading extends ProfileState {}

final class LoggedOutSuccess extends ProfileState {}

final class LogoutFailure extends ProfileState {}
