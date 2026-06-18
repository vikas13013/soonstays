import 'package:get/get.dart';
import 'package:soonstays/core/constants/app_strings.dart';

import '../../../../core/constants/app_urls.dart';

class FaqController extends GetxController {
  //TODO: Implement FaqController


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  final faqList = <dynamic>[
    {
      "title":AppStrings.howDoICreateABookingThroughSoonstays,
      "sub_title":AppStrings.youCanEasilyBookYourStayUsingAnyOf,
      "sub_title2":AppStrings.yourBookingIsConfirmedOncePaymentIsCompleted,
      'faq':[
        '${AppStrings.visitOurWebsite}${AppUrls.websiteSoonStays}',
        '${AppStrings.callOurCustomerSupportHelpline}${AppUrls.phoneNumber}',
        '${AppStrings.contactUsViaEmailAt}${AppUrls.supportEmail}'
      ]
    },
    {
      "title":AppStrings.whatIdProofIsRequiredAtCheckIn,
      "sub_title":AppStrings.guestsMustCarryAValidGovernmentIssued,
      "sub_title2":AppStrings.yourBookingIsConfirmedOncePaymentIsCompleted,
      'faq':[
        (AppStrings.aadhaarCard),
        (AppStrings.passport),
        (AppStrings.voterId),
        (AppStrings.drivingLicence),
        (AppStrings.panCardIsNotAcceptedAsValidIdProof),
      ]
    },
    {
      "title":AppStrings.howCanICheckMyBookingStatus,
      "sub_title":AppStrings.youCanCheckYourBookingDetailsBy,
      "sub_title2":"",
      'faq':[
        (AppStrings.loggingIntoYourSoonstaysAccountAndOpening),
        '${AppStrings.callingOurSupportNumber} ${AppUrls.phoneNumber}',
        '${AppStrings.emailingUsAt} ${AppUrls.supportEmail}'
      ]
    },
    {
      "title":AppStrings.whatAreTheStandardCheckInAndCheckout,
      "sub_title":AppStrings.standardTimingsAreGenerally,
      "sub_title2":"",
      'faq':[
        (AppStrings.checkIn1200PM),
        (AppStrings.checkOut1100AM),
        (AppStrings.timingsMayVaryDependingOnTheHotel)
      ]
    },
    {
      "title":AppStrings.howDoICancelMyBooking,
      "sub_title":AppStrings.youCanCancelYourReservationBy,
      "sub_title2":"",
      'faq':[
        '${AppStrings.contactingOurSupportTeamAt} ${AppUrls.phoneNumber}',
        '${AppStrings.sendingACancellationRequestTo} ${AppUrls.supportEmail}',
        (AppStrings.usingTheMyBookingsSection),
        (AppStrings.cancellationEligibilityDependsOn)
      ]
    },
    {
      "title":AppStrings.whatIsTheCancellationAndRefundPolicy,
      "sub_title":AppStrings.generalCancellationRulesMayInclude,
      "sub_title2":"",
      'faq':[
        (AppStrings.moreThan24HoursBeforeCheckIn),
        (AppStrings.within24HoursOfCheckIn),
        (AppStrings.refundsWhenApprovedAreUsuallyProcessedWithin)
      ]
    },
    {
      "title":AppStrings.whatHappensIfIDontShowUpAtTheHotel,
      "sub_title":AppStrings.ifYouDoNotCancelYourBookingAndFail,
      "sub_title2":"",
      'faq':[]
    },
    {
      "title":AppStrings.howCanIUpdateMyAccountInformation,
      "sub_title":AppStrings.youCanUpdateYourProfileDetailsByLoggingInto,
      "sub_title2":"",
      'faq':[]
    },
    {
      "title":AppStrings.iOwnAHotelHowCanIPartnerWithSoonstays,
      "sub_title":AppStrings.hotelOwnersInterestedInPartneringWithSoonstaysCan,
      "sub_title2":"",
      'faq':[
        "${AppStrings.emailUsAt} ${AppUrls.supportEmail}",
        "${AppStrings.call} ${AppUrls.phoneNumber}",
        (AppStrings.ourPartnershipTeamWillGuideYouThroughThe),
      ]
    },
    {
      "title":AppStrings.isLuggageStorageAvailableInRooms,
      "sub_title":AppStrings.mostPartnerHotelsProvideCupboards,
      "sub_title2":"",
      'faq':[]
    },
    {
      "title":AppStrings.isParkingAvailableAtSoonstaysProperties,
      "sub_title":AppStrings.parkingFacilitiesDependOnTheIndividualHotel,
      "sub_title2":"",
      'faq':[]
    },
    {
      "title":AppStrings.isAnExtraBedAvailable,
      "sub_title":AppStrings.extraMattressesOrBedsMayBeProvidedAtSelect,
      "sub_title2":"",
      'faq':[]
    },
    {
      "title":AppStrings.whatPaymentMethodsAreAccepted,
      "sub_title":AppStrings.youCanPayUsing,
      "sub_title2":"",
      'faq':[
        (AppStrings.creditCardAndDebitCard),
        (AppStrings.UPI),
        (AppStrings.netBanking),
        (AppStrings.digitalWallets),
        (AppStrings.payAtHotelSelectedPropertiesOnly),
      ]
    },
  ].obs;

}
