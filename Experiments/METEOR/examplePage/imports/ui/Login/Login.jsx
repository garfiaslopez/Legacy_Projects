/**
 * LOGIN COMPONENT
 */
import React, { Component, PropTypes } from 'react';
import Avatar from 'material-ui/Avatar';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import Dialog from 'material-ui/Dialog';
import FlatButton from 'material-ui/FlatButton';
import LoginStyles from './LoginStyles';

const contextTypes = {
    router: PropTypes.object.isRequired
};

class Login extends Component {

    constructor(props) {
        super(props);
        this.state = {
                open: false
        };
        this.doLogin = this.doLogin.bind(this);
        this.handleOpen = this.handleOpen.bind(this);
        this.handleClose = this.handleClose.bind(this);
    }
    componentDidMount() {

    }
    handleOpen() {
      this.setState({open: true});
    };
    handleClose() {
      this.setState({open: false});
    };
    doLogin() {
        if(this.refs.email.input.value !== '' && this.refs.password.input.value !== ''){
            this.context.router.push('/Menu');
        }else{
            this.handleOpen();
        }
    }
    render() {
        const actions = [
          <FlatButton
            label="Entendido"
            primary={true}
            onClick={this.handleClose}
          />,
        ];
        return (
            <div style={LoginStyles.ContainerStyle}>
                <div style={LoginStyles.CenterContainer}>
                    <Avatar
                      src="http://localhost:3001/Profile.png"
                      size={200}
                      style={LoginStyles.ChildContainer}
                    />
                    <TextField
                      ref="email"
                      hintText="user@name.com"
                      floatingLabelText="Email"
                      style={LoginStyles.ChildContainer}
                    />
                    <TextField
                      ref="password"
                      hintText="********"
                      floatingLabelText="Password"
                      style={LoginStyles.ChildContainer}
                    />
                    <br/>
                    <br/>
                    <RaisedButton
                      label="Iniciar Sesión"
                      primary={true}
                      style={LoginStyles.ChildContainer}
                      onClick={this.doLogin}
                    />

                </div>
            <Dialog
              actions={actions}
              modal={false}
              open={this.state.open}
              onRequestClose={this.handleClose}
            >
              Favor de rellenar todos los campos.
            </Dialog>
            </div>
        );
    }
}

Login.contextTypes = contextTypes;


export default Login;
