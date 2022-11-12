import 'package:dartz/dartz.dart';
import 'package:you_cook/core/error/failure.dart';
import 'package:you_cook/features/relish/domain/entities/offer.dart';

abstract class OfferRepository {
  Future<Either<Failure, List<Offer>>> getAllOffers();
}
