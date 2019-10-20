package com.marcos.springbootcrud.springbootcrudapi.service;

import com.marcos.springbootcrud.springbootcrudapi.model.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> get();

    Employee get(int id);

    void save(Employee employee);

    void delete(int id);
}
