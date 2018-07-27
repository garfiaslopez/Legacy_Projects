import React, { Component } from 'react'; // IMPORTANDO LAS DEPENDENCIAS DE REACT

import './App.css'; // IMPORTANDO LOS ESTILOS

import Header from './Header/Header';  // Importando el componente HEADER
import SumaComponent from './SumaComponent/SumaComponent';  // Importando el componente SumaComponent

class App extends Component {
    render() {
        return (
            <div className="Container">
                <Header
                    title={'TITULO BIEN MACHIN'}
                />
                <SumaComponent />
            </div>
        );
    }
}

export default App;
