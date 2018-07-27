import React, { Component } from 'react'; // IMPORTANDO LAS DEPENDENCIAS DE REACT

import './Header.css'; // IMPORTANDO LOS ESTILOS


class Header extends Component {
    render() {
        return (
            <div className="App">
                <div className="App-header">
                    {this.props.title}
                </div>
            </div>

        );
    }
}

export default Header; // RETORNA SIEMPRE EL COMPONENTE...
