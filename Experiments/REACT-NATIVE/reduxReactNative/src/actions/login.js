import { AsyncStorage } from 'react-native';

import {
    REQUEST_LOGIN,
    RECEIVE_LOGIN

} from '../constants/ActionTypes';


import { API_AUTH } from '../config';

export function request_login(){
    console.log("request_login");
    return{
        type: REQUEST_LOGIN
    };
}

export function receive_login(user){
    console.log("RECIBIO: ");
    console.log(user);
    return{
        type: RECEIVE_LOGIN,
        user
    }
}

export function doLogin(email,pass) {
    console.log("DOING LOGIN");
    console.log(email + "----" + pass);

    return dispatch => {

        console.log("dispatching");

        dispatch(request_login());
     
        return fetch(API_AUTH, {
                  method: 'POST',
                  headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                  },
                  body: JSON.stringify({
                    email: email,
                    password: pass,
                    rememberMe: false,
                    hasRegisteredUser: true
                  })
                })
                .then(response => response.json())
                .then(json => dispatch(receive_login(json)));
     };



}
