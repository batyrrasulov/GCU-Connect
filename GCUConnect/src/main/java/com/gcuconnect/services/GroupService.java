package com.gcuconnect.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gcuconnect.models.Group;
import com.gcuconnect.repositories.GroupRepository;

@Service
public class GroupService {

    @Autowired
    private GroupRepository groupRepository;

    public List<Group> getGroupsByName(String groupName) {
        return groupRepository.findByGroupNameContainingIgnoreCase(groupName);
    }

    public Group createGroup(Group group) {
        return groupRepository.save(group);
    }

    public void deleteGroup(Long groupId) {
        groupRepository.deleteById(groupId);
    }
}
