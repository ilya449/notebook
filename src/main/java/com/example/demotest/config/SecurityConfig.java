package com.example.demotest.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@PropertySource("classpath:application.properties")
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    public static final String USER_ROLE = "USER";
    public static final String ADMIN_ROLE = "ADMIN";

    @Value("${defaultUserName}")
    private String commonUserName;
    @Value("${defaultUserPassword}")
    private String commonUserPassword;
    @Value("${defaultAdminName}")
    private String adminName;
    @Value("${defaultAdminPassword}")
    private String adminPassword;

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser(commonUserName).password("{noop}" + commonUserPassword).roles(USER_ROLE)
                .and()
                .withUser(adminName).password("{noop}" + adminPassword).roles(ADMIN_ROLE);
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/admin").hasAnyRole("ADMIN")
                .antMatchers("/user").hasAnyRole("USER")
                .and()
                .formLogin().permitAll()
                .and()
                .logout().permitAll()
                .logoutSuccessUrl("/")
                .and()
                .exceptionHandling().accessDeniedPage("/denied")
                .and()
                .csrf().disable();
    }
}
