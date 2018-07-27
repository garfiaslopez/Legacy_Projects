/**
 * Feed redux actions
 */
function fetchXHR(url, method, data) {
    return new Promise((resolve, reject) => {
        const request = new XMLHttpRequest();
        request.open(method, url, true);
        request.setRequestHeader('Content-Type', 'application/JSON');
        request.send(JSON.stringify(data));
        request.onreadystatechange = function handleResponse() {
            if (this.responseText !== undefined && this.responseText !== ''
                && this.responseText !== null && this.responseText !== ' '
                && this.responseText[this.responseText.length - 1] === '}') {
                const response = {
                    json: JSON.parse(this.responseText),
                    status: {
                        info: this.statusText,
                        code: this.status
                    }
                };
                resolve(response);
            }
        };
        request.onerror = function handleError(error) {
            reject(error);
        };
    });
}

/**
 * Redux actions list config
 */

export const REQUEST_CONFIG = 'REQUEST_CONFIG';
export const RECEIVE_CONFIG = 'RECEIVE_CONFIG';
export const UPDATE_CONFIG = 'UPDATE_CONFIG';
export const ERROR_CONFIG = 'ERROR_CONFIG';
export const CLEAN_DATA = 'CLEAN_DATA';

function fetchConfigAPI(url, method, data) {
    return (dispatch) => {
        dispatch({
            type: REQUEST_CONFIG,
            status: { code: 0, info: 'Loading' }
        });
        dispatch({
            type: CLEAN_DATA,
        });
        return fetchXHR(url, method, data)
            .then((response) => {
                if (response.status.code >= 400) {
                    throw new Error({ info: response.status.info, code: response.status.code });
                }
                dispatch({
                    type: RECEIVE_CONFIG,
                    data: response.json,
                    status: response.status
                });
            })
            .catch((err) => {
                if (err.code) {
                    dispatch({ type: ERROR_CONFIG, error: err });
                }
                dispatch({ type: ERROR_CONFIG, error: { info: err.message, code: 400 } });
            });
    };
}
function updateConfigAPI(newConfig) {
    return (dispatch) => {
        dispatch({
            type: UPDATE_CONFIG,
            data: newConfig,
            status: { code: 200, info: 'OK' }

        });
    };
}

/**
 * Redux actions list data
 */
export const REQUEST_DATA = 'REQUEST_DATA';
export const UPDATE_DATA = 'UPDATE_DATA';
export const REQUEST_DATA_TOP = 'REQUEST_DATA_TOP';
export const REQUEST_DATA_INFINITE = 'REQUEST_DATA_INFINITE';
export const RECEIVE_DATA = 'RECEIVE_DATA';
export const RECEIVE_DATA_TOP = 'RECEIVE_DATA_TOP';
export const RECEIVE_DATA_INFINITE = 'RECEIVE_DATA_INFINITE';
export const ERROR_DATA = 'ERROR_DATA';

function fetchDataAPI(url, method, data, loading = true) {
    return (dispatch) => {
        if (loading) {
            dispatch({
                type: REQUEST_DATA,
                status: { code: 0, info: 'Loading' }
            });
        }
        return fetchXHR(url, method, data)
            .then((response) => {
                if (response.status.code >= 400) {
                    throw new Error({ info: response.status.info, code: response.status.code });
                }
                dispatch({
                    type: RECEIVE_DATA,
                    data: response.json,
                    status: response.status
                });
            })
            .catch((err) => {
                if (err.code) {
                    dispatch({ type: ERROR_DATA, error: err });
                }
                dispatch({ type: ERROR_DATA, error: { info: err.message, code: 400 } });
            });
    };
}
function updateDataAPI(newData) {
    return (dispatch) => {
        dispatch({
            type: UPDATE_DATA,
            data: newData,
            status: { code: 200, info: 'OK' }
        });
    };
}

function fetchDataInfiniteAPI(url, method, data) {
    return (dispatch) => {
        dispatch({
            type: REQUEST_DATA_INFINITE,
            status: { code: 700, info: 'LoadingInfinite' }
        });
        return fetchXHR(url, method, data)
            .then((response) => {
                if (response.status.code >= 400) {
                    throw new Error({ info: response.status.info, code: response.status.code });
                }
                dispatch({
                    type: RECEIVE_DATA_INFINITE,
                    data: response.json,
                    status: response.status
                });
            })
            .catch((err) => {
                if (err.code) {
                    dispatch({ type: ERROR_DATA, error: err });
                }
                dispatch({ type: ERROR_DATA, error: { info: err.message, code: 400 } });
            });
    };
}

