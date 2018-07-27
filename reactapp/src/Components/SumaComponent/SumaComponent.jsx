import React, { Component } from 'react'; // IMPORTANDO LAS DEPENDENCIAS DE REACT

import './SumaComponent.css'; // IMPORTANDO LOS ESTILOS

class SumaComponent extends Component {

    constructor(props) { // constructor del componente
        super(props); // constructor tambien

        //Declaras el estado inicial del componente
        this.state = {
            firstNumber: 0,
            secondNumber: 0,
            resSuma: 0,
            resMulti: 0
        };

        // Funcion que cambia el estado actual de la app en base al valor de los inputs.
        this.handleChangeFirstNumber = this.handleChangeFirstNumber.bind(this);
        this.handleChangeSecondNumber = this.handleChangeSecondNumber.bind(this);


        //Declaras la funcion de sumar y multiplicar:
        this.sumNumbers = this.sumNumbers.bind(this);
        this.multiNumbers = this.multiNumbers.bind(this);
    }

    componentDidMount() {
        console.log("EL COMPONENTE SE MONTÓ EN EL DOM");
    }

    handleChangeFirstNumber(event) {
        console.log("Cambiando el valor del primer numero");
        console.log(event.target.value);

        this.setState({
            firstNumber: event.target.value
        });
    }

    handleChangeSecondNumber(event) {
        console.log("Cambiando el valor del segundo numero");
        console.log(event.target.value);

        this.setState({
            secondNumber: event.target.value
        });
    }

    sumNumbers() {

        var first = Number(this.state.firstNumber);
        var second = Number(this.state.secondNumber);

        console.log("SUMANDO: " , first, second);

        this.setState({
            resSuma:  first + second
        });
    }

    multiNumbers() {

        var first = Number(this.state.firstNumber);
        var second = Number(this.state.secondNumber);

        console.log("MULTIPLICANDO: ", first, second);

        this.setState({
            resMulti: first * second
        });
    }

    render() {

        return (
            <div className="calc_body">
                <div>
                    <label>
                        Primer Numero:
                        <input
                            type="text"
                            value={ this.state.firstNumber }
                            onChange={ this.handleChangeFirstNumber } />
                    </label>
                </div>

                <div>
                    <label>
                        Segundo Numero:
                        <input
                            type="text"
                            value={ this.state.secondNumber }
                            onChange={ this.handleChangeSecondNumber } />
                    </label>
                </div>

                <button onClick={this.sumNumbers} >
                    SUMAR
                </button>
                <button onClick={this.multiNumbers} >
                    MULTIPLICAR
                </button>

                <p className="texto">
                    { this.state.resSuma }
                </p>

                <p className="texto">
                    { this.state.resMulti }
                </p>

            </div>

        );
    }
}

export default SumaComponent; // RETORNA SIEMPRE EL COMPONENTE...
