/**
 * Basic routes App
 */
import React, { Component } from 'react';
import { Route, IndexRoute, Redirect } from 'react-router';
import cookie from 'react-cookie';
import ReactCSSTransitionGroup from 'react-addons-css-transition-group';

import ClientListContainer from '../ClientListContainer/ClientListContainer';
import InventoryContainer from '../InventoryContainer/InventoryContainer';
import Login from '../Login/Login';
import Menu from './Menu/Menu';
import NotFound from './NotFound';

function wrapper(Component, key) {
    return React.createClass({
        render: function() {
            const Cookie = cookie.load('InventoryApp');
            if(Cookie){
                return (
                    <Component {...this.props} as={key}/>
                );
            }else{
                return (
                    <Login {...this.props} as={"authLogin"}/>
                );
            }
        }
    });
}

const Routes = (
    <Route path="/">
        <IndexRoute component={wrapper(Login, "authLogin")} />
        <Route path="/Login" component={wrapper(Login, "authLogin")}/>
        <Route path="/Menu" component={Menu}/>
        <Route path="/Inventario" component={InventoryContainer}/>
        <Route path="/ListaClientes" component={ClientListContainer}/>
        <Route path="/*" component={NotFound}/>
    </Route>
);

export default Routes;
