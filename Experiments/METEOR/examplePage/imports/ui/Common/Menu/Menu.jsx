/**
 * MENU COMPONENT
 */
import React, { Component, PropTypes } from 'react';
import MenuStyles from './MenuStyles';

const contextTypes = {
    router: PropTypes.object.isRequired
};

class Menu extends Component {
    constructor(props) {
        super(props);
    }
    redirectTo(path){
        this.context.router.push(path);
    }
    render() {
        return (
            <div style={MenuStyles.ContainerStyle}>
                <h1></h1>
            </div>
        );
    }
}

Menu.contextTypes = contextTypes;


export default Menu;
