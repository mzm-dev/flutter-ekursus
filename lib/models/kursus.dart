class Kursus {
  String IdKursus;
  String NamaKursus;
  String TempatKursus;
  String TarikhMula;
  String TarikhTamat;
  String TarikhTamatMohon;
  String BilPeserta;
  String KumpSasar;
  String KategoriKursus;
  String StatusKursus;
  String no_rujukan;
  String TarikhSurat;
  String start_time;
  String end_time;
  String tempat_daftar;
  String sign_pegawai;
  String Tarikhpengesahan;
  String upload_jadual;
  String flag_surat_edaran;
  String flag_penginapan;
  String catatan;
  String bil_hari;
  String flag_borang_penilaian;
  String created_at;
  String updated_at;

  //constructor
  Kursus({
    required this.IdKursus,
    required this.NamaKursus,
    required this.TempatKursus,
    required this.TarikhMula,
    required this.TarikhTamat,
    required this.TarikhTamatMohon,
    required this.BilPeserta,
    required this.KumpSasar,
    required this.KategoriKursus,
    required this.StatusKursus,
    required this.no_rujukan,
    required this.TarikhSurat,
    required this.start_time,
    required this.end_time,
    required this.tempat_daftar,
    required this.sign_pegawai,
    required this.Tarikhpengesahan,
    required this.upload_jadual,
    required this.flag_surat_edaran,
    required this.flag_penginapan,
    required this.catatan,
    required this.bil_hari,
    required this.flag_borang_penilaian,
    required this.created_at,
    required this.updated_at,
  });

  factory Kursus.fromJson(Map<String, dynamic> json) {
    return Kursus(
        IdKursus: json['IdKursus'],
        NamaKursus: json['NamaKursus'],
        TempatKursus: json['TempatKursus'],
        TarikhMula: json['TarikhMula'],
        TarikhTamat: json['TarikhTamat'],
        TarikhTamatMohon: json['TarikhTamatMohon'],
        BilPeserta: json['BilPeserta'],
        KumpSasar: json['KumpSasar'],
        KategoriKursus: json['KategoriKursus'],
        StatusKursus: json['StatusKursus'],
        no_rujukan: json['no_rujukan'],
        TarikhSurat: json['TarikhSurat'],
        start_time: json['start_time'],
        end_time: json['end_time'],
        tempat_daftar: json['tempat_daftar'],
        sign_pegawai: json['sign_pegawai'],
        Tarikhpengesahan: json['Tarikhpengesahan'],
        upload_jadual: json['upload_jadual'],
        flag_surat_edaran: json['flag_surat_edaran'],
        flag_penginapan: json['flag_penginapan'],
        catatan: json['catatan'],
        bil_hari: json['bil_hari'],
        flag_borang_penilaian: json['flag_borang_penilaian'],
        created_at: json['created_at'],
        updated_at: json['updated_at']);
  }
}
