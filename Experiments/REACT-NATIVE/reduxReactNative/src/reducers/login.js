import {
    REQUEST_LOGIN,
    RECEIVE_LOGIN
} from '../constants/ActionTypes';

const defaultUserState = {
    isFetching: false,
    authorization: {},
    hasError: false
};

export default function user(state = defaultUserState, action) {
    switch (action.type) {

        case REQUEST_LOGIN:
            return Object.assign({}, state, {
                isFetching: true,
                authrization: {},
                hasError: false
            });

        case RECEIVE_LOGIN:

            return Object.assign({}, state, {
                isFetching: false,
                authrization: action.user,
                hasError: !!action.user.errcode
            });

        default:
            return state;
    }
}
