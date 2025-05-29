package service;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface CommandProcess { // 모든 서비스는 CommandProcess 상속받음
		public String requestePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}