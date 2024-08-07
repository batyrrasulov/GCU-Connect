package com.gcuconnect.repositories;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gcuconnect.models.Group;

@Repository
public interface GroupRepository extends JpaRepository<Group, Long> {
    List<Group> findByGroupNameContainingIgnoreCase(String groupName);
}
