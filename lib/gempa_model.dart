class Gempa {
  final String tanggal;
  final String jam;
  final String dateTime;
  final String coordinates;
  final String lintang;
  final String bujur;
  final String magnitude;
  final String kedalaman;
  final String wilayah;
  final String potensi;
  final String dirasakan;
  final String shakemap;

  const Gempa({
    required this.tanggal,
    required this.jam,
    required this.dateTime,
    required this.coordinates,
    required this.lintang,
    required this.bujur,
    required this.magnitude,
    required this.kedalaman,
    required this.wilayah,
    required this.potensi,
    required this.dirasakan,
    required this.shakemap,
  });

  // CONVERTING JSON TO CLASS

  factory Gempa.fromString(tanggal, jam, dateTime, coordinates, lintang, bujur, magnitude, kedalaman, wilayah, potensi, dirasakan, shakemap){
   
      return Gempa(
      tanggal: tanggal, 
      jam: jam,
      dateTime: dateTime,
      coordinates: coordinates,
      lintang: lintang,
      bujur: bujur,
      magnitude: magnitude,
      kedalaman: kedalaman,
      wilayah: wilayah,
      potensi: potensi,
      dirasakan: dirasakan,
      shakemap: shakemap,

      );

    }
}