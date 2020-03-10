package br.com.alura.forum.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.owasp.validator.html.AntiSamy;
import org.owasp.validator.html.Policy;

@WebFilter("/")
public class AntiSamyFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		chain.doFilter(new FilteredRequest(request), response);
	}

	public void destroy() {
	}

	public void init(FilterConfig filterConfig) {
	}
	
	class FilteredRequest extends HttpServletRequestWrapper {
		
		public FilteredRequest(ServletRequest request) {
			super((HttpServletRequest) request);
		}

		public String sanitize(String input) {
			if (input == null) {
				return null;
			}
			
			try {
				AntiSamy antiSamy = new AntiSamy(Policy.getInstance(this.getClass().getClassLoader().getResource("antisamy-tinymce.xml")));
				return antiSamy.scan(input).getCleanHTML();
			} catch (Exception e) {
				throw new RuntimeException("Erro ao sanitizar input!", e);
			}
		}

		public String getParameter(String paramName) {
			String value = super.getParameter(paramName);
			return sanitize(value);
		}

		public String[] getParameterValues(String paramName) {
			String values[] = super.getParameterValues(paramName);
			for (int i = 0; i < values.length; i++) {
				values[i] = sanitize(values[i]);
			}
			return values;
		}
	}

}