'use strict'

var React = require('react-native');

var {
    Component,
    StyleSheet,
    View,
    Text,
    Image
} = React;

var styles = StyleSheet.create({
    container: {
        marginTop:65,
    },
    heading: {
        backgroundColor: '#F8F8F8'
    },
    separator: {
        height: 1,
        backgroundColor: '#DDDDDD'
    },
    image: {
        width: 400,
        height: 300
    },
    price: {
        fontSize: 25,
        fontWeight: 'bold',
        margin: 5,
        color: '#48BBEC'
    },
    title: {
        fontSize: 20,
        margin: 5,
        color: '#656565'
    },
    description: {
        fontSize: 18,
        margin: 5,
        color: '#656565'
    }

});


class PropertyView extends Component {

    render(){
        var Property = this.props.Property;
        var Stats = Property.bedroom_number + ' cama ' + Property.property_type;
        if(Property.bathroom_number){
            Stats += ', ' + Property.bathroom_number + ' ' + (Property.bathroom_number > 1 ? 'Baños' : 'Baño');
        }
        var Price = Property.price_formatted.split(' ')[0];

        return(
            <View style={styles.container}>
                <Image style={styles.image} source={{uri: Property.img_url}} />
                <View style={styles.heading} >
                    <Text style={styles.price}> $ {Price} </Text>
                    <Text style={styles.title}> {Property.title}</Text>
                    <View style={styles.separator} />
                </View>
                <Text style={styles.description}> {Stats} </Text>
                <Text style={styles.description}> {Property.summary} </Text>
            </View>
        );
    }
}

module.exports = PropertyView;
