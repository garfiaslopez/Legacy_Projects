/**
 * MENU COMPONENT
 */
import React, { Component, PropTypes } from 'react';
import Drawer from 'material-ui/Drawer';
import MenuItem from 'material-ui/MenuItem';
import AppBar from 'material-ui/AppBar';
import InventoryStyles from './InventoryStyles';

class InventoryContainer extends Component {

    constructor(props) {
        super(props);
        this.state = {open: false};
        this.handleToggle = this.handleToggle.bind(this);
    }
    handleToggle(){
        this.setState({open: !this.state.open});
    }

    render() {
        return (
            <div>
                <div style={InventoryStyles}>
                    <AppBar
                      style = {{ margin: 0 }}
                      title="Inventario"
                      onLeftIconButtonTouchTap={this.handleToggle}
                    />
                </div>
                <Drawer
                  open={this.state.open}
                  docked={false}
                  onRequestChange={this.handleToggle}
                >
                    <MenuItem>Menu Item</MenuItem>
                    <MenuItem>Menu Item 2</MenuItem>
                </Drawer>
            </div>
        );
    }
}

export default InventoryContainer;
