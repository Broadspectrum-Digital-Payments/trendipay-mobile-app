import 'package:bdp_payment_app/common/widgets/button/button.dart';
import 'package:bdp_payment_app/common/widgets/common_widgets.dart';
import 'package:bdp_payment_app/src/feature/auth/presentation/widgets/checkbox.dart';
import 'package:bdp_payment_app/features/mainscreens/controllers/wallet_controllers.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/top_up/top-up.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/top_up/top_up_screens/wallet_top_up_details.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_blocs.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_events.dart';
import 'package:bdp_payment_app/features/mainscreens/screens/wallets/wallet_blocs/wallet_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/models/wallet_model.dart';
import '../../../../src/shared_widgets/common/authheaders.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_strings.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/text_strings.dart';
import '../select_card_screen/select_card.dart';
import '../select_card_screen/widgets/add_card_textfields.dart';

class SelectWalletScreen extends StatefulWidget {
  const SelectWalletScreen({super.key});

  @override
  State<SelectWalletScreen> createState() => _SelectWalletScreenState();
}

class _SelectWalletScreenState extends State<SelectWalletScreen> {

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController walletNameCtrl = TextEditingController();
  TextEditingController mobileNetworkCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();

  String? selectedNetwork = "";

  bool useWallerForFuture = false;


  WalletBloc? bloc;
  @override
  void initState() {
    // TODO: implement initState
    bloc = context.read<WalletBloc>();
    super.initState();
  }


  setUseWalletForFuture(bool value) {
    setState(() {
      useWallerForFuture = value;
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    bloc?.add(ResetDataEvent());
    super.dispose();

  }

  @override
  void didChangeDependencies() {
    bloc = context.read<WalletBloc>();
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title:
                  AuthHeader(icon: BDPImages.bdpIcon, title: BDPTexts.selectWallet),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, size: 24),
                onPressed: () {
                  Get.back();
                },
              ),
              actions: [
                if (state.savedWallets.isNotEmpty) GestureDetector(
                  onTap: (){
                    _showAddWalletModal();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: BDPColors.primary
                    ),
                    child: Icon(Icons.add, color: Colors.white,),
                  ),
                )   
              ],
            ),
            body: state.savedWallets.isEmpty ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(BDPSizes.defaultSpace),
                child: Column(
                  children: [
                    Image.asset(BDPImages.addWallet),
                    const SizedBox(height: BDPSizes.spaceBtwItems),
                    const Text(
                      textAlign: TextAlign.center,
                      BDPTexts.selectWalletTitle,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: BDPSizes.spaceBtwSections * 5,
                    ),
                    SizedBox(
                      width: 162,
                      height: 40,
                      child: Buttons(
                          buttonName: BDPTexts.addWallet,
                          image: BDPImages.add,
                          onPressed: () {
                            _showAddWalletModal();
                          }),
                    ),
                  ],
                ),
              ),
            ) : ListView.separated(
              itemCount: state.savedWallets.length,
                itemBuilder: (context, index) {
                var item = state.savedWallets[index];
                  return GestureDetector(
                    onTap: (){
                      context.read<WalletBloc>().add(GetCurrentWalletEvent(model: item));
                      Get.to(()=> TopUpWalletDetailsScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.walletName ?? "",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: BDPSizes.spaceBtwSections * 0.2,
                              ),
                              Text(
                                item.walletNetwork ?? "",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(
                                height: BDPSizes.spaceBtwSections * 0.2,
                              ),
                              Text(
                                item.phoneNumber ?? "",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                  indent: 16,
                  endIndent: 16,
                );
            },),
        );
      }
    );
  }
  void _showAddWalletModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<WalletBloc, WalletState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: BDPColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: const Text(
                          BDPTexts.addWallet,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: BDPColors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(BDPSizes.defaultSpace),
                          child: Column(
                            children: [
                              AddCardTextfields(
                                label: BDPTexts.walletName,
                                enabled: state.submitData == false,
                                controller: walletNameCtrl,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return "Wallet name field must not be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                },
                              ),
                              getNetworkTypeWidget((value) {
                                setState(() {
                                  mobileNetworkCtrl.text = value!;
                                });
                              }),
                              AddCardTextfields(
                                label: BDPTexts.phoneNo,
                                enabled: state.submitData == false,
                                controller: phoneCtrl,
                                validator: (value){
                                  if (value == null || value.isEmpty) {
                                    return "Phone number field must not be empty";
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                },
                              ),
                              const SizedBox(
                                height: BDPSizes.spaceBtwSections,
                              ),
                              Row(
                                children: [
                                  ARCheckbox(
                                    value: state.saveWalletForFuture,
                                    onChanged: (value){
                                      context.read<WalletBloc>().add(SaveWalletEvent(value: value!));
                                    },
                                  ),
                                  const Text(
                                    BDPTexts.allowWallets,
                                    style:
                                    TextStyle(fontSize: 12, color: BDPColors.primary),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: BDPSizes.spaceBtwItems,
                              ),
                              SizedBox(
                                  width: 180.w,
                                  height: 50.h,
                                  child: Buttons(
                                    buttonName: BDPTexts.saveWallet,
                                    image: BDPImages.saveIcon,
                                    onPressed: () {
                                      WalletModel wallet = WalletModel(
                                        walletName: walletNameCtrl.text,
                                        walletNetwork: mobileNetworkCtrl.text,
                                        phoneNumber: phoneCtrl.text,
                                        futureUse: useWallerForFuture
                                      );
                                      // controller.addAWallet(wallet);
                                      context.read<WalletBloc>().add(SaveWalletEvent(value: false!));
                                      phoneCtrl.text = "";
                                      walletNameCtrl.text = "";
                                      Get.back();
                                    },
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }
}










