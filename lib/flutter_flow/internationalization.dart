import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, frText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // RegisterPage
  {
    'xtxgx3t1': {
      'en': 'Temporary : Super Admin Home Page',
      'ar': 'مؤقت: الصفحة الرئيسية للمشرف المتميز',
      'fr': 'Temporaire : Page d\'accueil du super-administrateur',
    },
    'xgn9f2ge': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'fr': 'Changer le mot de passe',
    },
    '7hz5cv2k': {
      'en': 'Create Your Account',
      'ar': 'أنشئ حسابك',
      'fr': 'Créez votre compte',
    },
    'swh3lqfl': {
      'en': 'Welcome back! Please enter your details.',
      'ar': 'مرحبًا بعودتك! الرجاء إدخال التفاصيل الخاصة بك.',
      'fr': 'Content de te revoir! Veuillez entrer vos coordonnées.',
    },
    '3zt2gtz4': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
      'fr': 'Prénom',
    },
    '100989mr': {
      'en': 'Enter your first name',
      'ar': 'أدخل اسمك الأول',
      'fr': 'Entrez votre prénom',
    },
    '1nkir3cz': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
      'fr': 'Nom de famille',
    },
    'p1l70zsn': {
      'en': 'Enter your last name',
      'ar': 'أدخل اسمك الأخير',
      'fr': 'Entrez votre nom de famille',
    },
    '4i2r4xj0': {
      'en': 'Phone Number !',
      'ar': 'رقم التليفون !',
      'fr': 'Numéro de téléphone !',
    },
    'mv03bbe7': {
      'en': 'Enter your phone number',
      'ar': 'أدخل رقم هاتفك',
      'fr': 'Entrez votre numéro de téléphone',
    },
    'n9dlfsev': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    '4oj3p1hb': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
      'fr': 'Entrer votre Email',
    },
    '7z27jfxh': {
      'en': 'Email@gmail.com',
      'ar': 'البريد الإلكتروني@gmail.com',
      'fr': 'E-mail@gmail.com',
    },
    '2j0923lc': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'hf7ioxl9': {
      'en': '••••••••',
      'ar': '••••••••',
      'fr': '••••••••',
    },
    'ezygy4rb': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'fr': 'Confirmez le mot de passe',
    },
    'fdrak2ey': {
      'en': '••••••••',
      'ar': '••••••••',
      'fr': '••••••••',
    },
    '6lgi546l': {
      'en': 'Email is required.',
      'ar': 'البريد الالكتروني مطلوب.',
      'fr': 'Un e-mail est requis.',
    },
    'wh9soyhj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '6e2snkzi': {
      'en': 'Password is required.',
      'ar': 'كلمة المرور مطلوبة.',
      'fr': 'Mot de passe requis.',
    },
    'hqt7sge2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '8x2iamnm': {
      'en': 'Register',
      'ar': 'يسجل',
      'fr': 'Registre',
    },
    'blwfjfi2': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب؟',
      'fr': 'Vous avez déjà un compte?',
    },
    'k9j1n8lc': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    '477e1pcp': {
      'en': 'Terms of use',
      'ar': 'شروط الاستخدام',
      'fr': 'Conditions d\'utilisation',
    },
    'wutrnpqc': {
      'en': '   |   ',
      'ar': '|',
      'fr': '|',
    },
    '9x39mgom': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fr': 'politique de confidentialité',
    },
    '5ph3261c': {
      'en': 'Training, Expertise, Excellence – Welcome to Agile Management.',
      'ar': 'التدريب والخبرة والتميز – مرحبًا بكم في Agile Management.',
      'fr':
          'Formation, Expertise, Excellence – Bienvenue dans le Management Agile.',
    },
    'z9mz4ysy': {
      'en': '— TheTeam',
      'ar': '- الفريق',
      'fr': '- L\'équipe',
    },
    '3y0fjckw': {
      'en': 'The Tunisian Establishment \nfor Agile Management',
      'ar': 'المؤسسة التونسية\nللإدارة رشيقة',
      'fr': 'L\'establishment tunisien\npour la gestion agile',
    },
    '77stijuz': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // LoginPage
  {
    '7x7uot23': {
      'en': 'Temporary : Admin Home Page',
      'ar': 'مؤقت: الصفحة الرئيسية للمسؤول',
      'fr': 'Temporaire : Page d\'accueil de l\'administrateur',
    },
    'z1uvpeps': {
      'en': 'Continue as guest',
      'ar': 'استمر كضيف',
      'fr': 'Continuer en tant qu\'invité',
    },
    'pl4vl4ad': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
      'fr': 'Content de te revoir',
    },
    'jc9cfskq': {
      'en': 'Welcome back! Please enter your details.',
      'ar': 'مرحبًا بعودتك! الرجاء إدخال التفاصيل الخاصة بك.',
      'fr': 'Content de te revoir! Veuillez entrer vos coordonnées.',
    },
    '7c34azaw': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
    },
    'tppte1l9': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
      'fr': 'Entrer votre Email',
    },
    'zc38cvr8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
    },
    'lenwgt5x': {
      'en': '••••••••',
      'ar': '••••••••',
      'fr': '••••••••',
    },
    '96xbaehj': {
      'en': 'Email is required.',
      'ar': 'البريد الالكتروني مطلوب.',
      'fr': 'Un e-mail est requis.',
    },
    'a0ncb71a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'vv5asmie': {
      'en': 'Password is required.',
      'ar': 'كلمة المرور مطلوبة.',
      'fr': 'Mot de passe requis.',
    },
    'vczx9d7b': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yk7auu9u': {
      'en': 'Forget password?',
      'ar': 'هل نسيت كلمة المرور؟',
      'fr': 'Mot de passe oublié?',
    },
    'x82bdl3g': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fr': 'Se connecter',
    },
    'dwgxqevs': {
      'en': 'Sign in with Google',
      'ar': 'الدخول مع جوجل',
      'fr': 'Connectez-vous avec Google',
    },
    'c4nger1j': {
      'en': 'Sign in with Facebook',
      'ar': 'قم بتسجيل الدخول باستخدام الفيسبوك',
      'fr': 'Connectez-vous avec Facebook',
    },
    'uiy5i381': {
      'en': 'Don\'t have an account? ',
      'ar': 'ليس لديك حساب؟',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'bop1gepy': {
      'en': 'Sign up',
      'ar': 'اشتراك',
      'fr': 'S\'inscrire',
    },
    'nz5l7ll4': {
      'en':
          'Management is doing things right; leadership is doing the right things.',
      'ar':
          'الإدارة تفعل الأشياء بشكل صحيح. القيادة هي القيام بالأشياء الصحيحة.',
      'fr':
          'La direction fait les choses correctement ; le leadership fait les bonnes choses.',
    },
    '6b63eecy': {
      'en': '— Peter Drucker',
      'ar': '- بيتر دراكر',
      'fr': '- Peter Drucker',
    },
    'iryhtnw9': {
      'en': 'The Tunisian Establishment \nfor Agile Management',
      'ar': 'المؤسسة التونسية\nللإدارة رشيقة',
      'fr': 'L\'establishment tunisien\npour la gestion agile',
    },
    'lpdb3tc3': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // OnBoardingPage
  {
    '3y5g9pij': {
      'en': 'Welcome',
      'ar': 'مرحباً',
      'fr': 'Accueillir',
    },
    'xukko6r5': {
      'en':
          'Welcome to elearny ! We\'re thrilled to have you join our community of learners. \nGet ready to embark on an exciting learning journey with us.',
      'ar':
          'مرحبا بكم في التعلم الإلكتروني! يسعدنا انضمامك إلى مجتمع المتعلمين لدينا.\nاستعد للشروع في رحلة تعليمية مثيرة معنا.',
      'fr':
          'Bienvenue sur elearning ! Nous sommes ravis de vous accueillir dans notre communauté d\'apprenants.\nPréparez-vous à vous lancer dans un voyage d\'apprentissage passionnant avec nous.',
    },
    '9evp4ecf': {
      'en': 'Explore us',
      'ar': 'استكشفنا',
      'fr': 'Explorez-nous',
    },
    'xmxwf0xb': {
      'en':
          'Discover a world of knowledge with elearny.\nExplore our wide range of courses designed to help you grow, learn, and succeed.',
      'ar':
          'اكتشف عالم المعرفة مع elearny.\nاستكشف مجموعتنا الواسعة من الدورات التدريبية المصممة لمساعدتك على النمو والتعلم والنجاح.',
      'fr':
          'Découvrez un monde de connaissances avec elearning.\nExplorez notre large gamme de cours conçus pour vous aider à grandir, apprendre et réussir.',
    },
    '7px3uh6w': {
      'en': 'Get Started',
      'ar': 'البدء',
      'fr': 'Commencer',
    },
    'utj0g2lm': {
      'en':
          'It\'s time to get started! Dive into your first course, expand your horizons, and achieve your learning goals with elearny.\nLet\'s begin!',
      'ar':
          'حان الوقت للبدء! انغمس في الدورة التدريبية الأولى، وقم بتوسيع آفاقك، وحقق أهدافك التعليمية مع elearny.\nهيا نبدأ!',
      'fr':
          'Il est temps de commencer ! Plongez dans votre premier cours, élargissez vos horizons et atteignez vos objectifs d\'apprentissage avec elearning.\nCommençons!',
    },
    'ts3k9hsr': {
      'en': 'Continue',
      'ar': 'يكمل',
      'fr': 'Continuer',
    },
    'zxtjps4s': {
      'en': 'Your Journey Begins',
      'ar': 'رحلتك تبدأ',
      'fr': 'Votre voyage commence',
    },
    'pxgyd0d4': {
      'en': 'Sign up below in order to get started!',
      'ar': 'قم بالتسجيل أدناه للبدء!',
      'fr': 'Inscrivez-vous ci-dessous pour commencer !',
    },
    '8x8azy9x': {
      'en': 'Get Started',
      'ar': 'البدء',
      'fr': 'Commencer',
    },
    '9iza21s3': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // ForgotPasswordPage
  {
    'skdyz9ek': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'fr': 'Mot de passe oublié',
    },
    'eian7ptw': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar':
          'سنرسل إليك بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال البريد الإلكتروني المرتبط بحسابك أدناه.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez saisir l\'e-mail associé à votre compte ci-dessous.',
    },
    '2vjegbp5': {
      'en': 'Your email address...',
      'ar': 'عنوان بريدك  الإلكتروني...',
      'fr': 'Votre adresse e-mail...',
    },
    '6perv3lt': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'fr': 'Entrer votre Email...',
    },
    'rycy655f': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
      'fr': 'Envoyer un lien',
    },
    'ustwn664': {
      'en': 'Back',
      'ar': 'خلف',
      'fr': 'Dos',
    },
    'z5uc3j5k': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // ChangePassword
  {
    'g3o9k8tb': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'fr': 'Changer le mot de passe',
    },
    'fliy0q8q': {
      'en':
          'Update your password for enhanced account security. Enter your old password, choose a new one, and click to save the changes.',
      'ar':
          'قم بتحديث كلمة المرور الخاصة بك لتعزيز أمان الحساب. أدخل كلمة المرور القديمة، واختر كلمة مرور جديدة، ثم انقر لحفظ التغييرات.',
      'fr':
          'Mettez à jour votre mot de passe pour une sécurité renforcée de votre compte. Entrez votre ancien mot de passe, choisissez-en un nouveau et cliquez pour enregistrer les modifications.',
    },
    'ucckjv9k': {
      'en': 'Your old password',
      'ar': 'كلمة المرور القديمة الخاصة بك',
      'fr': 'Votre ancien mot de passe',
    },
    '1i1qlwio': {
      'en': 'Enter your old password',
      'ar': 'أدخل كلمة المرور القديمة الخاصة بك',
      'fr': 'Entrez votre ancien mot de passe',
    },
    'w61rjped': {
      'en': 'Your new password',
      'ar': 'كلمة سرك الجديدة',
      'fr': 'Votre nouveau mot de passe',
    },
    'juoczegs': {
      'en': 'Enter your new password',
      'ar': 'أدخل كلمة المرور الجديدة',
      'fr': 'Entrez votre nouveau mot de passe',
    },
    'xl49orxk': {
      'en': 'Confirm new password',
      'ar': 'تأكيد كلمة المرور الجديدة',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    '6pjc78du': {
      'en': 'Confirm your new password',
      'ar': 'قم بتأكيد كلمة المرور الجديدة',
      'fr': 'Confirmez votre nouveau mot de passe',
    },
    'je761v6z': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
      'fr': 'Envoyer un lien',
    },
    'r34fsbtc': {
      'en': 'Back',
      'ar': 'خلف',
      'fr': 'Dos',
    },
    'mahrgjsi': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // Admin_users_list
  {
    'h1hd5s3z': {
      'en': 'Users List',
      'ar': 'قائمة المستخدمين',
      'fr': 'Liste des utilisateurs',
    },
    '17shj2bj': {
      'en': 'Mohamed Amin',
      'ar': 'محمد أمين',
      'fr': 'Mohamed Amin',
    },
    'jdg7nlzb': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
      'fr': 'admin@gmail.com',
    },
    'zbbuip54': {
      'en': 'App Members',
      'ar': 'أعضاء التطبيق',
      'fr': 'Membres de l\'application',
    },
    'axzzjisn': {
      'en': 'Below are a list of members of your app.',
      'ar': 'فيما يلي قائمة بأعضاء تطبيقك.',
      'fr':
          'Vous trouverez ci-dessous une liste des membres de votre application.',
    },
    'orsfhva5': {
      'en': 'Search all users...',
      'ar': 'البحث عن كافة المستخدمين...',
      'fr': 'Rechercher tous les utilisateurs...',
    },
    'dyabvjin': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    '8jwfu47q': {
      'en': 'Admin',
      'ar': 'مسؤل',
      'fr': 'Administrateur',
    },
    'gsg21vcs': {
      'en': 'Content Manager',
      'ar': 'مدير محتوى',
      'fr': 'Gestionnaire de contenu',
    },
    '0kbbn4ob': {
      'en': 'User',
      'ar': 'مستخدم',
      'fr': 'Utilisateur',
    },
    'gwke7snj': {
      'en': 'Instructor',
      'ar': 'مدرب',
      'fr': 'Instructeur',
    },
    'no363g3d': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    'u2a4ax6b': {
      'en': 'All',
      'ar': 'الجميع',
      'fr': 'Tous',
    },
    'tlg8pd0e': {
      'en': 'Name',
      'ar': 'اسم',
      'fr': 'Nom',
    },
    '242ia2ts': {
      'en': 'Last Active',
      'ar': 'آخر نشاط',
      'fr': 'Dernier actif',
    },
    'zuqddh9p': {
      'en': 'Role',
      'ar': 'دور',
      'fr': 'Rôle',
    },
    '58v147h0': {
      'en': 'Actions',
      'ar': 'أجراءات',
      'fr': 'Actions',
    },
    '7m51hxad': {
      'en': 'firstName',
      'ar': 'الاسم الأول',
      'fr': 'prénom',
    },
    '4lgeebfa': {
      'en': 'lastName',
      'ar': 'اسم العائلة',
      'fr': 'nom de famille',
    },
    '6p6mrom1': {
      'en': 'email@gmail.com',
      'ar': 'email@gmail.com',
      'fr': 'email@gmail.com',
    },
    'ygfadx88': {
      'en': 'Phone: 98 111 222',
      'ar': 'الهاتف: 98 111 222',
      'fr': 'Téléphone : 98 111 222',
    },
    'd1q73lm9': {
      'en': 'Additional user info',
      'ar': 'معلومات إضافية للمستخدم',
      'fr': 'Informations utilisateur supplémentaires',
    },
    '0ctt3vxw': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
      'fr': 'il y a 5 minutes',
    },
    '5ngqkkxd': {
      'en': 'Admin',
      'ar': 'مسؤل',
      'fr': 'Administrateur',
    },
    'r4jcradt': {
      'en': 'All Options',
      'ar': 'جميع الخيارات',
      'fr': 'Toutes les options',
    },
    'lz9jd0l7': {
      'en': 'View All info',
      'ar': 'عرض جميع المعلومات',
      'fr': 'Voir toutes les informations',
    },
    'ao4jjzj1': {
      'en': 'Edit user infos',
      'ar': 'تحرير معلومات المستخدم',
      'fr': 'Modifier les informations utilisateur',
    },
    '18g5m0cs': {
      'en': 'Assign Trainings...',
      'ar': 'تعيين التدريبات...',
      'fr': 'Attribuer des formations...',
    },
    '04udgnru': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // EditProfilePage
  {
    'eerdb6yq': {
      'en': 'Please Verify Your email !',
      'ar': 'يرجى التحقق من البريد الإلكتروني الخاص بك!',
      'fr': 'Veuillez vérifier votre email !',
    },
    'ljxaby1n': {
      'en':
          'Enable security by email address, click the button below to send an email verification',
      'ar':
          'قم بتمكين الأمان عن طريق عنوان البريد الإلكتروني، انقر فوق الزر أدناه لإرسال التحقق من البريد الإلكتروني',
      'fr':
          'Activez la sécurité par adresse e-mail, cliquez sur le bouton ci-dessous pour envoyer une vérification par e-mail',
    },
    'q2tczqiv': {
      'en': 'Verify my email',
      'ar': 'التحقق من بريدي الإلكتروني',
      'fr': 'Vérifier mon email',
    },
    'xje3buvx': {
      'en': 'Aminebt@gmail.com',
      'ar': 'أمينبت@gmail.com',
      'fr': 'Aminebt@gmail.com',
    },
    '6i01uber': {
      'en': 'Your Email',
      'ar': 'بريدك الالكتروني',
      'fr': 'Votre e-mail',
    },
    '1zs5vrgl': {
      'en': 'Your First Name',
      'ar': 'اسمك الأول',
      'fr': 'Ton prénom',
    },
    'sn18u0r0': {
      'en': 'Your Last Name',
      'ar': 'اسمك الاخير',
      'fr': 'Votre nom de famille',
    },
    '5mtve5mp': {
      'en': 'Your Phone Number',
      'ar': 'رقم تليفونك',
      'fr': 'Votre numéro de téléphone',
    },
    'z0o3l7iu': {
      'en': 'Your Address',
      'ar': 'عنوانك',
      'fr': 'Votre adresse',
    },
    'nhhcp7ao': {
      'en': 'Your Birth Date',
      'ar': 'تاريخ ميلادك',
      'fr': 'Ta date de naissance',
    },
    'rqfij4aw': {
      'en': 'Your bio',
      'ar': 'سيرتك الذاتية',
      'fr': 'Votre biographie',
    },
    'r5h3egtu': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Sauvegarder les modifications',
    },
    'md8i4xow': {
      'en': 'Edit your profile',
      'ar': 'عدل ملفك الشخصي',
      'fr': 'Modifier votre profil',
    },
  },
  // UserHomePage
  {
    'cqa9ds7t': {
      'en': 'Welcome : User',
      'ar': 'مرحباً: مستخدم',
      'fr': 'Bienvenue : Utilisateur',
    },
    'sbfin8zb': {
      'en': 'welcome to Our Application ',
      'ar': 'مرحبا بكم في التطبيق لدينا',
      'fr': 'bienvenue sur notre application',
    },
    'kjh2jd2o': {
      'en': 'user : email@gmail.com',
      'ar': 'المستخدم: email@gmail.com',
      'fr': 'utilisateur : email@gmail.com',
    },
    'hn1okju1': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    'bksjtx3w': {
      'en': 'Logout ',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'vbitaxzw': {
      'en': 'User Home Page',
      'ar': 'الصفحة الرئيسية للمستخدم',
      'fr': 'Page d\'accueil de l\'utilisateur',
    },
    'otlfkdjb': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // AdminHomePage
  {
    'xzalwsjg': {
      'en': 'Welcome : Admin',
      'ar': 'مرحبا : المشرف',
      'fr': 'Bienvenue : Administrateur',
    },
    'nbmkwsqm': {
      'en': 'welcome to Our Application ',
      'ar': 'مرحبا بكم في التطبيق لدينا',
      'fr': 'bienvenue sur notre application',
    },
    '4lxko8x5': {
      'en': 'user : email@gmail.com',
      'ar': 'المستخدم: email@gmail.com',
      'fr': 'utilisateur : email@gmail.com',
    },
    'jxltd211': {
      'en': 'All users list',
      'ar': 'قائمة كافة المستخدمين',
      'fr': 'Liste de tous les utilisateurs',
    },
    'xpfwe0o1': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    '266q4k8c': {
      'en': 'Logout ',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    '2tmsefwr': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // SuperAdminHomePage
  {
    'yqckpxhu': {
      'en': 'Welcome : Super Admin',
      'ar': 'مرحباً: المشرف المتميز',
      'fr': 'Bienvenue : Super Administrateur',
    },
    'y7c9ha76': {
      'en': 'welcome to Our Application ',
      'ar': 'مرحبا بكم في التطبيق لدينا',
      'fr': 'bienvenue sur notre application',
    },
    '0lo97by7': {
      'en': 'user : email@gmail.com',
      'ar': 'المستخدم: email@gmail.com',
      'fr': 'utilisateur : email@gmail.com',
    },
    'efafq341': {
      'en': 'All users list',
      'ar': 'قائمة كافة المستخدمين',
      'fr': 'Liste de tous les utilisateurs',
    },
    'pf3npoze': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    '4z1lqfva': {
      'en': 'Logout ',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'zjs1lffq': {
      'en': 'Super Admin Home Page',
      'ar': 'الصفحة الرئيسية للمشرف المتميز',
      'fr': 'Page d\'accueil du super-administrateur',
    },
    'ynngrqwx': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // ContentManagerHomePage
  {
    'xce2cs2x': {
      'en': 'Welcome : Content Manager',
      'ar': 'مرحبًا: مدير المحتوى',
      'fr': 'Bienvenue : Gestionnaire de contenu',
    },
    '6tcdc4uv': {
      'en': 'welcome to Our Application ',
      'ar': 'مرحبا بكم في التطبيق لدينا',
      'fr': 'bienvenue sur notre application',
    },
    '5pdnzeu8': {
      'en': 'user : email@gmail.com',
      'ar': 'المستخدم: email@gmail.com',
      'fr': 'utilisateur : email@gmail.com',
    },
    'luqq22vc': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    '6msyoz4v': {
      'en': 'Logout ',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'vo1u2obl': {
      'en': 'Content Manager Home Page',
      'ar': 'الصفحة الرئيسية لإدارة المحتوى',
      'fr': 'Page d\'accueil du gestionnaire de contenu',
    },
    'qcb8vkev': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // AnonymousUserHomePage
  {
    'k7bef67a': {
      'en': 'Welcome : Anonymous User',
      'ar': 'مرحباً: مستخدم مجهول',
      'fr': 'Bienvenue : Utilisateur anonyme',
    },
    'u6we6y1s': {
      'en': 'welcome to Our Application ',
      'ar': 'مرحبا بكم في التطبيق لدينا',
      'fr': 'bienvenue sur notre application',
    },
    'y1dcu8r5': {
      'en': 'user : email@gmail.com',
      'ar': 'المستخدم: email@gmail.com',
      'fr': 'utilisateur : email@gmail.com',
    },
    'isz5z59a': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
    },
    'gqu63cj7': {
      'en': 'Logout ',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    'z75r4np0': {
      'en': 'Anonymous / Guest User  Home Page',
      'ar': 'مجهول / الصفحة الرئيسية للمستخدم الضيف',
      'fr': 'Page d\'accueil des utilisateurs anonymes/invités',
    },
    'p3986js9': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
    },
  },
  // ProfilePage
  {
    '5n4o00is': {
      'en': 'Please Verify Your email !',
      'ar': 'يرجى التحقق من البريد الإلكتروني الخاص بك!',
      'fr': 'Veuillez vérifier votre email !',
    },
    '3kqv55z3': {
      'en':
          'Enable security by email address, click the button below to send an email verification',
      'ar':
          'قم بتمكين الأمان عن طريق عنوان البريد الإلكتروني، انقر فوق الزر أدناه لإرسال التحقق من البريد الإلكتروني',
      'fr':
          'Activez la sécurité par adresse e-mail, cliquez sur le bouton ci-dessous pour envoyer une vérification par e-mail',
    },
    '7yh9l1ox': {
      'en': 'Verify my email',
      'ar': 'التحقق من بريدي الإلكتروني',
      'fr': 'Vérifier mon email',
    },
    '7m51hxad': {
      'en': 'firstName',
      'ar': 'الاسم الأول',
      'fr': 'prénom',
    },
    '4lgeebfa': {
      'en': 'lastName',
      'ar': 'اسم العائلة',
      'fr': 'nom de famille',
    },
    '1e21ntbc': {
      'en': 'email_address@gmail.com',
      'ar': 'email_address@gmail.com',
      'fr': 'adresse_e-mail@gmail.com',
    },
    '9juev4f6': {
      'en': 'Account is verified',
      'ar': 'تم التحقق من الحساب',
      'fr': 'Le compte est vérifié',
    },
    'ci1cv6ld': {
      'en': 'Account is verified',
      'ar': 'تم التحقق من الحساب',
      'fr': 'Le compte est vérifié',
    },
    'pos471u2': {
      'en': '+216 95 888 111',
      'ar': '+216 95 888 111',
      'fr': '+216 95 888 111',
    },
    'ye8sq7dm': {
      'en': 'Company',
      'ar': 'شركة',
      'fr': 'Entreprise',
    },
    'u1wrcshz': {
      'en': '2,200',
      'ar': '2200',
      'fr': '2 200',
    },
    'tupc955e': {
      'en': 'Points / Credit',
      'ar': 'النقاط / الائتمان',
      'fr': 'Points/Crédit',
    },
    'lby7e2os': {
      'en': '20',
      'ar': '20',
      'fr': '20',
    },
    'q3g0kh7t': {
      'en': 'My Trainings',
      'ar': 'تدريباتي',
      'fr': 'Mes formations',
    },
    'vnvyprns': {
      'en': 'My Account Information',
      'ar': 'معلومات حسابي',
      'fr': 'Les informations de mon compte',
    },
    'mac6uy0g': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
    },
    '67p2euyf': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'fr': 'Changer le mot de passe',
    },
    'dxxmnbl1': {
      'en': 'Language',
      'ar': 'لغة',
      'fr': 'Langue',
    },
    '6fo36vzz': {
      'en': 'Support',
      'ar': 'يدعم',
      'fr': 'Soutien',
    },
    '1hpji0wl': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'fr': 'Didacticiel',
    },
    'l2n5hmk9': {
      'en': 'Submit a Bug',
      'ar': 'إرسال خطأ',
      'fr': 'Soumettre un bug',
    },
    '9zwyu9ow': {
      'en': 'Submit a Feature Request',
      'ar': 'إرسال طلب الميزة',
      'fr': 'Soumettre une demande de fonctionnalité',
    },
    'ifwfa8t0': {
      'en': 'Light ',
      'ar': 'ضوء',
      'fr': 'Lumière',
    },
    'poh1p1hh': {
      'en': 'Dark',
      'ar': 'مظلم',
      'fr': 'Sombre',
    },
    't2w05wbd': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
    '4jqe96xe': {
      'en': 'My Profile',
      'ar': 'ملفي',
      'fr': 'Mon profil',
    },
    'mxw83158': {
      'en': '__',
      'ar': '__',
      'fr': '__',
    },
  },
  // Dropdown_UserAccount
  {
    'vd4yqzz0': {
      'en': 'Account Options',
      'ar': 'خيارات الحساب',
      'fr': 'Options de compte',
    },
    'g6lzlqlr': {
      'en': 'firstName ',
      'ar': 'الاسم الأول',
      'fr': 'prénom',
    },
    's49vp9kf': {
      'en': 'lastName ',
      'ar': 'اسم العائلة',
      'fr': 'nom de famille',
    },
    'fr55jop4': {
      'en': 'email_address@gmail.com',
      'ar': 'email_address@gmail.com',
      'fr': 'adresse_e-mail@gmail.com',
    },
    'cldjrqtq': {
      'en': 'My Account',
      'ar': 'حسابي',
      'fr': 'Mon compte',
    },
    'nfotanmw': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'fr': 'Paramètres',
    },
    'q3g0kh7t': {
      'en': 'My Trainings',
      'ar': 'تدريباتي',
      'fr': 'Mes formations',
    },
    'tafhpg4e': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
      'fr': 'Mode lumière',
    },
    'pjb2w75w': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'fr': 'Mode sombre',
    },
    'pjph2alg': {
      'en': 'Log out',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
    },
  },
  // AdminDropDown_ManageUsers
  {
    '4jqwijxx': {
      'en': 'All Options',
      'ar': 'جميع الخيارات',
      'fr': 'Toutes les options',
    },
    '0cd0aqla': {
      'en': 'View All User Info',
      'ar': 'عرض جميع معلومات المستخدم',
      'fr': 'Afficher toutes les informations utilisateur',
    },
    'c239ikkz': {
      'en': 'Edit User info',
      'ar': 'تحرير معلومات المستخدم',
      'fr': 'Modifier les informations utilisateur',
    },
    '1r5xqy8f': {
      'en': 'Assign Training',
      'ar': 'تعيين التدريب',
      'fr': 'Attribuer une formation',
    },
    'x81vhia9': {
      'en': 'Disable user',
      'ar': 'تعطيل المستخدم',
      'fr': 'Désactiver l\'utilisateur',
    },
  },
  // Modal_AssignTraining
  {
    'eeenmw1a': {
      'en': 'Save',
      'ar': 'يحفظ',
      'fr': 'Sauvegarder',
    },
    'e00hytr9': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    '7yngj5bf': {
      'en': 'User Trainings',
      'ar': 'تدريبات المستخدم',
      'fr': 'Formations utilisateurs',
    },
    'jsswhtaq': {
      'en': 'Search tags...',
      'ar': 'علامات البحث...',
      'fr': 'Rechercher des balises...',
    },
    's44ukn2o': {
      'en': 'Role',
      'ar': 'دور',
      'fr': 'Rôle',
    },
  },
  // Modal_EditUserInfo
  {
    'geovpjwb': {
      'en': 'Save',
      'ar': 'يحفظ',
      'fr': 'Sauvegarder',
    },
    'u63xrn9k': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    'd8zr242w': {
      'en': 'User Details',
      'ar': 'بيانات المستخدم',
      'fr': 'Détails de l\'utilisateur',
    },
    'wbdsfyi0': {
      'en': 'Email address',
      'ar': 'عنوان البريد الإلكتروني',
      'fr': 'Adresse e-mail',
    },
    '8cnak1ge': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
      'fr': 'Prénom',
    },
    'pnmc0qjz': {
      'en': 'FirstName',
      'ar': 'الاسم الأول',
      'fr': 'Prénom',
    },
    '7wyo0cc1': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
      'fr': 'Nom de famille',
    },
    '60r1cj1g': {
      'en': 'LastName',
      'ar': 'اسم العائلة',
      'fr': 'Nom de famille',
    },
    '4hbof6ag': {
      'en': 'Phone',
      'ar': 'هاتف',
      'fr': 'Téléphone',
    },
    '5ij8slhg': {
      'en': 'PhoneNumber',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
    },
    'gr5rjxx3': {
      'en': 'Company',
      'ar': 'شركة',
      'fr': 'Entreprise',
    },
    'xrb6d8ti': {
      'en': 'Company1',
      'ar': 'الشركة1',
      'fr': 'Entreprise1',
    },
    '4pyscanu': {
      'en': 'Address',
      'ar': 'عنوان',
      'fr': 'Adresse',
    },
    'pra7nga7': {
      'en': 'Address1',
      'ar': 'العنوان 1',
      'fr': 'Adresse 1',
    },
    '8hoyhg0b': {
      'en': 'Role',
      'ar': 'دور',
      'fr': 'Rôle',
    },
    '4jr6h7mu': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
      'fr': 'Option 1',
    },
    'lzidrhn3': {
      'en': 'Please select...',
      'ar': 'الرجاء التحديد...',
      'fr': 'Veuillez sélectionner...',
    },
    'bi61yljm': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
      'fr': 'Rechercher un article...',
    },
  },
  // Modal_AdminDisableUser
  {
    'ge6twdxs': {
      'en': 'Please Type \"Disable user\" below to confirm your action.',
      'ar': 'الرجاء كتابة \"تعطيل المستخدم\" أدناه لتأكيد الإجراء الخاص بك.',
      'fr':
          'Veuillez saisir « Désactiver l\'utilisateur » ci-dessous pour confirmer votre action.',
    },
    'bnj3rose': {
      'en': '\"Disable user\"...',
      'ar': '\"تعطيل المستخدم\"...',
      'fr': '\"Désactiver l\'utilisateur\"...',
    },
    '7soecz65': {
      'en': 'Disable',
      'ar': 'إبطال',
      'fr': 'Désactiver',
    },
    '4rq59nqr': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
  },
  // CManagerDropDown_ManageUser
  {
    'cxm74fcs': {
      'en': 'All Options',
      'ar': 'جميع الخيارات',
      'fr': 'Toutes les options',
    },
    'zi6gdnlw': {
      'en': 'View All User Info',
      'ar': 'عرض جميع معلومات المستخدم',
      'fr': 'Afficher toutes les informations utilisateur',
    },
    'aoiuik3n': {
      'en': 'Edit User info',
      'ar': 'تحرير معلومات المستخدم',
      'fr': 'Modifier les informations utilisateur',
    },
    'c88lmg8t': {
      'en': 'Assign Training',
      'ar': 'تعيين التدريب',
      'fr': 'Attribuer une formation',
    },
  },
  // Modal_Light_Dark_Theme
  {
    '291aoc84': {
      'en': 'Update Theme',
      'ar': 'تحديث الموضوع',
      'fr': 'Mettre à jour le thème',
    },
    's2r3bbxn': {
      'en':
          'Update the theme of your application from seleccting one of the options below.',
      'ar':
          'قم بتحديث موضوع التطبيق الخاص بك من خلال تحديد أحد الخيارات أدناه.',
      'fr':
          'Mettez à jour le thème de votre application en sélectionnant l\'une des options ci-dessous.',
    },
    'wndrp91l': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'fr': 'Mode sombre',
    },
    'urz98h9p': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
      'fr': 'Mode lumière',
    },
    'jbde4nx9': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
    },
    '5rexwjlj': {
      'en': 'Save & Close',
      'ar': 'حفظ وإغلاق',
      'fr': 'Sauvegarder et fermer',
    },
  },
  // Miscellaneous
  {
    'a94jux34': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'jydxxrex': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'y4ovbhs3': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '2899ikv1': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'y55f0qrq': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'xpnr6dd7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5ista6fc': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'rz7vv5do': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'oa6t62cd': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'd9vb3pab': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0cmarmtt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'd2qezuuk': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'v0hz1pq5': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'ab2vdn2w': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'inf9qtcd': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4jt803q8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'idmuarfx': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'thn8gz76': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'wx4grnqr': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0rxo8fi4': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'wz5uhqut': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'kzi4gk76': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4arps6xd': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
