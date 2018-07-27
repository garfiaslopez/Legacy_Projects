/*
    Este es tu archivo de entrada que se va a ejecutar cuando carga tu pagina HTML.
    por lo general en este archivo solo se inicializa REACT en el DIV del HTML.
    Se inicializa con tu COMPONENTE DE ENTRADA (App.js)
*/


import React from 'react';
import ReactDOM from 'react-dom';

import './index.css';

import App from './Components/App'; // IMPORTANDO CON LA RUTA AL COMPONENTE INICIAL


import registerServiceWorker from './registerServiceWorker'; // ESTO ES COSA DEL CREATE REACT APP NO LE HAGAS CASO

ReactDOM.render(<App />, document.getElementById('root')); // SE RENDERA EL COMPONENTE INICIAL (APP)


registerServiceWorker();   // ESTO ES COSA DEL CREATE REACT APP NO LE HAGAS CASO
