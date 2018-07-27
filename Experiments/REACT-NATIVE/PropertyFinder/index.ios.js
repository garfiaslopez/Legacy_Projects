'use strict'
var React = require('react-native');
var SearchPage = require('./SearchPage');

var {
    Component,
    StyleSheet,
    Text,
    NavigatorIOS

} = React;

var styles = StyleSheet.create({
    text: {
        color: 'black',
        backgroundColor: 'white',
        fontSize: 30,
        margin: 80
    },
    container: {
        flex: 1
    }
});

class HelloWorld extends Component {
    render(){
        var hello = <Text style={styles.text}> Hello </Text>
        return hello;
    }
}

class PropertyFinderApp extends Component {
    render(){
        var Navigator  = <NavigatorIOS style={styles.container} initialRoute={{title: 'Property Finder',component: SearchPage}}/>;
        return Navigator;
    }

}

React.AppRegistry.registerComponent('PropertyFinder',function(){
    return PropertyFinderApp;
});
