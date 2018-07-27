import { Navigator } from 'react-native';
import Counter from './components/Counter';
import Login from './components/Login';

let _navigator = null;

export default class Router {
  constructor(navigator) {
    _navigator = navigator;
  }

  _navigateTo(route) {
    let currentRoute = this.getCurrentRoute();
    if (route.id !== currentRoute.id) {
      _navigator.push(route);
    }
  }

  getCurrentRoute() {
    let routeList = _navigator.getCurrentRoutes();
    let currentRoute = routeList[routeList.length - 1];
    return currentRoute;
  }

  isCurrentRoute(routeId) {
    return routeId === this.getCurrentRoute().id;
  }

  pop() {
    _navigator.pop();
  }

  popToHome() {
    _navigator.popToTop();
  }

  toHome() {
    this._navigateTo({
      id: 'home',
      title: 'Counter',
      component: Counter
    });
  }

  toLogin() {
    this._navigateTo({
      id: 'login',
      title: 'Login',
      component: Login,
    });
  }
}
