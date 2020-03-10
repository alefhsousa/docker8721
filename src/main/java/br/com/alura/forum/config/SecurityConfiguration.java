package br.com.alura.forum.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

import br.com.alura.forum.service.Md5Service;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private Md5Service passwordEncoder;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf()
		.and().authorizeRequests()
		.antMatchers(HttpMethod.GET, "/").permitAll()
		.antMatchers(HttpMethod.GET, "/topicos").permitAll()
		.antMatchers(HttpMethod.GET, "/topicos/novo").authenticated()
		.antMatchers(HttpMethod.GET, "/topicos/*").permitAll()
		.antMatchers("/usuarios/cadastro").permitAll()
		.antMatchers("/login").permitAll()
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/login").defaultSuccessUrl("/").permitAll()
		.and().logout()
		.and().headers().contentSecurityPolicy(getHeaderCSP());
	}
	
	private String getHeaderCSP() {
		return "default-src 'none';" + 
				"base-uri 'self';" + 
				"font-src 'self' data:;" + 
				"form-action 'self';" + 
				"img-src 'self';" + 
				"media-src 'none';" + 
				"object-src 'none';" + 
				"script-src 'self';" + 
				"style-src 'self' 'unsafe-inline'";
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/static/**");
	}

}