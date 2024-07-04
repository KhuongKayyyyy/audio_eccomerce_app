import 'package:audio_ecommerce_app/Models/feature.dart';
import 'package:audio_ecommerce_app/Models/user.dart';
import 'package:audio_ecommerce_app/Models/product.dart';

class FakeData {
  // fake user data
  static String userAvatar = "https://www.facebook.com/photo/?fbid=3393454910874431&set=a.1380742055479070";
  static String avatarIllustration = "https://as2.ftcdn.net/v2/jpg/02/79/66/93/1000_F_279669366_Lk12QalYQKMczLEa4ySjhaLtx1M2u7e6.jpg";
  static User systemUser = User(
    name: "Nguyen Dat Khuong",
    account: "zzkhngzz@gmail.com",
    password: "1123",
    imgURL: avatarIllustration,
  );

  // fake product features
  static Feature feature1 = Feature(
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9h1UbimiZDdS_nuX5hxtM9FsQgAXMnF_Ayg&s",
    name: "APTX HD WIRELESS AUDIO",
    description: "The Aptx® HD codec transmits 24-bit hi-res audio, equal to or better than CD quality.",
  );

  static Feature feature2 = Feature(
    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ9sqZOcTKp7dptjivnELHVaOrdwB7opzItg&s",
    name: "ULTRA SOFT WITH ALCANTARA",
    description: "Alcantara® is a highly innovative material offering an unrivalled combination of comfort and durability.",
  );

  static List<Feature> featureList = [feature1, feature2];

  // fake product image URLs
  static List<String> imgList = [
    "https://bizweb.dktcdn.net/100/479/913/products/tai-nghe-sony-wh1000xm5-1.jpg?v=1681816462820",
    "https://www.sony.com.vn/image/6145c1d32e6ac8e63a46c912dc33c5bb?fmt=pjpeg&wid=330&bgcolor=FFFFFF&bgc=FFFFFF",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaAtvqxzS7FwYnOQd-Ko6vOhG-yn63D2lUkLB8MnWXr3T81ajajA3ZgF5IExmCcCrWCeI&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5KQEibpy9wdjwL5SZzXT_wdiDzRV3eEPnwVPlUulIwIKY9EkNf7lsLU-dTYOIFKiY06E&usqp=CAU",
  ];

  static List<String> imgList1 = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROciMrdqStuHav1Rr7wcE25kF5nipcJhbhA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROciMrdqStuHav1Rr7wcE25kF5nipcJhbhA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf5kMSzUoeSzZbWf6-FeX279c2m98c9S4N2xUHufUMqER-wrxV7FEtZrY21d00cQSIp20&usqp=CAU",
    "https://www.bhphotovideo.com/images/images2500x2500/apple_mgyh3am_a_airpods_max_space_gray_1610233.jpg",
  ];

  // fake product data
  static Product product = Product(
    name: "SONY WH-1000XM5",
    price: 300,
    features: featureList,
    imageUrls: imgList,
  );

  static Product product1 = Product(
    name: "APPLE AIRPODS MAX",
    price: 500,
    features: featureList,
    imageUrls: imgList1,
  );

  static List<Product> products = [product,product1];
}
