import React from 'react';
import FriendIndexItem from './friend_index_item';
import FriendIndexContainer from './friend_index_container';
import { openModal } from '../../actions/modal_actions';

// deleteFriend={this.props.deleteFriend}

// <button className='user-search-btn'
//     onClick={() => openModal()}
//     >
//     +add
//   </button>
class FriendIndex extends React.Component {

  componentDidMount() {
    this.props.fetchFriends();
  }

  render () {
    const friends = this.props.friends.map(friend => {
      return (
        <FriendIndexItem
          className="friend-list"
          key={friend.id}
          friend={friend}
          />
      );
    });

    return (
      <div className="left-sidebar">
        <ul>
          <div className="friend-list-header">
          FRIENDS
          </div>
            {friends}
        </ul>
      </div>
    )
  }

}

export default FriendIndex;
