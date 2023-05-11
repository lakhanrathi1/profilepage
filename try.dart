import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../src/data/payment_option/payment_constant.dart';
import '../../../../../src/presentation/common_widgets/all_common_widgets.dart';
import '../../../../../src/presentation/features/package_cart/bloc/package_cart_event.dart';
import '../../../../../src/presentation/features/package_cart/bloc/package_cart_state.dart';
import '../../../../config/all_config.dart';
import '../../../../data/api_layer/all_services.dart';
import '../../../../domain/model/all_model.dart';
import '../../../../domain/utils/all_utils.dart';
import '../bloc/package_cart_bloc.dart';

class PackageCartScreen extends StatefulWidget {
  const PackageCartScreen({super.key});

  @override
  State<PackageCartScreen> createState() => _PackageCartScreenState();
}

class _PackageCartScreenState extends State<PackageCartScreen> {
  PackageCartBloc? bloc;
  String? packageId;
  double? price;
  double? amount;
  String? name;
  Map? data;
  bool isPromo = false;
  String? currency;
  double? width, height;
  int count = 1;
  TextEditingController promotionalCodeController = TextEditingController();
  double localInternalPadding = GlobalStyles.internalPadding;
  double localPagePadding = GlobalStyles.pagePadding;
  bool isPromocodeIsValid = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    width = GlobalConstant.deviceWidth; // gives width of device screen
    height = GlobalConstant.deviceHeight;
    bloc = BlocProvider.of<PackageCartBloc>(context);
    bloc?.add(const PackageCartLoad());
  }

  @override
  Widget build(BuildContext context) {
    currency = GlobalConstant.sarText;
    return KeyboardTapDown(
      childWidget: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: HeaderBar(
              title: S.current.CART_TITLE,
              backIconFlag: true,
              notificationIconFlag: true,
              locationBarTitle: "",
              locationBarFlag: false,
              chatIconFlag: false,
              bgColor: GlobalColors.white,
              titleAlignment: true,
              titleTextStyle: GlobalStyles.heading6DarkGreyTextStyle,
            ),
          ),
          backgroundColor: GlobalColors.white,
          body: BlocBuilder<PackageCartBloc, PackageCartState>(
              builder: (context, state) {
            return Stack(
              children: [
                BlocBuilder<PackageCartBloc, PackageCartState>(
                  builder: (context, state) {
                    amount = state.packageCart?.totalAmount;
                    return state.packageCart != null
                        ? state.packageCart!.packageCartModal != null &&
                                state.packageCart!.packageCartModal!.isNotEmpty
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.builder(
                                      physics: const ScrollPhysics(),
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: state.packageCart
                                          ?.packageCartModal!.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return Column(
                                          children: [
                                            cartItemView(
                                                state
                                                    .packageCart
                                                    ?.packageCartModal![index]
                                                    .name
                                                    .toString(),
                                                state
                                                    .packageCart
                                                    ?.packageCartModal![index]
                                                    .description
                                                    .toString(),
                                                currency.toString(),
                                                state
                                                    .packageCart
                                                    ?.packageCartModal![index]
                                                    .price
                                                    .toString(),
                                                bloc,
                                                index),
                                          ],
                                        );
                                      },
                                    ),
                                    if (GlobalConstant.isShowPromotionalCode)
                                      Container(
                                        margin: EdgeInsets.all(localPagePadding)
                                            .copyWith(top: 40, bottom: 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: InputFieldWithTitle(
                                                    S
                                                        .of(context)
                                                        .APPLY_PROMOTIONAL_CODE,
                                                    S
                                                        .of(context)
                                                        .APPLY_PROMOTIONAL_CODE,
                                                    controller:
                                                        promotionalCodeController,

                                                    textFieldHeight: 52,
                                                    // textType: TextInputType.number,
                                                    onTextChanged: (value) {
                                                      setState(() {
                                                        isPromocodeIsValid =
                                                            false;
                                                      });
                                                    },
                                                    textValidator: (v) {
                                                      return null;
                                                    },

                                                    decoration: BoxDecoration(
                                                        borderRadius: GlobalConstant
                                                                    .languageId ==
                                                                1
                                                            ? const BorderRadius.only(
                                                                topLeft:
                                                                    Radius.circular(
                                                                        6),
                                                                bottomLeft:
                                                                    Radius.circular(
                                                                        6))
                                                            : const BorderRadius.only(
                                                                topRight:
                                                                    Radius.circular(
                                                                        6),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                        6)),
                                                        border: Border.all(
                                                            color: GlobalColors.lightGrey,
                                                            width: 2)),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 52.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          GlobalColors.primary,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius: GlobalConstant
                                                                  .languageId ==
                                                              1
                                                          ? const BorderRadius
                                                                  .only(
                                                              topRight: Radius
                                                                  .circular(6),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          6))
                                                          : const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(6),
                                                              bottomLeft: Radius
                                                                  .circular(6)),
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          GlobalConstant
                                                              .icPromoCode,
                                                          color: GlobalColors
                                                              .white,
                                                          // height: 15,
                                                          // width: 15,
                                                        ),
                                                        const SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                            S
                                                                .of(context)
                                                                .APPLY
                                                                .toUpperCase(),
                                                            style: GlobalStyles
                                                                .headerBarWhiteTitleTextStyle
                                                                .merge(const TextStyle(
                                                                    color: GlobalColors
                                                                        .white))),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    if (promotionalCodeController
                                                        .text.isNotEmpty) {
                                                      bloc?.add(ApplyPromoCode(
                                                          promoCode:
                                                              promotionalCodeController
                                                                  .text));
                                                    } else {
                                                      setState(() {
                                                        isPromocodeIsValid =
                                                            true;
                                                      });
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                            Visibility(
                                              visible: promotionalCodeController
                                                      .text.isEmpty &&
                                                  isPromocodeIsValid,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 5),
                                                child: Text(
                                                  S
                                                      .of(context)
                                                      .INVALID_PROMOTIONAL_CODE,
                                                  style: const TextStyle(
                                                      color: GlobalColors.red,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    Container(
                                      margin: EdgeInsets.all(localPagePadding)
                                          .copyWith(bottom: 100),
                                      //padding: EdgeInsets.only(bottom: 50),
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: GlobalColors.lightGrey,
                                              width: 2)),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(
                                                localInternalPadding,
                                              ).copyWith(bottom: 0),
                                              child: Text(
                                                  S.current.PRICE_DETAILS,
                                                  style: GlobalStyles
                                                      .headerBarTitleTextStyle),
                                            ),
                                            const Divider(
                                              thickness: 1,
                                              color: GlobalColors.lightGrey,
                                            ),
                                            rowWidget(
                                                S.current.TOTAL_MRP,
                                                currency.toString(),
                                                state.packageCart!
                                                    .basicTotalAmount
                                                    .toString(),
                                                GlobalStyles
                                                    .heading8DarkGreyBoldTextStyle,
                                                GlobalStyles
                                                    .heading8DarkGreyBoldTextStyle,
                                                false),
                                            rowWidget(
                                                "${S.current.TAX_AMOUNT} ${GlobalConstant.bracketLeftSymbol}${state.packageCart!.vatTaxPercentage!.toInt().toString()}${GlobalConstant.percent}${GlobalConstant.bracketRightSymbol}",
                                                currency.toString(),
                                                state.packageCart!.vatTaxAmount
                                                    .toString(),
                                                GlobalStyles
                                                    .heading8DarkGreyBoldTextStyle,
                                                GlobalStyles
                                                    .heading8DarkGreyBoldTextStyle,
                                                false),
                                            if (state.isPromoCodeApplied!)
                                              rowWidget(
                                                  "${S.current.COUPON_DISCOUNT} ",
                                                  "$currency",
                                                  state
                                                      .packageCart!.vatTaxAmount
                                                      .toString(),
                                                  GlobalStyles
                                                      .heading8DarkGreyBoldTextStyle,
                                                  GlobalStyles
                                                      .heading8DarkGreyBoldTextStyle,
                                                  false,
                                                  isDiscount: true),
                                            const Divider(
                                              thickness: 1,
                                              color: GlobalColors.lightGrey,
                                            ),
                                            rowWidget(
                                                S.current.TOTAL_AMOUNT,
                                                currency.toString(),
                                                state.packageCart!.totalAmount
                                                    .toString(),
                                                GlobalStyles
                                                    .heading7DarkGreyTextStyle,
                                                GlobalStyles
                                                    .heading7DarkGreyTextStyle,
                                                true),
                                            const SizedBox(
                                              height:
                                                  GlobalStyles.internalPadding,
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              )
                            : Center(
                                child: Text(
                                S.current.EMPTY_CART_MESSAGE,
                                style: GlobalStyles.carTableValue,
                              ))
                        : const Center(child: LoaderCommon());
                  },
                ),
                Visibility(
                    visible: state.isPending!,
                    child: const Center(child: LoaderCommon()))
              ],
            );
          }),
          bottomSheet: SizedBox(
            height: 75,
            child: BlocListener<PackageCartBloc, PackageCartState>(
                listener: (context, state) {
              if (state.isSubscriptionCreated != null) {
                if (state.isSubscriptionCreated!) {
                  bloc?.add(
                      const UpdatePackageStatus(isSubscriptionCreated: false));
                  state.packageCart!.totalAmount != 0
                      ? callPaymentScreen(
                          state.packageCart!.basicTotalAmount.toString(),
                          state.packageCart!.vatTaxAmount.toString(),
                          state.packageCart!.totalAmount!,
                          currency.toString(),
                          state.packageCart!.packageCartModal!.isNotEmpty
                              ? state
                                  .packageCart!.packageCartModal![0].description
                                  .toString()
                              : "",
                          S.current.NUM_1,
                          state.packageCart!.packageCartModal!.isNotEmpty
                              ? state.packageCart!.packageCartModal![0].name
                                  .toString()
                              : "",
                          state.subscriptionInvoiceId!,
                          state.packageCart!.dealerShoppingCartId!)
                      : null;
                }
              }
            }, child: BlocBuilder<PackageCartBloc, PackageCartState>(
                    builder: (context, state) {
              isPromo = state.isPromoCodeApplied!;
              return Stack(
                children: [
                  state.packageCart != null
                      ? (state.packageCart != null &&
                              state.packageCart!.packageCartModal != null &&
                              state.packageCart!.packageCartModal!.isNotEmpty)
                          ? Container(
                              color: GlobalColors.white,
                              child: Padding(
                                padding: EdgeInsets.all(localPagePadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    bloc!.state.packageCart!.totalAmount != null
                                        ? Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Column(
                                              children: [
                                                GradientText(
                                                    GlobalConstant.languageId ==
                                                            1
                                                        ? "${currency.toString()} ${bloc!.state.packageCart!.totalAmount != null ? GlobalConstant.isDecimalAmountEnabled ? bloc!.state.packageCart!.totalAmount!.toStringAsFixed(2).toString() : bloc!.state.packageCart!.totalAmount.toString().toCurrencyFromDouble() : 0}"
                                                        : "${bloc!.state.packageCart!.totalAmount != null ? GlobalConstant.isDecimalAmountEnabled ? bloc!.state.packageCart!.totalAmount.toString() : bloc!.state.packageCart!.totalAmount.toString().toCurrencyFromDouble() : 0} ${currency.toString()}",
                                                    maxLine: 2,
                                                    gradient:
                                                        const LinearGradient(
                                                            colors: <Color>[
                                                          GlobalColors.warning,
                                                          GlobalColors.error
                                                        ],
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            tileMode:
                                                                TileMode.clamp,
                                                            transform:
                                                                GradientRotation(
                                                                    1.6)),
                                                    style: GlobalStyles
                                                        .carTableValue),
                                                RichText(
                                                  text: TextSpan(
                                                    text: "",
                                                    style: DefaultTextStyle.of(
                                                            context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: S.current
                                                              .VIEW_DETAILS,
                                                          style: GlobalStyles
                                                              .heading8PrimaryBoldTextStyle
                                                              .merge(const TextStyle(
                                                                  color: GlobalColors.primary)),
                                                          recognizer: TapGestureRecognizer()
                                                            ..onTap = () => showModalBottomSheet(
                                                                backgroundColor: GlobalColors.white,
                                                                context: context,
                                                                isScrollControlled: true,
                                                                useRootNavigator: true,
                                                                elevation: 10,
                                                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(GlobalStyles.modalCircularBorderRadius), topRight: Radius.circular(GlobalStyles.modalCircularBorderRadius))),
                                                                builder: (context) {
                                                                  return Container(
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        top: 30,
                                                                        left: GlobalStyles
                                                                            .globalHorizontalPadding,
                                                                        right: GlobalStyles
                                                                            .globalHorizontalPadding,
                                                                        bottom:
                                                                            30),
                                                                    height: isPromo
                                                                        ? 250
                                                                        : 230,
                                                                    child: Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.all(
                                                                              localInternalPadding,
                                                                            ).copyWith(bottom: 20),
                                                                            child:
                                                                                Text(S.current.PRICE_DETAILS, style: GlobalStyles.headerBarTitleTextStyle),
                                                                          ),
                                                                          rowWidget(
                                                                              S.current.TOTAL_MRP,
                                                                              currency.toString(),
                                                                              bloc!.state.packageCart!.basicTotalAmount.toString(),
                                                                              GlobalStyles.heading8DarkGreyBoldTextStyle,
                                                                              GlobalStyles.heading8DarkGreyBoldTextStyle,
                                                                              false),
                                                                          rowWidget(
                                                                              "${S.current.TAX_AMOUNT} ${GlobalConstant.bracketLeftSymbol}${state.packageCart!.vatTaxPercentage!.toInt().toString()}${GlobalConstant.percent}${GlobalConstant.bracketRightSymbol}",
                                                                              currency.toString(),
                                                                              bloc!.state.packageCart!.vatTaxAmount.toString(),
                                                                              GlobalStyles.heading8DarkGreyBoldTextStyle,
                                                                              GlobalStyles.heading8DarkGreyBoldTextStyle,
                                                                              false),
                                                                          if (isPromo)
                                                                            rowWidget(
                                                                                "${S.current.COUPON_DISCOUNT} ",
                                                                                "$currency",
                                                                                bloc!.state.packageCart!.vatTaxAmount.toString(),
                                                                                GlobalStyles.heading8DarkGreyBoldTextStyle,
                                                                                GlobalStyles.heading8DarkGreyBoldTextStyle,
                                                                                false,
                                                                                isDiscount: true),
                                                                          // SizedBox(
                                                                          //   height: GlobalConstant
                                                                          //       .internalPadding,
                                                                          // ),
                                                                          const Divider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                GlobalColors.lightGrey,
                                                                          ),
                                                                          rowWidget(
                                                                              S.current.TOTAL_AMOUNT,
                                                                              currency.toString(),
                                                                              bloc!.state.packageCart!.totalAmount.toString(),
                                                                              GlobalStyles.heading7DarkGreyTextStyle,
                                                                              GlobalStyles.heading7DarkGreyTextStyle,
                                                                              true),
                                                                          const Divider(
                                                                            thickness:
                                                                                1,
                                                                            color:
                                                                                GlobalColors.lightGrey,
                                                                          ),
                                                                          Container(
                                                                            color:
                                                                                GlobalColors.white,
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(top: 5),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  bloc!.state.packageCart!.totalAmount != null
                                                                                      ? Center(
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                                                                                            child: GradientText(
                                                                                              GlobalConstant.languageId == 1 ? "${currency.toString()} ${bloc!.state.packageCart!.totalAmount != null ? bloc!.state.packageCart!.totalAmount!.toStringAsFixed(2).toString() : 0}" : "${bloc!.state.packageCart!.totalAmount != null ? bloc!.state.packageCart!.totalAmount.toString().toCurrencyFromDouble() : 0} ${currency.toString()}",
                                                                                              maxLine: 2,
                                                                                              gradient: const LinearGradient(colors: <Color>[
                                                                                                GlobalColors.warning,
                                                                                                GlobalColors.error,
                                                                                              ], begin: Alignment.topLeft, end: Alignment.bottomRight, tileMode: TileMode.clamp, transform: GradientRotation(1.6)),
                                                                                              style: GlobalStyles.carTableValue,
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Container(),
                                                                                  ButtonCommon(
                                                                                    btnBackColor: bloc!.state.packageCart!.totalAmount != 0 ? GlobalColors.brandColor : GlobalColors.lightGrey,
                                                                                    btnBorderColor: bloc!.state.packageCart!.totalAmount != 0 ? GlobalColors.brandColor : GlobalColors.lightGrey,
                                                                                    width: width! / 1.8,
                                                                                    title: S.current.CHECKOUT,
                                                                                    titleStyle: GlobalStyles.heading3TitleWhiteTextStyle,
                                                                                    onTap: () {
                                                                                      bloc?.add(CreateSubscription(ShoppingCartId: bloc!.state.packageCart!.dealerShoppingCartId!));
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ]),
                                                                  );
                                                                }))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    ButtonCommon(
                                      btnBackColor:
                                          state.packageCart!.totalAmount != 0
                                              ? GlobalColors.primary
                                              : GlobalColors.lightGrey,
                                      btnBorderColor:
                                          state.packageCart!.totalAmount != 0
                                              ? GlobalColors.primary
                                              : GlobalColors.lightGrey,
                                      width: width! / 1.8,
                                      title: S.current.CHECKOUT,
                                      titleStyle: GlobalStyles
                                          .heading3TitleWhiteTextStyle,
                                      onTap: () {
                                        bloc?.add(CreateSubscription(
                                            ShoppingCartId: state.packageCart!
                                                .dealerShoppingCartId!));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 0,
                              height: 0,
                            )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  Container()
                ],
              );
            })),
          )),
    );
  }

  Widget cartItemView(
      String? packageName,
      String? description,
      String? currencyType,
      String? currency,
      PackageCartBloc? bloc,
      int index) {
    return Container(
      margin: EdgeInsets.all(
        localPagePadding,
      ).copyWith(bottom: 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: GlobalColors.lightGrey, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GlobalConstant.isShowImageForPackage
              ? Container(
                  padding: const EdgeInsets.all(16),
                  margin: GlobalConstant.langCode == GlobalConstant.arText
                      ? EdgeInsets.only(left: localInternalPadding)
                      : EdgeInsets.only(right: localInternalPadding),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: GlobalColors.lightGrey, width: 2),
                    color: GlobalColors.white,
                  ),
                  child: SvgPicture.asset(
                    GlobalConstant.icCartPackage,
                    width: 40,
                    height: 50,
                  ),
                )
              : Container(),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(packageName!,
                        style: GlobalStyles.heading6DarkGreyTextStyle
                            .merge(const TextStyle(height: 1.5))),
                  ),
                  Container(
                    child: Text(description!,
                        maxLines: 3,
                        style: GlobalStyles.descriptionGreyRegularTextStyle
                            .merge(const TextStyle(height: 1.5))),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Container(
                    child: GradientText(
                        (GlobalConstant.languageId == 1)
                            ? "$currencyType ${GlobalConstant.isDecimalAmountEnabled ? double.parse(currency!).toStringAsFixed(2) : currency!.toCurrencyFromDouble()}"
                            : "${GlobalConstant.isDecimalAmountEnabled ? double.parse(currency!).toStringAsFixed(2) : currency!.toCurrencyFromDouble()} $currencyType",
                        maxLine: 2,
                        gradient: const LinearGradient(
                            colors: <Color>[
                              GlobalColors.warning,
                              GlobalColors.error
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            tileMode: TileMode.clamp,
                            transform: GradientRotation(1.6)),
                        style: GlobalStyles.carTableValue),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              bloc?.add(PackageCartDelete(
                  ShoppingCartId: bloc.state.packageCart!
                      .packageCartModal![index].shoppingCartId!,
                  ShoppingCartItemId: bloc.state.packageCart!
                      .packageCartModal![index].shoppingCartItemId!,
                  index: index));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  padding: (GlobalConstant.langCode == 'ar')
                      ? const EdgeInsets.only(right: 10, left: 2, bottom: 10)
                      : const EdgeInsets.only(left: 10, right: 2, bottom: 10),
                  child: SvgPicture.asset(
                    GlobalConstant.icDelete,
                    color: GlobalColors.darkGrey1,
                    height: 15,
                    width: 15,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void callPaymentScreen(
      String amount,
      String vat,
      double totalAmount,
      String currency,
      String description,
      String qty,
      String packageName,
      int subscriptionInvoiceId,
      int shopCartId) async {
    String email = await StorageService().readSecureData(SecureStorage.email);
    String mobileNumber =
        await StorageService().readSecureData(SecureStorage.mobileNumber);
    String name = await StorageService().readSecureData(SecureStorage.fullName);
    if (email.isNotEmpty && mobileNumber.isNotEmpty && name.isNotEmpty) {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(RouteConstant.paymentScreen,
                arguments: PaymentScreenModel(
                    totalAmount: totalAmount,
                    amount: amount,
                    vat: vat,
                    currency: currency,
                    description: description,
                    qty: qty,
                    name: name,
                    email: email,
                    mobileNumber: mobileNumber,
                    packageName: packageName,
                    shoppingCartId: shopCartId,
                    subscriptionInvoiceId: subscriptionInvoiceId))
            .then((value) {
          if (value != null) {
            PaymentScreenModel model = value as PaymentScreenModel;
            if (model.status == PaymentConstant.success) {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(RouteConstant.invoiceScreen, arguments: value)
                  .then((value) {
                if (value != null) {
                  Navigator.pop(context, value);
                }
              }).catchError((onError) {});
            } else {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(RouteConstant.paymentFailure, arguments: value)
                  .then((value) {
                Navigator.pop(context);
              }).catchError((onError) {});
            }
          }
        }).catchError((onError) {});
      }
    }
  }

  Widget rowWidget(String text1, String currencyType, String text2,
      TextStyle textStyle, TextStyle textStyle1, bool isGradientText,
      {isDiscount = false}) {
    return Padding(
      padding: EdgeInsets.all(localInternalPadding)
          .copyWith(top: 0, bottom: isGradientText ? 0 : localInternalPadding),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text1,
          style: textStyle,
        ),
        Row(
          children: [
            (GlobalConstant.languageId == 1)
                ? !isGradientText
                    ? Text(
                        (!isDiscount)
                            ? currencyType
                            : GlobalConstant.hyphen +
                                GlobalConstant.spacer +
                                currencyType,
                        style: textStyle1)
                    : GradientText(currencyType,
                        gradient: const LinearGradient(
                            colors: <Color>[
                              GlobalColors.warning,
                              GlobalColors.error
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            tileMode: TileMode.clamp,
                            transform: GradientRotation(1.6)),
                        style: textStyle1)
                : Container(),
            // Text(GlobalConstant.spacer, style: textStyle1),
            Text(GlobalConstant.spacer, style: textStyle1),
            !isGradientText
                ? (GlobalConstant.languageId == 2 && isDiscount)
                    ? Text(
                        "${GlobalConstant.hyphen}${GlobalConstant.spacer}${GlobalConstant.isDecimalAmountEnabled == true ? double.parse(text2).toStringAsFixed(2).toString() : text2.toCurrencyFromDouble()}",
                        style: textStyle1)
                    : Text(
                        GlobalConstant.isDecimalAmountEnabled == true
                            ? double.parse(text2).toStringAsFixed(2).toString()
                            : text2.toCurrencyFromDouble(),
                        style: textStyle1)
                : GradientText(
                    GlobalConstant.isDecimalAmountEnabled == true
                        ? double.parse(text2).toStringAsFixed(2).toString()
                        : text2.toCurrencyFromDouble(),
                    gradient: const LinearGradient(
                        colors: <Color>[
                          GlobalColors.warning,
                          GlobalColors.error
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        tileMode: TileMode.clamp,
                        transform: GradientRotation(1.6)),
                    style: textStyle1),
            Text(GlobalConstant.spacer, style: textStyle1),
            (GlobalConstant.languageId == 2)
                ? !isGradientText
                    ? Text(currencyType, style: textStyle1)
                    : GradientText(currencyType,
                        gradient: const LinearGradient(
                            colors: <Color>[
                              GlobalColors.warning,
                              GlobalColors.error
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            tileMode: TileMode.clamp,
                            transform: GradientRotation(1.6)),
                        style: textStyle1)
                : Container(),
          ],
        )
      ]),
    );
  }
}
