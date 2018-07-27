export const INCREMENT_COUNTER = 'INCREMENT_COUNTER';
export const DECREMENT_COUNTER = 'DECREMENT_COUNTER';

export const REQUEST = 'REQUEST';
export const RECEIVE = 'RECEIVE';

export function increment() {
  return {
    type: INCREMENT_COUNTER
  };
};

export function decrement() {
  return {
    type: DECREMENT_COUNTER
  };
};

export function request() {
  return {
    type: REQUEST
  };
};

export function receive() {
  return {
    type: RECEIVE
  };
};

export function incrementIfOdd() {
  return (dispatch, getState) => {
    var { counter } = getState();

    if (counter % 2 === 0) {
      return;
    }

    dispatch(increment());
  };
};

export function incrementAsync(delay) {
  return dispatch => {
      dispatch(request());
      delay = delay || 5000;
    setTimeout(() => {
      dispatch(receive());
      dispatch(increment());
    }, delay);
  };
};
