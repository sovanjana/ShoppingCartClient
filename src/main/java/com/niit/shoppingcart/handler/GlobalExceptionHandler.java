package com.niit.shoppingcart.handler;


import java.io.IOException;
import java.sql.SQLException;
import org.hibernate.hql.internal.ast.QuerySyntaxException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
	
	private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
	@ExceptionHandler(value = SQLException.class)
	public ModelAndView handleSQLException(HttpServletRequest request, Exception e){
		log.error("SQLException Occured:: URL="+request.getRequestURL());
		log.error("SQLException Occured:: Exception="+e.getMessage());
	      
		ModelAndView mv = new ModelAndView("exception");
	    mv.addObject("error", e.getMessage());
		
		return mv;
	}
	
	@ExceptionHandler(QuerySyntaxException.class)
	public ModelAndView handleQuerySyntaxException(HttpServletRequest request, Exception e){
		log.error("Query Syntax Exception Occured:: URL="+request.getRequestURL());
		log.error("Query Syntax Occured:: Exception="+e.getMessage());
		 
		ModelAndView mv = new ModelAndView("exception");
	    mv.addObject("error", e.getMessage());
		
		return mv;
	}
	@ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView noHandlerException(HttpServletRequest request, Exception e)   {
		log.error("NoHandlerException Occured:: URL="+request.getRequestURL());
		log.error("NoHandlerException Occured:: Exception="+e.getMessage());
            ModelAndView mv = new ModelAndView("exception");
            mv.addObject("error", e.getMessage());
            
            mv.addObject("exception", e);  
            return mv;
    }
	
	@ExceptionHandler(IOException.class)
	public ModelAndView handleIOException(HttpServletRequest request, Exception e){
		log.error("IOException handler executed");
		log.error("IOException Occured:: Exception="+e.getMessage());
	      
		  ModelAndView mv = new ModelAndView("exception");
		  mv.addObject("error", e.getMessage());
		  
          mv.addObject("exception", e);  
          return mv;		
	}	
	
	@ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ModelAndView handleResourceNotFoundException(HttpServletRequest request, Exception e) {
		log.error("RuntimeException handler executed");
		log.error("RuntimeException Occured:: Exception="+e.getMessage());
		
		ModelAndView mv = new ModelAndView("exception");
		mv.addObject("error", e.getMessage());
		
		mv.addObject("exception", e);
		return mv;
    }
	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView handleException(HttpServletRequest request, Exception e) {
		log.error("UnknownException handler executed");
		log.error("Unknown exception occurred:: Exception="+e.getMessage());
		
		ModelAndView mv = new ModelAndView("exception");
		mv.addObject("error", e.getMessage());
		
		return mv;
	}
}
