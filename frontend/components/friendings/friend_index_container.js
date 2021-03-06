import { connect } from 'react-redux';

import { fetchFriends, deleteFriend } from '../../actions/friending_actions';
import FriendIndex from './friend_index';
import { openModal, closeModal } from '../../actions/modal_actions';

//closeModal: () => dispatch(closeModal()),
//openModal: () => dispatch(openModal(fetchFriends()))

const mapStateToProps = state => {
  const currId = state.session.id;
  const friends = Object.values(state.entities.friendings).map(friending => {
    if (currId !== friending.friendee_id) {
      const id = friending.friendee_id;
      return state.entities.users[id];
    } else {
      return state.entities.users[friending.friender_id];
    }
  }).filter((friend) => friend === undefined ? false : true );
  return {
    friends
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchFriends: () => dispatch(fetchFriends()),
    deleteFriend: id => dispatch(deleteFriend(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(FriendIndex);
