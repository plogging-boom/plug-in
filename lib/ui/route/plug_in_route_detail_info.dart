class RouteDetail {
  final double pluggingDistance; // 플로깅 거리
  final double pluggingTime;
  final String pluggingMapImage; // 플로깅 시간
  final int kcal;
  final String userImageUrl;

  final String? memo;

  const RouteDetail(
      {required this.pluggingDistance,
      required this.pluggingTime,
      required this.pluggingMapImage,
      required this.kcal,
      required this.userImageUrl,
      this.memo});
}
