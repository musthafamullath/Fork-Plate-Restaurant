part of 'offer_bloc.dart';

class OfferState {
   final List<OfferGet> offers;

  OfferState({required this.offers});

  
}

final class OfferInitial extends OfferState {
  OfferInitial():super(offers: []);
}

//getoffer
final class GetOfferSuccessState extends OfferState {
  GetOfferSuccessState({required List<OfferGet> offers}):super(offers: []);
 
}


final class GetOfferFieldState extends OfferState {
  GetOfferFieldState({required super.offers});
}

final class GetOfferErrorState extends OfferState {
  GetOfferErrorState({required super.offers});
}

//addoffer
final class AddOfferSuccessState extends OfferState {
  AddOfferSuccessState({required super.offers});
}

final class AddOfferInvalidInputs extends OfferState {
  AddOfferInvalidInputs({required super.offers});
}

final class AddOfferFailedToGetImageFromForm extends OfferState {
  AddOfferFailedToGetImageFromForm({required super.offers});
}

final class AddOfferFailedToParseBody extends OfferState {
  AddOfferFailedToParseBody({required super.offers});
}

final class AddOfferFailedToOpenFilePathInServer extends OfferState {
  AddOfferFailedToOpenFilePathInServer({required super.offers});
}

final class AddOfferFailedToUploadFileToCloud extends OfferState {
  AddOfferFailedToUploadFileToCloud({required super.offers});
}

final class AddOfferFailedToDeleteTempImage extends OfferState {
  AddOfferFailedToDeleteTempImage({required super.offers});
}

final class AddOfferErrorOccuredWhileCreatingOffer extends OfferState {
  AddOfferErrorOccuredWhileCreatingOffer({required super.offers});
}

final class AddOfferErrorState extends OfferState {
  AddOfferErrorState({required super.offers});
}
