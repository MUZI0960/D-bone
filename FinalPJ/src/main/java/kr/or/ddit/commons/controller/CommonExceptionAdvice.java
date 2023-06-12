package kr.or.ddit.commons.controller;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpServerErrorException.InternalServerError;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@Slf4j
public class CommonExceptionAdvice {
	
//	@ExceptionHandler(NoHandlerFoundException.class)
//	@ResponseStatus(value = HttpStatus.NOT_FOUND)
//	public String exception(NoHandlerFoundException e, Model model) {
//		log.info("에러발생.. 404 : {}", e.getMessage());
//		model.addAttribute("error", e);
//		return "error/error404";
//	}
//	
//	
//	@ExceptionHandler(Exception.class)
//	public String ExceptionAll(Exception e, Model model) {
//		model.addAttribute("error", e);
//		return "error/error500";
//	}
	
}
