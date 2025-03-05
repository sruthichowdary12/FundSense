package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Admin;

import java.util.Optional;

public interface AdminService {
    Optional<Admin> checkAdminLogin(String username, String password);
    // Additional method signatures can be added here
}
