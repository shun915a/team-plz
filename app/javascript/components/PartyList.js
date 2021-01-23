import React from "react"
import RecruitmentItem from "./RecruitmentItem"


class PartyList extends React.Component {
  render () {
    const post = this.props.post
    const tags = this.props.tags
    const userId = this.props.userId

    return (
        <RecruitmentItem
          category = "PARTY"
          editUrl = "parties"
          id = { post.id }
          currentUserId = { userId }
          postUserId = { post.user_id }
          title = { post.party_title }
          gameId = { post.party_game_id }
          tags = { tags }
          text = { post.party_text }
        />
    );
  }
}

export default PartyList
