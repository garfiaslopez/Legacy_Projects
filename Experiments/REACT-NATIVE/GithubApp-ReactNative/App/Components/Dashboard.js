var React = require('react-native');
var Profile = require('./Profile');
var Repositories = require('./Repositories');
var Api = require('../Utils/Api');
var Notes = require('./Notes');

var {
	Text,
	View,
	StyleSheet,
	Image,
  	TouchableHighlight
} = React;

var styles = StyleSheet.create({

	container: {
		marginTop: 65,
		flex: 1
	},
	image: {
		height: 350
	},
	buttonText: {
		fontSize: 24,
		color: 'white',
		alignSelf: 'center'
	}
});


class Dashboard extends React.Component{

	makeBackground(btn) {

	    var obj = {
	      flexDirection: 'row',
	      alignSelf: 'stretch',
	      justifyContent: 'center',
	      flex: 1
	    }

	    if(btn === 0){
	      	obj.backgroundColor = '#48BBEC';
	    } else if (btn === 1){
	      	obj.backgroundColor = '#E77AAE';
	    } else {
	      	obj.backgroundColor = '#758BF4';
	    }
    	
    	return obj;
  	}


  	goToProfile(){
    	console.log('Going to Profile Page');

    	this.props.navigator.push({
      		component: Profile,
      		title: 'Profile Page',
      		passProps: {UserInfo: this.props.UserInfo}
    	})
  	}
  	goToRepos(){
    	console.log('Going to Repos');

    	Api.getRepos(this.props.UserInfo.login).then((res)=>{
    		console.log(res);

    		if(res.message != "Not Found"){

		    	this.props.navigator.push({
		      		component: Repositories,
		      		title: 'Repos',
		      		passProps: {
		      			UserInfo: this.props.UserInfo,
		      			repos: res
		      		}
		    	})

    		}

    	});

  	}
  	goToNotes(){
  		console.log('Going to Notes');
  		console.log(this.props.UserInfo);
  		Api.getNotes(this.props.UserInfo.login).then((jsonRes) => {
        	jsonRes = jsonRes || {};
        	console.log(jsonRes);
        	this.props.navigator.push({
          		component: Notes,
          		title: 'Notes',
          		passProps: {
            		notes: jsonRes,
            		UserInfo: this.props.UserInfo
          		}
        	});
      	});
  	}


	render(){

		return(
	      	<View style={styles.container}>
	        	
	        	<Image source={{uri: this.props.UserInfo.avatar_url}} style={styles.image}/>
	        	
	        	<TouchableHighlight
	            	style={this.makeBackground(0)}
	            	onPress={this.goToProfile.bind(this)}
	            	underlayColor="#88D4F5">
	              	<Text style={styles.buttonText}>View Profile</Text>
	        	</TouchableHighlight>
	        
	        	<TouchableHighlight
	            	style={this.makeBackground(1)}
	            	onPress={this.goToRepos.bind(this)}
	            	underlayColor="#E39EBF">
	              	<Text style={styles.buttonText}>View Repositories</Text>
	        	</TouchableHighlight>
	        
	        	<TouchableHighlight
	            	style={this.makeBackground(2)}
	            	onPress={this.goToNotes.bind(this)}
	            	underlayColor="#9BAAF3">
	              	<Text style={styles.buttonText}>Take Notes</Text>
	        	</TouchableHighlight>

	      </View>
		)

	}


};

module.exports = Dashboard;