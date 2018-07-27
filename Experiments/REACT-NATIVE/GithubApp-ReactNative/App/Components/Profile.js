var React = require('react-native');
var Badge = require('./Badge');
var Separator = require('./Helpers/Separator');


var {
  	Text,
  	View,
  	StyleSheet,
  	ScrollView
} = React;

var styles = StyleSheet.create({
  	container: {
    	flex: 1
  	},
  	buttonText: {
	    fontSize: 18,
	    color: 'white',
	    alignSelf: 'center'
  	},
  	rowContainer: {
    	padding: 10
  	},
  	rowTitle: {
	    color: '#48BBEC',
	    fontSize: 16
  	},
  	rowContent: {
    	fontSize: 19
  	}
});

class Profile extends React.Component{

  	getRowTitle(user, item){
    	item = (item === 'public_repos') ? item.replace('_', ' ') : item;
    	return item[0] ? item[0].toUpperCase() + item.slice(1) : item;
  	}
  	render(){
	    
	    var UserInfo = this.props.UserInfo;

	    //Map the fields that only interest from the JSON that return Github:
	    var topicArr = ['company', 'location', 'followers', 'following', 'email', 'bio', 'public_repos'];
	    var list = topicArr.map((item, index) => {

	      	if(!UserInfo[item]){
	        	return <View key={index}/>
	      	}else {
	        	return (
	          		<View key={index}>
	            		<View style={styles.rowContainer}>
	              			<Text style={styles.rowTitle}> {this.getRowTitle(UserInfo, item)} </Text>
	              			<Text style={styles.rowContent}> {UserInfo[item]} </Text>
	            		</View>
	            		
	            		<Separator />

	          		</View>

	        	)
	      	}
    	});

	    return (

	      	<ScrollView style={styles.container}>
	        	<Badge UserInfo={this.props.UserInfo}/>
	        		{list}
	      	</ScrollView>
	    )
  	}
};

Profile.propTypes = {
  	UserInfo: React.PropTypes.object.isRequired
}

module.exports = Profile;