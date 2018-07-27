/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

import React, { Component, AppRegistry } from 'react-native';
import { Provider } from 'react-redux/native';
import App from './src/containers/App';
import configureStore from './src/store/configureStore';

const store = configureStore();

class reduxReactNative extends Component {
  render() {
    return (
      <Provider store={store}>
        {() => <App />}
      </Provider>
    );
  }
}

AppRegistry.registerComponent('reduxReactNative', () => reduxReactNative);
