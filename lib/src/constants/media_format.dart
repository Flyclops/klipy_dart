/// The KLIPY API provides five base media formats in various sizes:
///  - GIF: Plays on a continuous loop.
///  - MP4 & WebM: Plays the clip once (except loopedmp4 , which repeats several times).
///  - Transparent WebP & Transparent GIF: Exclusively for sticker content; these are not available in GIF search results.
///
/// https://docs.klipy.com/migrate-from-tenor/response-objects/content-formats
class KlipyMediaFormat {
  static const String preview = "preview";
  static const String gif = "gif";
  static const String mediumGif = "mediumgif";
  static const String tinyGif = "tinygif";
  static const String nanoGif = "nanogif";
  static const String mp4 = "mp4";
  static const String loopedMp4 = "loopedmp4";
  static const String tinyMp4 = "tinymp4";
  static const String nanoMp4 = "nanomp4";
  static const String webm = "webm";
  static const String tinyWebm = "tinywebm";
  static const String nanoWebm = "nanowebm";
  static const String webpTransparent = "webp_transparent";
  static const String tinyWebpTransparent = "tinywebp_transparent";
  static const String nanoWebpTransparent = "nanowebp_transparent";
  static const String gifTransparent = "gif_transparent";
  static const String tinyGifTransparent = "tinygif_transparent";
  static const String nanoGifTransparent = "nanogif_transparent";
}
