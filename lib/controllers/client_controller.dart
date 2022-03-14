import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shop_app/controllers/client_repository.dart';
import 'package:shop_app/controllers/firebase_auth_controller.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/client.dart';

class ClientController extends GetxController {
  final IClientRepository clientRepository;

  ClientController({
    required this.clientRepository,
  });

  final FirebaseAuthController firebaseAuthController =
      Get.find<FirebaseAuthController>();
  //final RemoteConfigSetup _remoteConfigSetup = Get.find<RemoteConfigSetup>();

  Rxn<Client> _client = Rxn<Client>();
  RxBool clientLoading = true.obs;
  RxBool noClient = true.obs;

  Client? get client => this._client.value;

  Rxn<Client> get clientStream => this._client;

  set client(Client? client) => this._client.value = client;
  RxBool init = RxBool(false);
  RxDouble cartCount = RxDouble(0);
  //RemoteConfigSetup remoteConfigSetup = Get.put(
  //  RemoteConfigSetup(),
  //);

  @override
  void onInit() {
    print('remoteConfigSetup.infoBannerText');
    //print(remoteConfigSetup.infoBannerText);
    //remoteConfigSetup.remoteConfig.setDefaults(<String, dynamic>{
    //  'info_banner_text': 'default welcome',
    // });
    print('show');
    super.onInit();
    firebaseAuthController.user.listenAndPump((event) => loadClient());

    /*init.listenAndPump((event) async {
      if (event) {
        print(Get.currentRoute);
        if (Get.currentRoute == '/') {
          final box = GetStorage();
          if (box.read('showOpening') == 'true' ||
              box.read('showOpening') == null) {
            Get.offAll(() => OpeningScreen());
          } else {
            Get.offAll(() => MainPage());
          }
        }
      }
    });*/
  }

  bool get isUserFullyRegistered {
    if (client is Client) {
      if (firebaseAuthController.user.value!.phoneNumber == null ||
          firebaseAuthController.user.value!.phoneNumber!.isEmpty) {
        return false;
      }
      if (!firebaseAuthController.user.value!.emailVerified) {
        return false;
      }

      return true;
    }

    return false;
  }

  bool get isUserAnonimous {
    if (firebaseAuthController.user.value != null &&
        firebaseAuthController.user.value!.isAnonymous) {
      return true;
    }

    return false;
  }

  // Set consumer data on SignUp
  // If authed by firestore and consumer data already created set to it or set to blank for use before auth started
  Future setClientData({required Client newClient}) async {
    if (client is Client) {
      await clientRepository.setClient(
          client:
              newClient.copyWith(authid: client!.authid, uuid: client!.uuid));
      client = newClient.copyWith(authid: client!.authid, uuid: client!.uuid);
    } else {
      clientBlank = newClient;
    }
    cartCount.value = getCartCount();
  }

  Client clientBlank = Client(
      authid: 'firebaseAuthController.user.value!.uid',
      firstname: '',
      secondName: '',
      email: '',
      birthday: DateTime.now(),
      language: 'English',
      favouriteModel: [],
      photoURL:
          'https://firebasestorage.googleapis.com/v0/b/point-citi.appspot.com/o/avatars%2Fdefault_logo.png?alt=media&token=fd454756-b512-4c2f-8f7c-3a585eb1afad',
      smsNotificationsEnabled: true,
      emailNotificationsEnabled: true,
      phoneNumber: '',
      phoneNumberCountryCode: '',
      phoneNumberWithoutCounty: '',
      cardTokens: []);

  loadClient() async {
    if (firebaseAuthController.user.value is User &&
        !firebaseAuthController.user.value!.isAnonymous) {
      // Load from db
      Client? lclient;
      try {
        lclient = await clientRepository.clientByAuthuid(
            uid: firebaseAuthController.user.value!.uid);
      } catch (e) {
        print('No client');
        noClient.value = true;
        print(e);
      }

      // If no consumer in db creates new
      if (lclient is Client) {
        client = lclient;
        print('Client data loaded');
        clientLoading.value = false;
        noClient.value = false;

        print(client);
      } else {
        Client newClient = clientBlank.copyWith(
            authid: firebaseAuthController.user.value!.uid);

        clientRepository.setClient(client: newClient);

        client = newClient;

        print('Created new Client dataclass');
      }
    } else {
      client = null;
      noClient.value = true;

      print('Client cleared');
      clientLoading.value = false;
    }
    clientLoading.value = false;

    print(_client);
    cartCount.value = getCartCount();
    init.value = true;
  }

  List<String> separateName(String fullname) {
    return fullname.split(' ');
  }

  /* Future<bool> checkRelevanceOfVersion(RemoteConfigSetup remoteConfigSetup,
      String checkVersion, bool checkForMinRequired) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionUser = packageInfo.version;

    int version1Number = getExtendedVersionNumber(versionUser); // return 102003
    int version2Number = getExtendedVersionNumber(checkVersion);

    if ((checkForMinRequired ? version1Number : version2Number) >=
        (checkForMinRequired ? version2Number : version1Number)) {
      return true;
    } else {
      return false;
    }
  }*/

  int getExtendedVersionNumber(String version) {
    // Note that if you want to support bigger version cells than 99,
    // just increase the returned versionCells multipliers
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 10000 + versionCells[1] * 100 + versionCells[2];
  }

  addProductToCard(Product product) async {
    List<Cart> _cartList = client!.cardTokens;
    bool needAdd = true;
    for (Cart cart in _cartList) {
      if (cart.product == product) {
        needAdd = false;
        cart = cart.copyWith(numOfItem: cart.numOfItem + 1);
      }
    }
    if (needAdd) {
      _cartList.add(Cart(product: product, numOfItem: 1));
    }
    setClientData(newClient: client!.copyWith(cardTokens: _cartList));
  }

  removeProductFromCard(Product product) async {
    List<Cart> _cartList = client!.cardTokens;
    bool needAdd = true;
    for (Cart cart in _cartList) {
      if (cart.product == product && cart.numOfItem > 1) {
        needAdd = false;
        cart = cart.copyWith(numOfItem: cart.numOfItem - 1);
      }
    }
    if (needAdd) {
      _cartList.removeWhere((element) => element.product == product);
    }
    setClientData(newClient: client!.copyWith(cardTokens: _cartList));
  }

  double getCartCount() {
    double count = 0;
    for (Cart cart in client!.cardTokens) {
      count += cart.product.price * cart.numOfItem;
    }
    return count;
  }
}
