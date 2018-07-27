import React, {
  View,
  Text,
  Component,
  Navigator
} from 'react-native';


import { connect } from 'react-redux/native';
import Router from '../router';
import Counter from './Counter';
import Login from './Login';
import { changeRoute } from '../actions/routeAction';


export default class Main extends Component {
  componentDidMount() {
    //this.props.dispatch(getUserFromStorage());
  }

  configureScene(route) {
    if (route.sceneConfig) {
      return route.sceneConfig;
    }
    console.log("configureScene");
    return Navigator.SceneConfigs.FloatFromRight;
  }

  _listener(e){

      console.log(e);

  }

  renderScene(route, navigator) {
    if (!this.router) {
      this.router = new Router(navigator);

      navigator.navigationContext.addListener('willfocus', (event) => {
          console.log("WillFoCUS");
      });
      navigator.navigationContext.addListener('didfocus', (event) => {
          console.log("didfocus");
          //this.props.dispatch(changeRoute(event.data.route));
      });

    }
    console.log("RENDER SCENE");
    return <route.component {...this.props} router={this.router} passProps={route.passProps} />;
  }

  render() {
    return (
        <Navigator
          initialRoute={{
            id: 'home',
            title: 'Counter',
            component: Counter
          }}
          configureScene={this.configureScene.bind(this)}
          renderScene={this.renderScene.bind(this)}
          ref='navigator' />
    );
  }
}
