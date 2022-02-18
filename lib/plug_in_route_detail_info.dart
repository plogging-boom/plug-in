class RouteDetail {
  final double pluggingDistance; // 플로깅 거리
  final double pluggingTime; // 플로깅 시간
  final int kcal;
  final String imageUrl;
  final String memo;

  const RouteDetail(this.pluggingDistance, this.pluggingTime, this.kcal,
      this.imageUrl, this.memo);
}
