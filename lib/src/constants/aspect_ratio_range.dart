/// Filter the results to only include GIFs with aspect ratios that fit within the selected range.
///
/// https://docs.klipy.com/migrate-from-tenor look for "ar_range"
enum KlipyAspectRatioRange {
  /// No constraints
  all,

  /// 0.42 <= aspect ratio <= 2.36
  wide,

  /// 0.56 <= aspect ratio <= 1.78
  standard,
}
