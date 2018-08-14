import { RECEIVE_CURRENT_USER } from '../actions/session_actions';
import merge from 'lodash/merge';

import {
  RECEIVE_ALL_FRIENDS,
} from '../actions/friending_actions';

const usersReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return merge({}, state, {[action.currentUser.id]: action.currentUser});
    case RECEIVE_ALL_FRIENDS:
      return merge({}, state, action.payload.users);
    default:
      return state;
  }
};

export default usersReducer;
