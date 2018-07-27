'use strict'

var React = require('react-native');
var SearchResults = require('./SearchResults');

var {
    Component,
    StyleSheet,
    View,
    Text,
    TextInput,
    TouchableHighlight,
    ActivityIndicatorIOS,
    Image
} = React;

var styles = StyleSheet.create({
    description: {
        marginBottom: 20,
        fontSize: 18,
        textAlign: 'center',
        color: '#656565'
    },
    container: {
        padding: 30,
        marginTop: 65,
        alignItems: 'center'
    },
    flowRight: {
        flexDirection: 'row',
        alignItems: 'center',
        alignSelf: 'stretch'
    },
    buttonText: {
        fontSize: 18,
        color: 'white',
        alignSelf: 'center'
    },
    button: {
        height: 36,
        flex: 1,
        backgroundColor: '#48BBEC',
        borderColor: '#48BBEC',
        borderWidth: 1,
        borderRadius: 8,
        marginBottom: 10,
        alignSelf: 'stretch',
        justifyContent: 'center'
    },
    searchInput: {
        height: 36,
        padding: 4,
        marginRight: 5,
        flex: 4,
        fontSize: 18,
        borderWidth: 1,
        borderColor: '#48BBEC',
        borderRadius: 8,
        color: '#48BBEC'
    },
    image: {
        height: 138,
        width: 217
    }
});


class SearchPage extends Component {

    constructor(props){
        super(props);
        this.state = {
            searchString: 'Mexico',
            isLoading: false,
            message: ''
        };
    }

    componentWillReceiveProps(){

        console.log("componentWillReceiveProps");
    }

    componentWillUpdate(){

        console.log("COMPONENT WILL UPDATE");
    }

    componentDidUpdate(){

        console.log("COMPONENT DID UPDATE");
    }


    render(){
        var spinner = this.state.isLoading ? (<ActivityIndicatorIOS hidden='true' size='large' /> ) : (<View/>);

        console.log('SearchPage.render');


        return(
            <View style={styles.container}>
                <Text style={styles.description}>
                    Busca Casas Que Comprar!
                </Text>
                <Text style={styles.description}>
                    Por Lugar, Nombre, Codigo o Cercanos.
                </Text>

                <View style={styles.flowRight}>
                    <TextInput
                        style={styles.searchInput}
                        value={this.state.searchString}
                        onChange={this.onSearchTextChanged.bind(this)}
                        placeholder='Ingresa tu busqueda'/>
                    <TouchableHighlight
                        style={styles.button}
                        underlayColor='#99d9f4'
                        onPress={this.onSearchPressed.bind(this)}>
                        <Text style={styles.buttonText}> Gooo! </Text>
                    </TouchableHighlight>
                </View>

                <TouchableHighlight
                    style={styles.button}
                    underlayColor='#99d9f4'
                    onPress={this.onLocationPressed.bind(this)} >
                    <Text style={styles.buttonText}>Location</Text>
                </TouchableHighlight>

                <Image source={require('image!house')}
                        style={styles.image}/>
                {spinner}
                <Text style={styles.description}>{this.state.message}</Text>
            </View>
        );
    }

    onSearchTextChanged(event) {
        console.log('Cambio El texto');
        console.log("BEFORE MUTATE THE STATE");
        //this.setState({searchString: event.nativeEvent.text});
        this.state = {searchString: event.nativeEvent.text};
        console.log("AFTER MUTATE THE STATE");
        console.log(this.state.searchString);
    }
    onSearchPressed(){
        var query = urlForQueryAndPage('place_name',this.state.searchString,1);
        this._executeQuery(query);
    }

    _executeQuery(query){
        console.log(query);
        this.setState({isLoading: true});
        fetch(query)
            .then(response => response.json())
            .then(json => this._handleResponse(json.response))
            .catch(error =>
                this.state({
                    isLoading:false,
                    message:'Algo Malo Ocrrió ' + error
                }));

    }

    _handleResponse(response){
        this.setState({isLoading:false,message:''});
        if(response.application_response_code.substr(0,1)==='1'){
            console.log('Properties Found:' + response.listings.length);
            this.props.navigator.push({
                title: 'Resultados',
                component: SearchResults,
                passProps: {listings: response.listings}
            });
        }else{
            this.setState({message:'No se encontrarios propiedades.'});
        }
    }

    onLocationPressed(){
        navigator.geolocation.getCurrentPosition(
            location => {
                var Search = location.coords.latitude + ',' + location.coords.longitude;
                console.log("BEFORE MUTATE THE STATE");
                //this.state = {searchString:Search};
                this.setState({searchString:Search});
                console.log("AFTER MUTATE THE STATE");
                var query = urlForQueryAndPage('centre_point',Search,1);
                this._executeQuery(query);
            },
            error => {
                this.setState({message:'Ocurrio un error al obtener tu ubicacion.' + error});
            }
        );
    }
}

function urlForQueryAndPage(key,value,pageNumber){
    var data = {
        country: 'mx',
        pretty: '1',
        encoding: 'json',
        listing_type: 'buy',
        action: 'search_listings',
        page: pageNumber
    };
    data[key] = value;

    var querystring = Object.keys(data).map(key => key + '=' + encodeURIComponent(data[key])).join('&');
    return 'http://api.nestoria.co.uk/api?' + querystring;
}

module.exports = SearchPage;