function fetchDataTopAPI(url, method, data) {
    return (dispatch) => {
        dispatch({
            type: REQUEST_DATA_TOP,
            status: { code: 800, info: 'LoadingTop' }
        });
        return fetchXHR(url, method, data)
            .then((response) => {
                if (response.status.code >= 400) {
                    throw new Error({ info: response.status.info, code: response.status.code });
                }
                dispatch({
                    type: RECEIVE_DATA_TOP,
                    data: response.json,
                    status: response.status
                });
            })
            .catch((err) => {
                if (err.code) {
                    dispatch({ type: ERROR_DATA, error: err });
                }
                dispatch({ type: ERROR_DATA, error: { info: err.message, code: 400 } });
            });
    };
}

/**
 * Redux actions modal action
 */
export const OPEN_MODAL = 'OPEN_MODAL';
export const CLOSE_MODAL = 'CLOSE_MODAL';

function openModalAction(object) {
    return (dispatch) => {
        dispatch({ type: OPEN_MODAL, element: object });
    };
}
function closeModalAction() {
    return (dispatch) => {
        dispatch({ type: CLOSE_MODAL });
    };
}

/**
 * Redux action go to top
 */
export const ENABLE_GO_TO_TOP = 'ENABLE_GO_TO_TOP_FEED';
export const DISABLE_GO_TO_TOP = 'DISABLE_GO_TO_TOP_FEED';

function top() {
    return (dispatch) => {
        dispatch({ type: ENABLE_GO_TO_TOP });
    };
}

function offtop() {
    return (dispatch) => {
        dispatch({ type: DISABLE_GO_TO_TOP });
    };
}

/**
 * Redux action for change main DataSet
 */
export const CHANGE_DATA_SET = 'CHANGE_DATA_SET';

function changeDataSet(Index) {
    return (dispatch) => {
        dispatch({
            type: CHANGE_DATA_SET,
            index: Index
        });
    };
}

/**
 * Redux action request count of newTweets
 */
export const REQUEST_NUMBER_NEW_DATA = 'REQUEST_NUMBER_NEW_DATA';
export const RECEIVE_NUMBER_NEW_DATA = 'RECEIVE_NUMBER_NEW_DATA';
export const ERROR_NUMBER_NEW_DATA = 'ERROR_NUMBER_NEW_DATA';

function fetchNewDataCount(url, method, data) {
    return (dispatch) => {
        dispatch({
            type: REQUEST_NUMBER_NEW_DATA,
            status: { code: 0, info: 'Loading' }
        });
        return fetchXHR(url, method, data)
            .then((response) => {
                if (response.status.code >= 400) {
                    throw new Error({ info: response.status.info, code: response.status.code });
                }
                dispatch({
                    type: RECEIVE_NUMBER_NEW_DATA,
                    data: response.json,
                    status: response.status
                });
            })
            .catch((err) => {
                if (err.code) {
                    dispatch({ type: ERROR_NUMBER_NEW_DATA, error: err });
                }
                dispatch({ type: ERROR_NUMBER_NEW_DATA, error: { info: err.message, code: 400 } });
            });
    };
}

export const CoreActions = {
    fetchConfig: function fetchConfig(url, method, data) {
        return (dispatch) => dispatch(fetchConfigAPI(url, method, data));
    },
    updateConfig: function updateConfig(newConfig) {
        return (dispatch) => dispatch(updateConfigAPI(newConfig));
    },
    fetchData: function fetchData(url, method, data, loading) {
        return (dispatch) => dispatch(fetchDataAPI(url, method, data, loading));
    },
    updateData: function updateData(newData) {
        return (dispatch) => dispatch(updateDataAPI(newData));
    },
    fetchDataInfinite: function fetchDataInfinite(url, method, data) {
        return (dispatch) => dispatch(fetchDataInfiniteAPI(url, method, data));
    },
    fetchDataTop: function fetchDataTop(url, method, data) {
        return (dispatch) => dispatch(fetchDataTopAPI(url, method, data));
    },
    fetchNumberOfNewData: function fetchNumberOfNewData(url, method, data) {
        return (dispatch) => dispatch(fetchNewDataCount(url, method, data));
    },
    goToTop: function goToTop() {
        return (dispatch) => dispatch(top());
    },
    offToTop: function offToTop() {
        return (dispatch) => dispatch(offtop());
    },
    openModal: function openModal(data) {
        return (dispatch) => dispatch(openModalAction(data));
    },
    closeModal: function closeModal() {
        return (dispatch) => dispatch(closeModalAction());
    },
    changeDataSet: function changeData(index) {
        return (dispatch) => dispatch(changeDataSet(index));
    }
};
