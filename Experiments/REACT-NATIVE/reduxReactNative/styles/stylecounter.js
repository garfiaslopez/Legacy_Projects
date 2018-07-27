import { StyleSheet } from 'react-native';

module.exports = StyleSheet.create({
    container:{
        flex: 1,
        backgroundColor:'#F5FCFF',
        alignItems:'center',
        justifyContent:'center'
    },
    text:{
        fontSize: 20,
        textAlign: 'center',
        margin: 10
    },
    description: {
        marginBottom: 20,
        fontSize: 25,
        textAlign: 'center',
        color: '#03A9F4',
    },
    button:{
        height: 60,
        width: 60,
        marginBottom: 10,
    },
    progress: {
        width: 250
    },
    searchInput: {
        height: 36,
        padding: 4,
        fontSize: 18,
        borderWidth: 1,
        borderColor: '#48BBEC',
        borderRadius: 8,
        color: '#48BBEC',
        marginBottom: 10,
        marginLeft: 10,
        marginRight: 10
    }
});
