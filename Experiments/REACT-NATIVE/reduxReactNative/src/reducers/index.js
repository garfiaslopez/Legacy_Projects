import { combineReducers } from 'redux';

import route from './route';

import counter from './counter';
import login from './login';

const rootReducer = combineReducers({
    route,

    counter,
    login
});

export default rootReducer;
