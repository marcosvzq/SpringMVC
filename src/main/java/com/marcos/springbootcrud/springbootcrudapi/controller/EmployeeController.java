package com.marcos.springbootcrud.springbootcrudapi.controller;

import com.marcos.springbootcrud.springbootcrudapi.exception.ExceptionController;
import com.marcos.springbootcrud.springbootcrudapi.model.Employee;
import com.marcos.springbootcrud.springbootcrudapi.service.EmployeeService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class EmployeeController implements WebMvcConfigurer {

	private Log logger = LogFactory.getLog(ExceptionController.class);

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView get() {
		ModelAndView mav = new ModelAndView("employeesList");
		List<Employee> list = employeeService.get();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/openEmployeeView")
	public ModelAndView openEmployeeAddView() {
		ModelAndView mav = new ModelAndView("employeesAdd");
		mav.addObject("employee", new Employee());
		return mav;
	}

	@RequestMapping("/save")
	public ModelAndView save(@ModelAttribute("employee") @Valid Employee employeeObj, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			ModelAndView err = new ModelAndView("employeesAdd");
			return err;
		}

		ModelAndView mav = new ModelAndView("redirect:/");
		employeeService.save(employeeObj);
		List<Employee> list = employeeService.get();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/employee/{id}")
	public ModelAndView get(@PathVariable("id") int id) throws Exception{
		ModelAndView mav = new ModelAndView("employeesAdd");
		Employee employeeObj = employeeService.get(id);

		if (employeeObj == null) {
			throw new NullPointerException("Null Pointer Exception");
		}

		mav.addObject("employee", employeeObj);
		return mav;
	}

	@RequestMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("employeesList");
		/*Employee employeeObj = employeeService.get(id);
		if (employeeObj == null) {

		}*/
		employeeService.delete(id);
		List<Employee> list = employeeService.get();
		mav.addObject("list", list);
		return mav;
	}


	@ExceptionHandler(Exception.class)
	public String handleException(HttpServletRequest request, Exception e) {
		logger.error("Request " + request.getRequestURL() + "Threw an Exception", e);
		return "error-specific";
	}

}
