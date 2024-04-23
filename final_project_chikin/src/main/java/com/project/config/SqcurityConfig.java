package com.project.config;

import com.project.config.auth.CustomAuthFailureHandler;
import com.project.config.oauth.SpringSecOAuth2PrincipalDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AndRequestMatcher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableMethodSecurity(securedEnabled = true)
public class SqcurityConfig {

    private final AuthenticationFailureHandler customFailureHandler;

    @Autowired
    private CustomAuthFailureHandler customAuthFailureHandler;

    @Autowired
    private SpringSecOAuth2PrincipalDetailsService oAuth2PrincipalDetailsService;

    @Autowired
    private UserDetailsService customUserDetailsService;

    @Bean
    BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration
       authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .exceptionHandling().accessDeniedPage("/access-denied")
                .and()
                .authorizeRequests((authorizeHttpRequests) ->
                        authorizeHttpRequests
                                .requestMatchers(new AntPathRequestMatcher("/admin/**"))
                                .authenticated()
                                .anyRequest().permitAll()

                )
                .formLogin(formLogin ->
                        formLogin.loginPage("/member/login")
                                .failureHandler(customAuthFailureHandler)
                                .defaultSuccessUrl("/admin/main")
                                .permitAll()
                        )
                .logout()
                .logoutSuccessUrl("/member/login")
                .invalidateHttpSession(true)
                .and()
                .oauth2Login()
                .loginPage("/member/login")
                .userInfoEndpoint()
                .userService(oAuth2PrincipalDetailsService)
                ;
        return http.build();
    }

    /** UsernameNotFoundException이 작동하지 않는 문제 **/
    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(customUserDetailsService);
        authenticationProvider.setPasswordEncoder(bCryptPasswordEncoder());
//        authenticationProvider.setPasswordEncoder(Encoder());
        authenticationProvider.setHideUserNotFoundExceptions(false);
        return authenticationProvider;

    }
}
