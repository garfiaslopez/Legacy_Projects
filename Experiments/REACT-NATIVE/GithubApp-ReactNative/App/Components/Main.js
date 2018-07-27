var React = require('react-native');
var Api = require('../Utils/Api');
var Dashboard = require('./Dashboard');

//Variables de componentes de REACT
var {
	View,
	Text,
	TextInput,
	TouchableHighlight,
	ActivityIndicatorIOS,
	StyleSheet
} = React;

//Crea los estilos para usarlos en los componentes:
var styles = StyleSheet.create({

  	mainContainer: {
	    flex: 1,
	    padding: 30,
	    marginTop: 65,
	    flexDirection: 'column',
	    justifyContent: 'center',
	    alignItems: 'center',
	    backgroundColor: '#48BBEC'
  	},
	title: {
	    marginBottom: 20,
	    fontSize: 25,
	    textAlign: 'center',
	    color: '#fff'
	},
  	searchInput: {
	    height: 50,
	    padding: 4,
	    marginRight: 5,
	    fontSize: 23,
	    borderWidth: 1,
	    borderColor: 'white',
	    borderRadius: 8,
	    color: 'white'
  	},
  	buttonText: {
    	fontSize: 18,
    	color: '#111',
    	alignSelf: 'center'
  	},
  	button: {
	    height: 45,
	    flexDirection: 'row',
	    backgroundColor: 'white',
	    borderColor: 'white',
	    borderWidth: 1,
	    borderRadius: 8,
	    marginBottom: 10,
	    marginTop: 10,
	    alignSelf: 'stretch',
	    justifyContent: 'center'
  	},
});

//CODIGO O CONTROLLADOR
class Main extends React.Component{
	
	constructor(props){
		super(props);
		this.state = {
			username: "",
			isLoading: false,
			error: false
		}
	}

	handleChange(event){
		this.setState({
			username: event.nativeEvent.text
		});
	}

	handleSubmit(){
		//update Indicator Acitvity

		this.setState({
			isLoading: true
		});

		console.log("SUBMIT", this.state.username)

		Api.getBio(this.state.username).then((res) => {
			console.log(res);
			if(res.message === 'Not Found'){
				this.setState({
					error: 'User Not Found',
					isLoading: false
				});
			}else{
				console.log('changeView');

				this.props.navigator.push({
					title: res.login || 'Select An Option',
					component: Dashboard,
					passProps: {UserInfo: res}
				});

				this.setState({
					isLoading: false,
					error: false,
					username: ''
				});

			}
		});

		//Fetch Data from GITHUB
		//Reroute to next passing data
	}

	render() {

	    var showErr = (
	      this.state.error ? <Text> {this.state.error} </Text> : <View></View>
	    );
		return(
			<View style = {styles.mainContainer}>
				<Text style={styles.title}> Search For A Github User </Text>
				<TextInput
					style={styles.searchInput}
					value={this.state.username}
					onChange={this.handleChange.bind(this)} />
				<TouchableHighlight
					style={styles.button}
					onPress={this.handleSubmit.bind(this)} 
					underlayColor="white">
						<Text style={styles.buttonText}>Search</Text>
				</TouchableHighlight>
				<ActivityIndicatorIOS
					animating = {this.state.isLoading}
					color="#111"
					size="large">
				</ActivityIndicatorIOS>
				{showErr}

			</View>
		)
	}

};

module.exports = Main;

