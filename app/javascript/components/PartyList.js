import React from "react";
import RecruitmentItem from "./RecruitmentItem";

export default function PartyList(props) {
  const post = props.post;
  const tags = props.tags;
  const userId = props.userId;
  const date = props.date;
  const members = props.members;

  return (
    <RecruitmentItem
      category="PARTY"
      editUrl="parties"
      id={post.id}
      currentUserId={userId}
      postUserId={post.user_id}
      title={post.party_title}
      gameId={post.party_game_id}
      tags={tags}
      text={post.party_text}
      date={date}
      members={members}
    />
  );
}
