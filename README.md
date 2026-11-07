# Delivery Application

تطبيق Flutter لإدارة عمليات التوصيل من جهة مندوب التوصيل. يتيح للمندوب تسجيل الدخول، استعراض الطلبات حسب حالتها، قبول الطلب، مشاهدة تفاصيله، تتبع موقعه على الخريطة، تحديث موقعه في Firebase، وإنهاء الطلب.

> **الحالة الحالية:** هذا المستودع يحتوي على تطبيق المندوب فقط. يعتمد التطبيق على Backend خارجي مكتوب بـ PHP، وعلى Firebase Cloud Firestore وFirebase Cloud Messaging. لا يحتوي المستودع على كود الـ Backend أو مخطط SQL الكامل.

## المحتويات

- [المزايا](#المزايا)
- [التقنيات](#التقنيات)
- [متطلبات التشغيل](#متطلبات-التشغيل)
- [الإعداد](#الإعداد)
- [تشغيل التطبيق](#تشغيل-التطبيق)
- [هيكل المشروع](#هيكل-المشروع)
- [تدفق العمل](#تدفق-العمل)
- [الشاشات والمسارات](#الشاشات-والمسارات)
- [واجهات الـ API](#واجهات-الـ-api)
- [نماذج البيانات والجداول](#نماذج-البيانات-والجداول)
- [التتبع والإشعارات](#التتبع-والإشعارات)
- [معالجة الأخطاء](#معالجة-الأخطاء)
- [الاختبار والبناء](#الاختبار-والبناء)
- [ملاحظات أمنية وتشغيلية](#ملاحظات-أمنية-وتشغيلية)

## المزايا

| المجال | الوظيفة |
|---|---|
| المصادقة | تسجيل الدخول والتحقق من البريد الإلكتروني وإعادة تعيين كلمة المرور |
| الطلبات | عرض الطلبات المعلقة، المقبولة، والمؤرشفة |
| إدارة الطلب | قبول الطلب، عرض التفاصيل، وإنهاء الطلب |
| الخرائط | عرض موقع التسليم والموقع الحالي للمندوب ورسم المسار بينهما |
| التتبع | قراءة موقع المندوب وتحديثه في Firestore بشكل دوري |
| الإشعارات | تهيئة Firebase Cloud Messaging والاشتراك في Topics |
| الترجمة | دعم بنية الترجمة وتغيير اللغة والثيم عبر GetX |
| التخزين المحلي | حفظ بيانات الجلسة والإعدادات باستخدام SharedPreferences |

## التقنيات

| التقنية | الاستخدام |
|---|---|
| Flutter / Dart | بناء التطبيق متعدد المنصات |
| GetX | إدارة الحالة، الحقن، والتنقل |
| HTTP | الاتصال بواجهات PHP |
| Firebase Core | تهيئة Firebase |
| Firebase Cloud Messaging | الإشعارات والـ Topics |
| Cloud Firestore | حفظ موقع المندوب أثناء التوصيل |
| Google Maps | عرض الخريطة والعلامات والمسارات |
| Geolocator / Geocoding | الحصول على الموقع والتعامل مع الإحداثيات |
| SharedPreferences | تخزين بيانات المندوب محلياً |
| Lottie | حالات التحميل وعدم وجود البيانات والأخطاء |

الإصدارات الأساسية المعلنة في [`pubspec.yaml`](pubspec.yaml):

| العنصر | الإصدار |
|---|---|
| Dart SDK | `^3.11.0` |
| التطبيق | `1.0.0+1` |
| GetX | `^4.7.3` |
| Firebase Core | `^4.2.1` |
| Cloud Firestore | `^6.1.0` |
| Google Maps Flutter | `^2.14.0` |

## متطلبات التشغيل

1. Flutter SDK متوافق مع Dart `3.11.0` أو أحدث ضمن نفس سلسلة التوافق.
2. Android Studio أو VS Code مع إضافات Flutter وDart.
3. جهاز Android أو محاكي؛ يستخدم المحاكي Android العنوان `10.0.2.2` للوصول إلى خادم الجهاز المضيف.
4. Backend PHP يعمل محلياً أو على خادم يمكن للجهاز الوصول إليه.
5. مشروع Firebase مهيأ للتطبيق، مع ملفات إعداد Android/iOS ومفاتيح Google Maps عند الحاجة.
6. صلاحية الموقع مفعلة على الجهاز.

## الإعداد

### 1. جلب الاعتمادات

```bash
flutter pub get
```

### 2. إعداد عنوان الـ Backend

العنوان الحالي معرف في [`lib/core/constant/app_link.dart`](lib/core/constant/app_link.dart):

```text
http://10.0.2.2/ecommeceapp/deliveryApplication
```

| بيئة التشغيل | العنوان المعتاد |
|---|---|
| Android Emulator | `http://10.0.2.2/...` |
| iOS Simulator | `http://127.0.0.1/...` أو عنوان الخادم المحلي |
| جهاز فعلي | `http://<LAN_IP>/...` |
| خادم إنتاج | عنوان HTTPS الخاص بالـ API |

يجب أن تكون المسارات التالية متاحة تحت العنوان الأساسي، وأن يعيد الـ Backend استجابة JSON متوافقة مع الحقول المستخدمة في النماذج.

### 3. إعداد Firebase وGoogle Maps

- اربط تطبيق Android بمشروع Firebase، وتحقق من وجود `google-services.json` المناسب في `android/app/`.
- أضف إعداد iOS المقابل عند بناء التطبيق على iOS.
- أضف Google Maps API key في إعدادات Android وiOS وفق توثيق Google Maps Flutter.
- لا تضع مفاتيح سرية أو ملفات Firebase الخاصة ببيئة الإنتاج في مستودع عام.

### 4. الصلاحيات

تأكد من تعريف صلاحيات الموقع والإشعارات في ملفات المنصات. يطلب التطبيق صلاحية الموقع أثناء شاشة التتبع، ويطلب صلاحية الإشعارات عند تهيئة `MyService`.

## تشغيل التطبيق

```bash
flutter run
```

أوامر مفيدة:

```bash
flutter devices
flutter analyze
flutter test
flutter build apk --release
```

نقطة الدخول هي [`lib/main.dart`](lib/main.dart). عند بدء التطبيق يتم:

1. تهيئة Flutter.
2. تهيئة Firebase وFCM وSharedPreferences عبر `initialServices()`.
3. إنشاء `GetMaterialApp`.
4. تحميل الترجمة والثيم والمسارات.
5. عرض شاشة تسجيل الدخول أو الصفحة المحمية حسب الـ middleware.

## هيكل المشروع

```text
lib/
├── bindings/                 # حقن الاعتمادات الأولية
├── controller/               # Controllers الخاصة بالشاشات والطلبات
├── core/
│   ├── class/                # CRUD وعرض حالات الطلب
│   ├── constant/             # المسارات والروابط والثيم والحالات
│   ├── functions/            # وظائف مشتركة والتحقق ورسم المسار
│   ├── localization/         # الترجمة وتغيير اللغة
│   ├── middleware/           # حماية المسارات
│   └── services/             # Firebase وSharedPreferences
├── data/
│   ├── datasource/remote/    # مصادر بيانات المصادقة والطلبات
│   └── datasource/static/    # نماذج البيانات
├── view/
│   ├── screen/               # الشاشات
│   └── widget/               # Widgets مشتركة
├── main.dart                 # نقطة التشغيل
└── routes.dart               # تعريف مسارات GetX
```

التدفق العام للبيانات:

```text
View → Controller → Remote Data Source → Crud → PHP API
  ↑                                      ↓
  └────────────── GetX state/model ──────┘

TrackingController → Geolocator → Google Maps
TrackingController → Cloud Firestore (delivery/{orderId})
```

## تدفق العمل

```text
تسجيل الدخول
    ↓
الصفحة الرئيسية
    ↓
الطلبات المعلقة ── قبول الطلب ──→ الطلبات المقبولة
    │                                  ↓
    └──────── تفاصيل الطلب ←──────── التتبع
                                       ↓
                                  إنهاء الطلب
                                       ↓
                                   الصفحة الرئيسية
```

أثناء التتبع:

1. يقرأ التطبيق موقع التسليم من الطلب.
2. يطلب صلاحية الموقع ويقرأ موقع المندوب الحالي.
3. يعرض علامتي الوجهة والمندوب على Google Maps.
4. يرسم Polyline بين الموقعين.
5. يحدث وثيقة Firestore كل 10 ثوانٍ.
6. عند إنهاء الطلب يستدعي endpoint الإنهاء ثم يعود للصفحة الرئيسية.

## الشاشات والمسارات

| المسار | الشاشة | الغرض |
|---|---|---|
| `/` | Login | نقطة الدخول مع Middleware |
| `/login` | Login | تسجيل الدخول |
| `/home` | HomeScreen | الحاوية الرئيسية والتنقل السفلي |
| `/forgetPassword` | ForgetPassword | طلب إعادة تعيين كلمة المرور |
| `/verificationEmail` | VerificationEmail | التحقق من رمز البريد |
| `/resetPassword` | ResetPassword | تعيين كلمة مرور جديدة |
| `/successResetPassword` | SuccessResetPassword | نجاح إعادة التعيين |
| `/orderAccepted` | OrdersAccepted | الطلبات المقبولة |
| `/orderDetails` | OrderDetails | تفاصيل الطلب |
| `/orderTracking` | OrderTracking | الخريطة والتتبع |
| `/ordersPending` | OrdersPending | الطلبات المعلقة |
| `/archive` | Archive | الطلبات المؤرشفة |

> بعض المسارات معرفة في `AppRoutes` للاستخدام المستقبلي، لكن ليس لكل منها `GetPage` فعال في `routes.dart`.

## واجهات الـ API

العنوان الأساسي معرف في `AppLink.server`.

| الوظيفة | المسار |
|---|---|
| اختبار الاتصال | `/test.php` |
| تسجيل الدخول | `/auth/login.php` |
| التسجيل | `/auth/signup.php` |
| التحقق من رمز التسجيل | `/auth/verify_code.php` |
| إعادة إرسال الرمز | `/auth/resend.php` |
| فحص البريد لاستعادة كلمة المرور | `/forgetpassword/check_email.php` |
| التحقق من رمز الاستعادة | `/forgetpassword/verify_code_email.php` |
| تغيير كلمة المرور | `/forgetpassword/reset_password.php` |
| الطلبات المعلقة | `/orders/pending.php` |
| الطلبات المقبولة | `/orders/accepted.php` |
| الطلبات المؤرشفة | `/orders/archive.php` |
| تفاصيل الطلب | `/orders/details.php` |
| قبول الطلب | `/orders/approve.php` |
| إنهاء الطلب | `/orders/done.php` |

تستخدم طبقة [`Crud`](lib/core/class/crud.dart) طلبات HTTP `POST`، وتعتبر الرموز `200` و`201` نجاحاً، ثم تحول جسم الاستجابة إلى JSON.

## نماذج البيانات والجداول

### جدول `orders` (الطلب)

الجدول التالي مستنتج من `OrdersModel`؛ يجب مطابقته مع مخطط قاعدة بيانات الـ Backend قبل إنشاء migrations.

| الحقل | النوع المتوقع | الوصف |
|---|---:|---|
| `orders_id` | INT | معرف الطلب |
| `orders_userid` | INT | معرف العميل |
| `orders_addressid` | INT | معرف عنوان التسليم |
| `orders_type` | INT | نوع الطلب |
| `orders_pricedelivery` | INT | رسوم التوصيل |
| `orders_price` | INT | سعر المنتجات |
| `orders_couponid` | INT | القسيمة المستخدمة |
| `orders_datetime` | DATETIME/TEXT | تاريخ إنشاء الطلب |
| `orders_paymentmethod` | INT | طريقة الدفع |
| `orders_totalprice` | INT | الإجمالي |
| `orders_status` | INT | حالة الطلب |
| `orders_rating` | INT | تقييم الطلب |
| `orders_commet` | TEXT | تعليق/ملاحظة الطلب |

### جدول `address` (عنوان التسليم)

| الحقل | النوع المتوقع | الوصف |
|---|---:|---|
| `address_id` | INT | معرف العنوان |
| `address_userid` | INT | مالك العنوان |
| `address_city` | VARCHAR | المدينة |
| `address_street` | VARCHAR | الشارع |
| `address_lat` | DOUBLE | خط العرض |
| `address_long` | DOUBLE | خط الطول |
| `address_building` | VARCHAR | رقم/وصف المبنى |
| `address_name` | VARCHAR | اسم العنوان |

### جدول `cart` / عناصر الطلب

حقول `OrdersDetailsModel` تمثل بيانات عناصر الطلب والعربة:

| الحقل | النوع المتوقع | الوصف |
|---|---:|---|
| `cart_id` | INT | معرف العربة/العنصر |
| `cart_usersid` | INT | معرف المستخدم |
| `cart_itemsid` | INT | معرف المنتج |
| `items_id` | INT | معرف المنتج |
| `items_name` / `items_name_ar` | VARCHAR | اسم المنتج |
| `items_desc` / `items_desc_ar` | TEXT | وصف المنتج |
| `items_image` | VARCHAR | رابط الصورة |
| `items_count` | INT | الكمية |
| `items_active` | INT | حالة تفعيل المنتج |
| `items_price` | INT | السعر |
| `items_discount` | INT | الخصم |
| `items_date` | DATETIME/TEXT | تاريخ المنتج |
| `items_cat` | INT | التصنيف |
| `price_items` | INT | مجموع سعر العناصر |
| `count_items` | INT | إجمالي عدد العناصر |

### Firestore: مجموعة `delivery`

يكتب التطبيق وثيقة بالمعرف `orders_id` داخل المجموعة `delivery`:

| الحقل | النوع | الوصف |
|---|---|---|
| `lat` | Double | خط عرض المندوب الحالي |
| `long` | Double | خط طول المندوب الحالي |
| `deliveryid` | String | معرف المندوب من SharedPreferences |

## حالات الطلب

توجد حالات عامة لمعالجة الاستجابة في [`status_requset.dart`](lib/core/constant/status_requset.dart):

| الحالة | المعنى في الواجهة |
|---|---|
| `loading` | تحميل البيانات |
| `success` | نجاح الطلب |
| `failure` | فشل/بيانات غير صالحة |
| `OfflineFailure` | لا يوجد اتصال بالإنترنت |
| `serviceFailure` | خطأ من الخادم |
| `exceptionFailure` | استثناء أثناء التنفيذ |

## التتبع والإشعارات

- يبدأ التتبع من `TrackingController`.
- يستخدم `Geolocator` للموقع الحالي و`GoogleMapController` لتحريك الكاميرا.
- يستخدم `flutter_polyline_points` عبر `getDecodePolyLine` لرسم المسار.
- يتم إلغاء `StreamSubscription` و`Timer` وتحرير خريطة Google عند إغلاق الشاشة.
- تهيئة FCM تتم في `MyService.init()`، كما تستخدم إعدادات الاشتراك Topics في Controller الإعدادات.
- يجب ضبط قواعد Firestore بحيث تسمح فقط للمندوب المصرح له بكتابة موقعه، وعدم الاعتماد على حماية التطبيق وحدها.

## معالجة الأخطاء

يتم فحص الاتصال قبل إرسال الطلب. أخطاء الشبكة والخادم تحول إلى `StatusRequset` وتعرضها `HandlindDataView`. عند رفض صلاحية الموقع، يستخدم التطبيق إحداثيات الوجهة كمركز بديل للخريطة ويستمر دون بث موقع المندوب.

## الاختبار والبناء

قبل فتح Pull Request:

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

سيناريو اختبار يدوي مقترح:

| # | السيناريو | النتيجة المتوقعة |
|---:|---|---|
| 1 | فتح التطبيق دون جلسة | تظهر شاشة تسجيل الدخول |
| 2 | إدخال بيانات صحيحة | الانتقال إلى الصفحة الرئيسية |
| 3 | فتح الطلبات المعلقة | ظهور الطلبات القادمة من API |
| 4 | قبول طلب | انتقاله إلى الطلبات المقبولة |
| 5 | فتح التتبع ومنح الموقع | ظهور موقعي المندوب والوجهة والمسار |
| 6 | تعطيل الإنترنت | ظهور حالة OfflineFailure بدلاً من نجاح وهمي |
| 7 | إنهاء الطلب | استدعاء endpoint `done.php` والعودة للرئيسية |

## ملاحظات أمنية وتشغيلية

1. العنوان الحالي يستخدم HTTP وعنوان محاكي محلي؛ استخدم HTTPS في الإنتاج.
2. لا تضع كلمات المرور أو مفاتيح API أو إعدادات Firebase الحساسة داخل README أو الكود.
3. تحقق من مدخلات المستخدم في التطبيق والـ Backend معاً.
4. أضف مهلة Timeout وإخفاء تفاصيل الاستثناءات في واجهة المستخدم قبل الإنتاج.
5. قيّد صلاحيات Firestore حسب هوية المندوب ومعرف الطلب.
6. استخدم متغيرات بيئة أو ملفات إعداد منفصلة لعناوين التطوير والإنتاج.
7. راجع أسماء الحقول القديمة مثل `orders_commet` و`Items_active` قبل توحيدها؛ تغييرها يتطلب تحديث الـ Backend والتطبيق معاً.
8. مجلدات `build/` و`.dart_tool/` نواتج مولدة وليست مصدراً للتعديل اليدوي.

## المساهمة

1. أنشئ فرعاً جديداً للتغيير.
2. حافظ على نمط GetX وتقسيم `controller / data / view`.
3. حدّث هذا README عند إضافة شاشة أو endpoint أو متطلب إعداد جديد.
4. شغّل `flutter analyze` و`flutter test` قبل إرسال التغيير.
5. اكتب وصفاً واضحاً لتغييرات API أو Firebase وأي ترحيل مطلوب.

## الترخيص

لم يتم تعريف ملف ترخيص في المستودع حالياً. أضف ترخيصاً مناسباً قبل التوزيع أو النشر العام.
