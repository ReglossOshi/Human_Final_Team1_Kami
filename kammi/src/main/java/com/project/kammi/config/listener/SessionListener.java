package com.project.kammi.config.listener;

import jakarta.servlet.http.HttpSessionEvent;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SessionListener {
    private int sessionTime = 1000;
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setMaxInactiveInterval(sessionTime);
    }
    public void sessionDestroyed(HttpSessionEvent se) {}
}
