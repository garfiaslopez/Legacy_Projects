import React, {
  Component,
  PropTypes,
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableHighlight,
} from 'react-native';

import MK from 'react-native-material-kit';
import styles from '../../styles/stylecounter';

import { doLogin } from '../actions/login';


const {
  MKButton,
  MKColor,
  MKTextField,
  mdl,
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

class Login extends Component {

    constructor(props) {
        super(props);
        this._emailValue = '';
        this._passwordValue = '';
    }

    doLogin(){
        console.log(this._emailValue);
        console.log(this._passwordValue);
        this.props.doLogin(this._emailValue, this._passwordValue);
    }

    componentWillReceiveProps(nextProps) {
        console.log(nextProps);
    }

    componentWillMount() {
        this.setState({
            enableProgressBar: false
        });

        console.log(this.props);
    }

    render() {

        return (
            <View style={styles.container}>

                <Text style={styles.description}> Iniciar Sesion</Text>

                <TextInput
                    style={styles.searchInput}
                    value={this._username}
                    onChange={(event) => {
                        console.log("onChange()");
                        console.log(event.nativeEvent.text);
                        this._emailValue = event.nativeEvent.text;
                    }}
                    placeholder='Ingresa tu correo'/>

                <TextInput
                    style={styles.searchInput}
                    value={this._password}
                    onChange={(event) => {
                        console.log("onChange()");
                        console.log(event.nativeEvent.text);
                        this._passwordValue = event.nativeEvent.text;
                    }}
                    placeholder='Ingresa tu password'/>

                { this.state.enableProgressBar
                    ? (<Indeterminate/>)
                    : (null)
                }

                <FlatButton onPress = {this.doLogin.bind(this)}>
                  <Text style={styles.text}>Iniciar Sesion</Text>
                </FlatButton>

            </View>
        );
    }
}


Login.propTypes = {
  doLogin: PropTypes.func.isRequired
};

export default Login;
