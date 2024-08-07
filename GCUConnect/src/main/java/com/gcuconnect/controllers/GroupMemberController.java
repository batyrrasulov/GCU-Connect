package com.gcuconnect.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.gcuconnect.models.Group;
import com.gcuconnect.models.User;
import com.gcuconnect.models.GroupMember;
import com.gcuconnect.services.GroupMemberService;

@RestController
@RequestMapping("/groupMembers")
public class GroupMemberController {

    @Autowired
    private GroupMemberService groupMemberService;

    @GetMapping("/group/{groupId}")
    public ResponseEntity<List<GroupMember>> getMembersByGroup(@PathVariable Long groupId) {
        Group group = new Group();
        group.setGroupId(groupId); // Create a dummy group with the provided groupId
        List<GroupMember> members = groupMemberService.getMembersByGroup(group);
        return ResponseEntity.ok(members);
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<GroupMember>> getGroupsForUser(@PathVariable Long userId) {
        User user = new User();
        user.setUserId(userId); // Create a dummy user with the provided userId
        List<GroupMember> groups = groupMemberService.getGroupsForUser(user);
        return ResponseEntity.ok(groups);
    }

    @PostMapping
    public ResponseEntity<GroupMember> addMember(@RequestBody GroupMember groupMember) {
        GroupMember addedMember = groupMemberService.addMember(groupMember);
        return ResponseEntity.status(HttpStatus.CREATED).body(addedMember);
    }

    @DeleteMapping("/{groupMemberId}")
    public ResponseEntity<Void> removeMember(@PathVariable Long groupMemberId) {
        groupMemberService.removeMember(groupMemberId);
        return ResponseEntity.noContent().build();
    }
}
