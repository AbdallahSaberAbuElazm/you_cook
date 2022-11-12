import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/offer.dart';
import 'package:you_cook/features/relish/domain/repositories/offer_repository.dart';

class GetAllOfferUsecase {
  final OfferRepository offerRepository;

  GetAllOfferUsecase(this.offerRepository);

  Future<Either<Failure, List<Offer>>> call() async {
    return await offerRepository.getAllOffers();
  }
}
