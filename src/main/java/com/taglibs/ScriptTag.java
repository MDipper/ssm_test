package com.taglibs;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

public class ScriptTag extends TagSupport {

	private static final long serialVersionUID = 1L;

	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public int doEndTag() throws JspException {
		try {
			pageContext.getOut().print("</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Tag.EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		if (this.url != null && this.url.startsWith("~")) {
			try {
				pageContext.getOut().print(String.format("<script type=\"text/javascript\" src=\"%s%s\">",
						this.pageContext.getServletContext().getContextPath(), this.url.substring(1)));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return Tag.SKIP_BODY;
	}
}
