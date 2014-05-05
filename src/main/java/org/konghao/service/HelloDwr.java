package org.konghao.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

public class HelloDwr {
	public String say(String name) {
		System.out.println("name:"+name);
		return "hello:"+name;
	}
	
	public String upload(InputStream is,String filename) throws IOException {
		//可以获取相应的ServletApi
		WebContext wc = WebContextFactory.get();
		HttpServletRequest req = wc.getHttpServletRequest();
		String realPath = req.getSession().getServletContext().getRealPath("/img");
		String fn = FilenameUtils.getName(filename);
		FileUtils.copyInputStreamToFile(is, new File(realPath+"/"+fn));
		return fn;
	}
}
