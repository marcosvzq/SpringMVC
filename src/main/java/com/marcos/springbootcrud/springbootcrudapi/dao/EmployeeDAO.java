package com.marcos.springbootcrud.springbootcrudapi.dao;

import com.marcos.springbootcrud.springbootcrudapi.model.Employee;

import java.util.List;

public interface EmployeeDAO {

    List<Employee> get();

    Employee get(int id);

    void save(Employee employee);

    void delete(int id);
}
