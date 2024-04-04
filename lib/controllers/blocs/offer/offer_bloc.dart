import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:foodie_fly_restaurant/controllers/api_services/offers/api_calling.dart';
import 'package:foodie_fly_restaurant/models/offer.dart';
part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferInitial()) {
    on<GetOffersEvent>(getAllOffersEvent);
    on<AddOfferEvent>(addOfferEvent);
  }

  FutureOr<void> getAllOffersEvent(
      GetOffersEvent event, Emitter<OfferState> emit) async {
    final offers = await OfferApiServices().getAllOffers(event.categoryId);
    if (offers.isNotEmpty) {
      emit(GetOfferSuccessState(offers: offers));
    } else {
      if (offers == []) {
        emit(GetOfferFieldState(offers: []));
      } else {
        emit(GetOfferErrorState(offers: []));
      }
    }
  }


  FutureOr<void> addOfferEvent(AddOfferEvent event, Emitter<OfferState> emit)async {
    final offers = await OfferApiServices().addOffer(event.offerRequest);
    if(offers == "offer created successfully"){
      emit(AddOfferSuccessState(offers: []));
    }else if(offers == "invalid inputs"){
      emit(AddOfferInvalidInputs(offers: []));
    }else if(offers == "failed to get image from form"){
      emit(AddOfferFailedToGetImageFromForm(offers: []));
    }else if(offers == "failed to parse body"){
      emit(AddOfferFailedToParseBody(offers: []));
    }else if(offers == "failed to open file path in server"){
      emit(AddOfferFailedToOpenFilePathInServer(offers: []));
    }else if(offers == "failed to upload file to cloud"){
      emit(AddOfferFailedToUploadFileToCloud(offers: []));
    }else if(offers == "failed to delete temp image"){
      emit(AddOfferFailedToDeleteTempImage(offers: []));
    }else if(offers == "error occured while creating offer"){
      emit(AddOfferErrorOccuredWhileCreatingOffer(offers: []));
    }else{
      emit(AddOfferErrorState(offers: []));
    }
  }
}
