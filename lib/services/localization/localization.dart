import 'dart:ui';

import 'package:get/get.dart';

class LocalizationService extends Translations {
  static final locale = Locale('en', 'US');

  static final langs = [
    'English',
    'Russian',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // button
          'BTN_continue': 'Continue',
          'BTN_back_home': 'Back to home',
          'BTN_see_more': 'See More',
          'BTN_add_cart': 'Add To Cart',
          'BTN_see_more_detail': 'See More Detail',
          'BTN_checkout': 'Check Out',
          'BTN_logout': 'Log Out',
          'BTN_apply': 'Apply',
          //splash
          'SP_title': 'Market Place',
          'SP_firstpage': 'Welcome to MarketPlace, Let’s shop!',
          'SP_secondpage':
              'We help people connect with store \naround the World',
          'SP_thirdpage':
              'We show the easy way to shop. \nJust stay at home with us',
          // sign in
          'SI_title': 'Sign In',
          'SI_welcome_back': 'Welcome Back',
          'SI_remember_me': 'Remember me',
          'SI_forgot_pass': 'Forgot Password',
          'SI_pass': 'Password',
          'SI_enter_pass': 'Enter your password',
          'SI_email': 'Email',
          'SI_enter_email': 'Enter your email',
          'SI_name': 'Name',
          'SI_enter_name': 'Enter your name',
          'SI_lastname': 'Second name',
          'SI_enter_lastname': 'Enter your second name',
          'SI_confirm_pass': 'Confirm Password',
          'SI_enter_confirm_pass': 'Re-enter your password',
          'SI_sign_email':
              'Sign in with your email and password  \nor continue with social media',
          'SI_dont_have_account': 'Don’t have an account? ',
          // sign up
          'SU_title': 'Sign Up',
          'SU_deal':
              'By continuing your confirm that you agree \nwith our Term and Condition',
          'SU_description':
              'Please enter your email and we will send \nyou a link to return to your account',
          // login success
          'LS_title': 'Login Success',
          // home
          'HS_discount_title': 'A Summer Surpise\n',
          'HS_discount': 'Cashback 20%',
          'HS_popular_products': 'Popular Products',
          'HS_search_product': 'Search product',
          'HS_special': 'Special for you',
          // profile
          'PF_title': 'Profile',
          'PF_complete_title': 'Complete Profile',
          'PF_complete_description':
              'Complete your details or continue  \nwith social media',
          'PF_address_title': 'Address',
          'PF_address_description': 'Enter your address',
          'PF_phone_title': 'Phone Number',
          'PF_phone_description': 'Enter your phone number',
          'PF_firstname_title': 'First Name',
          'PF_firstname_description': 'Enter your first name',
          'PF_lastname_title': 'Last Name',
          'PF_lastname_description': 'Enter your last name',
          'PF_my_account': 'My Account',
          'PF_notifications': 'Notifications',
          'PF_settings': 'Settings',
          'PF_help': 'Help Center',
          // favourite
          'FV_title': 'Your Favourite',
          // product
          'PR_title': 'All Products',
          'PR_categories_title': 'Categories',
          // settings
          'ST_title': 'Settings',
          // cart
          'CT_title': 'Your Cart',
          'CT_items': 'Items',
          'CT_total': 'Total',
          'CT_add_code': 'Add voucher code',
          // otp
          'OT_title': 'OTP Verification',
          'OT_sent': 'We sent your code to +1 898 860 ***',
          'OT_resent': 'Resend OTP Code',
          'OT_expired': 'This code will expired in ',
        },
        'ru_RU': {
          // button
          'BTN_continue': 'Продолжить',
          'BTN_back_home': 'Вернуться на главную страницу',
          'BTN_see_more': 'Узнать больше',
          'BTN_add_cart': 'В корзину',
          'BTN_see_more_detail': 'Узнать подробнее',
          'BTN_checkout': 'Проверить',
          'BTN_logout': 'Выйти',
          'BTN_apply': 'Применить',
          //splash
          'SP_title': 'Market Place',
          'SP_firstpage':
              'Добро пожаловать в MarketPlace, давайте делать покупки!',
          'SP_secondpage':
              'Мы помогаем людям связаться с магазином\nпо всему миру',
          'SP_thirdpage':
              'Мы показываем простой способ делать покупки. \nПросто оставайтесь с нами дома',
          // sign in
          'SI_title': 'Войти',
          'SI_welcome_back': 'Добро пожаловать',
          'SI_remember_me': 'Запомнить меня',
          'SI_forgot_pass': 'Забыли пароль',
          'SI_pass': 'Пароль',
          'SI_enter_pass': 'Введите ваш пароль',
          'SI_email': 'Email',
          'SI_enter_email': 'Введите ваш email',
          'SI_name': 'Имя',
          'SI_enter_name': 'Введите ваше имя',
          'SI_lastname': 'Фамилия',
          'SI_enter_lastname': 'Введите вашу фамилию',
          'SI_confirm_pass': 'Подвердить пароль',
          'SI_enter_confirm_pass': 'Введите еще раз пароль',
          'SI_sign_email':
              'Войдите с помощью имейл и пароль  \nили с помощью соц. сетей',
          'SI_dont_have_account': 'У вас нет аккаунта? ',
          // sign up
          'SU_title': 'Регистрация',
          'SU_deal':
              'Нажав продолжить вы подтверждаете что \nсогласны с нашими условиями',
          'SU_description':
              'Введите ваш email и мы отправим \nвам ссылку на изменение пароля',
          // login success
          'LS_title': 'Вы успешно вошли',
          // home
          'HS_discount_title': 'Летний подарок\n',
          'HS_discount': 'Кэшбек 20%',
          'HS_popular_products': 'Популярные товары',
          'HS_search_product': 'Поиск товара',
          'HS_special': 'Специально для вас',
          // profile
          'PF_title': 'Данные профиля',
          'PF_complete_title': 'Подтвердить данные профиля',
          'PF_complete_description':
              'Подтвердить данные профиля или  \nпродолжить с соц. сетями',
          'PF_address_title': 'Адрес',
          'PF_address_description': 'Введите адрес',
          'PF_phone_title': 'Телефон',
          'PF_phone_description': 'Введите ваш телефон',
          'PF_firstname_title': 'Имя',
          'PF_firstname_description': 'Введите ваше имя',
          'PF_lastname_title': 'Фамилия',
          'PF_lastname_description': 'Введите вашу фамилию',
          'PF_my_account': 'Мой аккаунт',
          'PF_notifications': 'Уведомления',
          'PF_settings': 'Настройки',
          'PF_help': 'Центр помощи',
          // favourite
          'FV_title': 'Сохраненные',
          // product
          'PR_title': 'Все товары',
          'PR_categories_title': 'Категории',
          // settings
          'ST_title': 'Настройки',
          // cart
          'CT_title': 'Корзина',
          'CT_items': 'позиции',
          'CT_total': 'Всего',
          'CT_add_code': 'Добавить промокод',
          // otp
          'OT_title': 'OTP Verification',
          'OT_sent': 'We sent your code to +1 898 860 ***',
          'OT_resent': 'Resend OTP Code',
          'OT_expired': 'This code will expired in ',
        }
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
