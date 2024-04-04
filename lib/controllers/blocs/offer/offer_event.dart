part of 'offer_bloc.dart';

class OfferEvent {}

class GetOffersEvent extends OfferEvent {
  final int categoryId;
  GetOffersEvent({required this.categoryId});
}

class AddOfferEvent extends OfferEvent {
  final OfferRequest offerRequest;
  AddOfferEvent({required this.offerRequest});
}
