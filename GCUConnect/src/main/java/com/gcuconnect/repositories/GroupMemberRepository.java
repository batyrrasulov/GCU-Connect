package com.gcuconnect.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gcuconnect.models.Group;
import com.gcuconnect.models.User;
import com.gcuconnect.models.GroupMember;

@Repository
public interface GroupMemberRepository extends JpaRepository<GroupMember, Long> {
    List<GroupMember> findByGroupId(Group groupId);
    List<GroupMember> findByUserId(User userId);
}
