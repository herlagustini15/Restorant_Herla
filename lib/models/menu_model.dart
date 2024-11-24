// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int idNamaHargaDeskripsiImage;
  String
      the1BurgerAyam20000BurgerAyamRotiEmpukDenganPattyAyamRenyahAtauGrilledDipadukanDenganSayuranSegarDanSausLezatHttpsImagesPexelsComPhotos29368032PexelsPhoto29368032FreePhotoOfDeliciousGourmetBurgerWithFreshIngredientsJpegAutoCompressCsTinysrgbW1260H750Dpr1;
  int the2BurgerSapi30000BurgerSapiRotiLembutDenganPattyDagingSapiJuicyDilengkapiKejuSayuranSegarDanSausPilihanUntukKenikmatanSempurnaHttpsImagesPexelsComPhotos1199957PexelsPhoto1199957JpegAutoCompressCsTinysrgbW1260H750Dpr2;
  String
      the3CoffeeLatte15000CoffeeLatteYangMenyegarkanPaduanRasaKopiYangKayaDanLembutnyaSusuHttpsImagesPexelsComPhotos29488014PexelsPhoto29488014FreePhotoOfSeniLatteDenganDesainBungaDiMejaKayuJpegAutoCompressCsTinysrgbW1260H750Dpr2;
  String
      the4Spageti25000KelezatanSpaghettiDipaduDenganSausKentalYangMembuatSetiapGigitanTakTerlupakanHttpsImagesPexelsComPhotos1279330PexelsPhoto1279330JpegAutoCompressCsTinysrgbW1260H750Dpr2;

  Welcome({
    required this.idNamaHargaDeskripsiImage,
    required this.the1BurgerAyam20000BurgerAyamRotiEmpukDenganPattyAyamRenyahAtauGrilledDipadukanDenganSayuranSegarDanSausLezatHttpsImagesPexelsComPhotos29368032PexelsPhoto29368032FreePhotoOfDeliciousGourmetBurgerWithFreshIngredientsJpegAutoCompressCsTinysrgbW1260H750Dpr1,
    required this.the2BurgerSapi30000BurgerSapiRotiLembutDenganPattyDagingSapiJuicyDilengkapiKejuSayuranSegarDanSausPilihanUntukKenikmatanSempurnaHttpsImagesPexelsComPhotos1199957PexelsPhoto1199957JpegAutoCompressCsTinysrgbW1260H750Dpr2,
    required this.the3CoffeeLatte15000CoffeeLatteYangMenyegarkanPaduanRasaKopiYangKayaDanLembutnyaSusuHttpsImagesPexelsComPhotos29488014PexelsPhoto29488014FreePhotoOfSeniLatteDenganDesainBungaDiMejaKayuJpegAutoCompressCsTinysrgbW1260H750Dpr2,
    required this.the4Spageti25000KelezatanSpaghettiDipaduDenganSausKentalYangMembuatSetiapGigitanTakTerlupakanHttpsImagesPexelsComPhotos1279330PexelsPhoto1279330JpegAutoCompressCsTinysrgbW1260H750Dpr2,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        idNamaHargaDeskripsiImage: json["id,nama,harga,deskripsi,image"],
        the1BurgerAyam20000BurgerAyamRotiEmpukDenganPattyAyamRenyahAtauGrilledDipadukanDenganSayuranSegarDanSausLezatHttpsImagesPexelsComPhotos29368032PexelsPhoto29368032FreePhotoOfDeliciousGourmetBurgerWithFreshIngredientsJpegAutoCompressCsTinysrgbW1260H750Dpr1:
            json[
                "1,Burger ayam,20000,Burger ayam, roti empuk dengan patty ayam renyah atau grilled, dipadukan dengan sayuran segar dan saus lezat,https://images.pexels.com/photos/29368032/pexels-photo-29368032/free-photo-of-delicious-gourmet-burger-with-fresh-ingredients.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"],
        the2BurgerSapi30000BurgerSapiRotiLembutDenganPattyDagingSapiJuicyDilengkapiKejuSayuranSegarDanSausPilihanUntukKenikmatanSempurnaHttpsImagesPexelsComPhotos1199957PexelsPhoto1199957JpegAutoCompressCsTinysrgbW1260H750Dpr2:
            json[
                "2,Burger sapi,30000,Burger sapi, roti lembut dengan patty daging sapi juicy, dilengkapi keju, sayuran segar, dan saus pilihan untuk kenikmatan sempurna.,https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
        the3CoffeeLatte15000CoffeeLatteYangMenyegarkanPaduanRasaKopiYangKayaDanLembutnyaSusuHttpsImagesPexelsComPhotos29488014PexelsPhoto29488014FreePhotoOfSeniLatteDenganDesainBungaDiMejaKayuJpegAutoCompressCsTinysrgbW1260H750Dpr2:
            json[
                "3,Coffee Latte,15000,Coffee Latte yang Menyegarkan, Paduan Rasa Kopi yang Kaya dan Lembutnya Susu,https://images.pexels.com/photos/29488014/pexels-photo-29488014/free-photo-of-seni-latte-dengan-desain-bunga-di-meja-kayu.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
        the4Spageti25000KelezatanSpaghettiDipaduDenganSausKentalYangMembuatSetiapGigitanTakTerlupakanHttpsImagesPexelsComPhotos1279330PexelsPhoto1279330JpegAutoCompressCsTinysrgbW1260H750Dpr2:
            json[
                "4,Spageti,25000,Kelezatan Spaghetti, Dipadu dengan Saus Kental yang Membuat Setiap Gigitan Tak Terlupakan\",https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"],
      );

  Map<String, dynamic> toJson() => {
        "id,nama,harga,deskripsi,image": idNamaHargaDeskripsiImage,
        "1,Burger ayam,20000,Burger ayam, roti empuk dengan patty ayam renyah atau grilled, dipadukan dengan sayuran segar dan saus lezat,https://images.pexels.com/photos/29368032/pexels-photo-29368032/free-photo-of-delicious-gourmet-burger-with-fresh-ingredients.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1":
            the1BurgerAyam20000BurgerAyamRotiEmpukDenganPattyAyamRenyahAtauGrilledDipadukanDenganSayuranSegarDanSausLezatHttpsImagesPexelsComPhotos29368032PexelsPhoto29368032FreePhotoOfDeliciousGourmetBurgerWithFreshIngredientsJpegAutoCompressCsTinysrgbW1260H750Dpr1,
        "2,Burger sapi,30000,Burger sapi, roti lembut dengan patty daging sapi juicy, dilengkapi keju, sayuran segar, dan saus pilihan untuk kenikmatan sempurna.,https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2":
            the2BurgerSapi30000BurgerSapiRotiLembutDenganPattyDagingSapiJuicyDilengkapiKejuSayuranSegarDanSausPilihanUntukKenikmatanSempurnaHttpsImagesPexelsComPhotos1199957PexelsPhoto1199957JpegAutoCompressCsTinysrgbW1260H750Dpr2,
        "3,Coffee Latte,15000,Coffee Latte yang Menyegarkan, Paduan Rasa Kopi yang Kaya dan Lembutnya Susu,https://images.pexels.com/photos/29488014/pexels-photo-29488014/free-photo-of-seni-latte-dengan-desain-bunga-di-meja-kayu.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2":
            the3CoffeeLatte15000CoffeeLatteYangMenyegarkanPaduanRasaKopiYangKayaDanLembutnyaSusuHttpsImagesPexelsComPhotos29488014PexelsPhoto29488014FreePhotoOfSeniLatteDenganDesainBungaDiMejaKayuJpegAutoCompressCsTinysrgbW1260H750Dpr2,
        "4,Spageti,25000,Kelezatan Spaghetti, Dipadu dengan Saus Kental yang Membuat Setiap Gigitan Tak Terlupakan\",https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2":
            the4Spageti25000KelezatanSpaghettiDipaduDenganSausKentalYangMembuatSetiapGigitanTakTerlupakanHttpsImagesPexelsComPhotos1279330PexelsPhoto1279330JpegAutoCompressCsTinysrgbW1260H750Dpr2,
      };
}
