/**
 * Feed redux reducers
 */
import { merge } from 'lodash';

import {
    REQUEST_CONFIG, UPDATE_CONFIG, RECEIVE_CONFIG, ERROR_CONFIG,
    REQUEST_DATA, UPDATE_DATA, REQUEST_DATA_INFINITE, REQUEST_DATA_TOP,
    RECEIVE_DATA, RECEIVE_DATA_TOP, RECEIVE_DATA_INFINITE, ERROR_DATA, CLEAN_DATA,
    OPEN_MODAL, CLOSE_MODAL, ENABLE_GO_TO_TOP, DISABLE_GO_TO_TOP,
    REQUEST_NUMBER_NEW_DATA, RECEIVE_NUMBER_NEW_DATA, ERROR_NUMBER_NEW_DATA,
    CHANGE_DATA_SET
} from './actions';


/**
 * Configuration
 */

const initialStateConfig = {
    config: {},
    status: { code: -1, info: 'init' }
};

function configReducer(state = initialStateConfig, action = {}) {
    switch (action.type) {
    case REQUEST_CONFIG:
        return {
            config: {},
            status: action.status
        };
    case UPDATE_CONFIG:
        return {
            config: action.data,
            status: action.status
        };
    case RECEIVE_CONFIG:
        return {
            config: action.data,
            status: action.status
        };
    case ERROR_CONFIG:
        return {
            config: {},
            status: action.error
        };
    default:
        return state;
    }
}

/**
 * Data
 */

const initialStateData = {
    dataSet: {},
    status: { code: -1, info: 'init' }
};

function dataReducer(state = initialStateData, action = {}) {
    switch (action.type) {
    case REQUEST_DATA: {
        return {
            dataSet: {},
            status: action.status
        };
    }
    case UPDATE_DATA: {
        return {
            dataSet: action.data,
            status: action.status
        };
    }
    case REQUEST_DATA_INFINITE: {
        return {
            dataSet: state.dataSet,
            status: action.status
        };
    }
    case REQUEST_DATA_TOP: {
        return {
            dataSet: state.dataSet,
            status: action.status
        };
    }
    case RECEIVE_DATA: {
        return {
            dataSet: action.data,
            status: action.status
        };
    }
    case RECEIVE_DATA_INFINITE: {
        const NewData = action.data;
        if (state.dataSet.data) {
            NewData.data = state.dataSet.data.concat(action.data.data);
        }
        return {
            dataSet: NewData,
            status: action.status
        };
    }
    case RECEIVE_DATA_TOP: {
        const OriginalData = state.dataSet;
        action.data.data.map((value) => {
            OriginalData.data.unshift(value);
        });
        return {
            dataSet: OriginalData,
            status: action.status
        };
    }
    case ERROR_DATA: {
        return {
            dataSet: {},
            status: action.error
        };
    }
    case CLEAN_DATA: {
        return {
            dataSet: {},
            status: { code: -1, info: 'init' }
        };
    }
    default:
        return state;
    }
}


/**
 * Modal
 */

const initialStateModal = {
    element: {},
    status: false
};

function modalReducer(state = initialStateModal, action = {}) {
    switch (action.type) {
    case OPEN_MODAL:
        return {
            element: action.element,
            status: true
        };
    case CLOSE_MODAL:
        return {
            element: {},
            status: false
        };
    default:
        return state;
    }
}


/**
 * TOP
 */

const initialStateGoTop = {
    go: false,
};

function goToTopReducer(state = initialStateGoTop, action = {}) {
    switch (action.type) {
    case ENABLE_GO_TO_TOP:
        return {
            go: true,
        };

    case DISABLE_GO_TO_TOP:
        return {
            go: false,
        };
    default:
        return state;
    }
}

/**
 * NEW DATA
 */

const initialStateNewData = {
    newData: {},
    status: 0
};

function newDataReducer(state = initialStateNewData, action = {}) {
    switch (action.type) {
    case REQUEST_NUMBER_NEW_DATA:
        return {
            newData: {},
            status: action.status
        };
    case RECEIVE_NUMBER_NEW_DATA:
        return {
            newData: action.data,
            status: action.status
        };
    case ERROR_NUMBER_NEW_DATA:
        return {
            newData: {},
            status: action.error
        };
    default:
        return state;
    }
}


/**
 * CHANGE DATASET
 */

const initialStateChangeDataSet = {
    index: 0,
};

function changeDataSetReducer(state = initialStateChangeDataSet, action = {}) {
    switch (action.type) {
    case CHANGE_DATA_SET:
        return {
            index: action.index,
        };
    default:
        return state;
    }
}

export const MultiReducerConfig = [
    {
        func: configReducer,
        name: 'config'
    },
    {
        func: dataReducer,
        name: 'data'
    },
    {
        func: modalReducer,
        name: 'modal'
    },
    {
        func: goToTopReducer,
        name: 'top'
    },
    {
        func: newDataReducer,
        name: 'newData'
    },
    {
        func: changeDataSetReducer,
        name: 'changeDataSet'
    }
];
