package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface AdminRepository extends JpaRepository<Admin, String> {

    @Query("select a from Admin a where a.username=?1 and a.password=?2")
    Optional<Admin> checkadminlogin(String uname, String pwd);
}
