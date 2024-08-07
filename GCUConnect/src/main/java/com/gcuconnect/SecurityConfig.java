package com.gcuconnect;

import org.springframework.context.annotation.*;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers(new AntPathRequestMatcher("/css/**"),new AntPathRequestMatcher("/login"),new AntPathRequestMatcher("/posts/**")).permitAll() 
                .requestMatchers(new AntPathRequestMatcher("/api/**")).authenticated()
                .anyRequest().authenticated() 
            )
            .formLogin(formLogin -> formLogin
                .loginPage("/login")
                .defaultSuccessUrl("/", true)
                .permitAll()
            )
            .logout(logout -> logout
                    .logoutSuccessUrl("/login") 
                    .permitAll()
                )
            .httpBasic(Customizer.withDefaults())
            .rememberMe(Customizer.withDefaults());
        return http.build();
    }
}
