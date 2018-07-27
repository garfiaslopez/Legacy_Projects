import React, {
  Component,
  Navigator,
  PropTypes,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
} from 'react-native';

import Login from './Login';

import MK from 'react-native-material-kit';
import styles from '../../styles/stylecounter';

const {
  MKButton,
  MKColor,
  mdl
} = MK;

MK.setTheme({
   primaryColor: MKColor.LightBlue,
   accentColor: MKColor.Purple,
 });

//BUTTONS
const PrimaryButton = MKButton.coloredButton().withStyle(styles.button).build();
const SecondaryButton = MKButton.accentColoredButton().withStyle(styles.button).build();
const FlatButton = MKButton.flatButton().build();

//PROGRESS BAR:
const Indeterminate = mdl.Progress.indeterminateProgress().withStyle(styles.progress).build();

class Counter extends Component {

    componentWillMount() {
        this.setState({enableProgressBar: false});
    }

    componentWillReceiveProps(nextProps) {
        if (nextProps.counter.status === 'Pending request') {
            this.setState({enableProgressBar: true});
        } else {
            this.setState({enableProgressBar: false});
        }
    }

    openLogin(){
        console.log(this.state);
        console.log("------------------");
        console.log(this.props);
        this.props.router.toLogin();
    }

    _incrementAsync(){
        console.log("INCREMETING IN THIS IBJECT");
        this.props.incrementAsync();

    }

    render() {

        var { increment, incrementIfOdd, incrementAsync, decrement, counter, openLogin } = this.props;

        return (
            <View style={styles.container}>

                <Text style={styles.description}>Clicked: {counter.counter} times</Text>

                <PrimaryButton onPress={increment}>
                  <Text style={styles.text}>+</Text>
                </PrimaryButton>

                <SecondaryButton onPress={decrement}>
                  <Text style={styles.text}>-</Text>
                </SecondaryButton>

                <FlatButton onPress={incrementIfOdd}>
                  <Text style={styles.text}>Increment if odd</Text>
                </FlatButton>


                { this.state.enableProgressBar
                    ? (<Indeterminate/>)
                    : (null)
                }
                <FlatButton onPress={this._incrementAsync.bind(this)}>
                  <Text style={styles.text}>Increment async</Text>
                </FlatButton>

                <FlatButton onPress={this.openLogin.bind(this)}>
                  <Text style={styles.text}> Login async</Text>
                </FlatButton>


            </View>
        );
    }
}

Counter.propTypes = {
  increment: PropTypes.func.isRequired,
  incrementIfOdd: PropTypes.func.isRequired,
  incrementAsync: PropTypes.func.isRequired,
  decrement: PropTypes.func.isRequired,
  counter: PropTypes.object.isRequired
};

export default Counter;
