import 'package:plug_in/data/model/route.dart';
import 'package:plug_in/data/repository/route_repository.dart';

class RouteService {
  RouteRepository _routeRepository;

  RouteService({required String email})
      : _routeRepository = RouteRepository(email: email);

  addRoute(PlugInRoute plugInRoute) async {
    await _routeRepository.addRoute(plugInRoute.toMap());
  }

  loadRoutes() async {
    List<PlugInRoute> routes = [];
    await _routeRepository.loadRoutes().then((value) => value.docs).then(
        (value) => value.forEach((element) =>
            routes.add(PlugInRoute.fromMap(element.data(), element.id))));
    return routes;
  }
}
