class TourismPlace {
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrls;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: 'Farm House Lembang',
    location: 'Lembang',
    description:
        'Farm House Lembang adalah tempat wisata dengan konsep peternakan ala Eropa. Pengunjung dapat berfoto dengan domba, mengenakan pakaian tradisional Belanda, dan menikmati susu segar.',
    openDays: 'Setiap Hari',
    openTime: '09:00 - 18:00',
    ticketPrice: 'Rp 30.000',
    imageAsset:
        'images/farm-house.jpg', 
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/58/9b/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/58/a5/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/58/8a/farmhouse-lembang.jpg',
    ],
  ),
  TourismPlace(
    name: 'Observatorium Bosscha',
    location: 'Lembang',
    description:
        'Memiliki beberapa teleskop, antara lain, Refraktor Ganda Zeiss Schmidt Bimasakti, Refraktor Bamberg, Cassegrain GOTO, dan Teleskop Surya. Refraktor Ganda Zeiss adalah jenis teleskop terbesar untuk meneropong bintang.',
    openDays: 'OPEN TUESDAY - SATURDAY',
    openTime: '09:00-14:30',
    ticketPrice: 'RP 20000',
    imageAsset:
        'images/bosscha.jpg',
    imageUrls: [
      'https://www.rancaupas.id/wp-content/uploads/2022/09/DSC05254-2-1024x683.jpg',
      'https://www.rancaupas.id/wp-content/uploads/2023/08/Ranca-Upas-Igloo-Camp-Ciwidey.jpg',
      'https://awsimages.detik.net.id/community/media/visual/2020/11/11/ranca-upas_169.jpeg?w=1200',
    ],
  ),
  TourismPlace(
    name: 'Jalan Asia Afrika',
    location: 'Kota Bandung',
    description:
        'Jalan Asia Afrika adalah jalan bersejarah di Bandung yang menjadi saksi Konferensi Asia Afrika pada tahun 1955. Terdapat Gedung Merdeka dan Museum Konferensi Asia Afrika di jalan ini.',
    openDays: 'Setiap Hari',
    openTime: '24 Jam',
    ticketPrice: 'Gratis',
    imageAsset:
        'images/jalan-asia-afrika.jpg', 
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0f/d6/1c/f9/gedung-merdeka.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0f/d6/1c/fa/gedung-merdeka.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0f/d6/1c/fb/gedung-merdeka.jpg',
    ],
  ),
  TourismPlace(
    name: 'Stone Garden',
    location: 'Padalarang',
    description:
        'Stone Garden Citatah adalah taman batu kapur alami yang terletak di atas bukit. Tempat ini menawarkan pemandangan indah dan spot foto yang unik dengan latar bebatuan purba.',
    openDays: 'Setiap Hari',
    openTime: '06:00 - 17:00',
    ticketPrice: 'Rp 10.000',
    imageAsset:
        'images/stone-garden.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a1/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a2/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a3/stone-garden-citatah.jpg',
    ],
  ),
  TourismPlace(
    name: 'Taman Film Pasopati',
    location: 'Kota Bandung',
    description:
        'Taman Film Pasopati adalah taman tematik di bawah Jembatan Pasopati yang didedikasikan untuk perfilman. Terdapat area duduk berundak dan layar besar untuk pemutaran film.',
    openDays: 'Setiap Hari',
    openTime: '24 Jam',
    ticketPrice: 'Gratis',
    imageAsset:
        'images/taman-film.jpg', 
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a1/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a2/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a3/stone-garden-citatah.jpg',
    ],
  ),
  TourismPlace(
    name: 'Museum Geologi',
    location: 'Kota Bandung',
    description:
        'Museum Geologi Bandung menyimpan koleksi materi geologi yang sangat lengkap, mulai dari fosil, batuan, mineral, hingga replika kerangka dinosaurus T-Rex.',
    openDays: 'Setiap Hari',
    openTime: '09:00 - 15:00',
    ticketPrice: 'Rp 3.000',
    imageAsset:
        'images/museum-geologi.jpg', 
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a1/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a2/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a3/stone-garden-citatah.jpg',
    ],
  ),
  TourismPlace(
    name: 'Floating Market',
    location: 'Lembang',
    description:
        'Floating Market Lembang menawarkan pengalaman unik berbelanja makanan dan jajanan di atas perahu yang mengapung di danau. Terdapat juga berbagai wahana permainan dan spot foto.',
    openDays: 'Setiap Hari',
    openTime: '09:00 - 18:00',
    ticketPrice: 'Rp 35.000',
    imageAsset:
        'images/floating-market.png', 
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a1/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a2/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/e3/b0/a3/stone-garden-citatah.jpg',
    ],
  ),
  TourismPlace(
    name: 'Kawah Putih',
    location: 'Ciwidey',
    description:
        'Kawah Putih adalah tempat wisata di Bandung yang paling terkenal. Berlokasi di Ciwidey, Jawa Barat, kurang lebih sekitar 50 KM arah selatan kota Bandung. Kawah Putih adalah sebuah danau yang terbentuk akibat dari letusan Gunung Patuha.',
    openDays: 'OPEN EVERYDAY',
    openTime: '07:00-17:00',
    ticketPrice: 'RP 15000',
    imageAsset:
        'images/kawah-putih.jpg', 
    imageUrls: [
      'https://cdn.idntimes.com/content-images/post/20201106/19437168-453398458365585-5644109604204838912-n-8b901f7c5f367e2a603c661c470a7d8d.jpg',
      'https://cdn.idntimes.com/content-images/post/20201106/34091980-2204188269801480-248274445720879104-n-10f8a84666066d3a3959b8a5b2b005e8.jpg',
      'https://cdn.idntimes.com/content-images/post/20201106/39488216-228473327819821-1612494975352788928-n-62d45d37611e3b6279f6e6e300d8a6b1.jpg',
    ],
  ),
  TourismPlace(
    name: 'Ranca Upas',
    location: 'Ciwidey',
    description:
        'Ranca Upas Ciwidey adalah kawasan bumi perkemahan di bawah pengelolaan Perhutani. Tempat ini berada di kawasan wisata Bandung Selatan, satu lokasi dengan Kawah Putih, kolam Cimanggu, dan Situ Patenggang.',
    openDays: 'Setiap Hari',
    openTime: '07.00 - 17.00',
    ticketPrice: 'Rp 20.000',
    imageAsset: 'images/ranca-upas.jpg', 
    imageUrls: [
      'https://www.rancaupas.id/wp-content/uploads/2022/09/DSC05254-2-1024x683.jpg',
      'https://www.rancaupas.id/wp-content/uploads/2023/08/Ranca-Upas-Igloo-Camp-Ciwidey.jpg',
      'https://awsimages.detik.net.id/community/media/visual/2020/11/11/ranca-upas_169.jpeg?w=1200',
    ],
  ),
];