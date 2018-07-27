import { INCREMENT_COUNTER, DECREMENT_COUNTER, REQUEST, RECEIVE } from '../actions/counter';

const initialState = {
    status: '',
    counter: 0
};

export default function counter(state = initialState, action) {
  switch (action.type) {
  case INCREMENT_COUNTER:
    return {
        status: '',
        counter: state.counter + 1
    }
  case DECREMENT_COUNTER:
    return {
        status: '',
        counter: state.counter - 1
    }
  case REQUEST:
    return {
        status: 'Pending request',
        counter: state.counter
    }
  case RECEIVE:
    return {
        status: 'Done',
        counter: state.counter
    }
  default:
    return state;
  }
};
