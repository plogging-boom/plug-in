class RouteDetail {
  final double pluggingDistance; // 플로깅 거리
  final double pluggingTime; // 플로깅 시간
  final int kcal;
  final String imageUrl;
  final String? memo;

  const RouteDetail(
      {required this.pluggingDistance,
      required this.pluggingTime,
      required this.kcal,
      required this.imageUrl,
      this.memo});
}
