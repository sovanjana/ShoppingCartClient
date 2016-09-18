package com.niit.shoppingcart.handler;

import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.niit.shoppingcart.model.UserDetails;

@Component
public class MyFlowHandler {
	public UserDetails initFlow(){
		return new UserDetails();
	}

	public String validateDetails(UserDetails userDetails,MessageContext messageContext){
		
		String status = "success";
		
		if(userDetails.getId().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("id").defaultText("UserId cannot be Empty").build());
		
			status = "failure";
		}		
		if(userDetails.getName().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("name").defaultText("Username cannot be empty").build());
		
			status = "failure";
		}		
		if(userDetails.getPassword().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("password").defaultText("Password cannot be Empty").build());
		
			status = "failure";
		}		
		if(userDetails.getAddress().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("address").defaultText("Address cannot be Empty").build());
		
			status = "failure";
		}		
		if(userDetails.getEmail().isEmpty()){
			messageContext.addMessage(new MessageBuilder().error().source("email").defaultText("Email cannot be Empty").build());
		
			status = "failure";
		}		
		if(userDetails.getPhone() == null){
			messageContext.addMessage(new MessageBuilder().error().source("phone").defaultText("Phone no is mandatory").build());
		
			status = "failure";
		}		
		return status;
	}
}
