package com.gcuconnect.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.Group;
import com.gcuconnect.models.User;
import com.gcuconnect.models.GroupMember;
import com.gcuconnect.repositories.GroupMemberRepository;

@Service
public class GroupMemberService {

    @Autowired
    private GroupMemberRepository groupMemberRepository;

    public List<GroupMember> getMembersByGroup(Group groupId) {
        return groupMemberRepository.findByGroupId(groupId);
    }

    public List<GroupMember> getGroupsForUser(User userId) {
        return groupMemberRepository.findByUserId(userId);
    }

    public GroupMember addMember(GroupMember groupMemberId) {
        return groupMemberRepository.save(groupMemberId);
    }

    public void removeMember(Long groupMemberId) {
        groupMemberRepository.deleteById(groupMemberId);
    }
}
