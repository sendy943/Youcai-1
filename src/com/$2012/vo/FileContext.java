package com.$2012.vo;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.$2012.utils.ImageSizer;

/*
 * �ϴ��ļ�����װ�ࣩ
 */
@Component("fileCtx")
@Scope("prototype")
public class FileContext {
	/*�ϴ����ļ�*/
	private File file;
	/*�ļ���*/
	private String fileFileName;
	/*�ļ�����*/
	private String fileContentType;
	/*Ĭ��ѹ����Ŀ��*/
	private int width = 160;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	/*
	 * simpleDir -- \\images\\brand\\ -- ·��ͷ��
	 * fileSize -- 1024*1024*10 -- �޶��ϴ��ļ���С10M
	 */
	public String makeUploadPath(FileContext fileCtx, String simpleDir, long fileSize) {
		if (fileCtx.getFile() == null) return "";//δ�ϴ��ļ�ʱ���ļ�·��Ϊ""
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd/HH");
//		linux �ļ�·��
		String filePath = ServletActionContext.getServletContext()
		.getRealPath(simpleDir.replace("\\", "/") + sdf.format(new Date()));
		//ԭ����
//		String filePath = ServletActionContext.getServletContext()
//				.getRealPath(simpleDir + sdf.format(new Date()));
		
		
		File filePathDir = new File(filePath);
		if (!filePathDir.exists()) filePathDir.mkdirs();
		if (fileCtx.getFile().length() > fileSize) return "toobig";
		String fileFileName = fileCtx.getFileFileName();
		File target = new File(filePathDir + "/prototype", fileFileName);
		try {
			//���ϴ����ļ�����ʱĿ¼������targetĿ¼
			FileUtils.copyFile(fileCtx.getFile(), target);
			//��targetĿ¼����ļ�ѹ�����浽filePathDir
			ImageSizer.resize(target, new File(filePathDir, fileFileName), fileCtx.getWidth(), "gif");
		} catch (IOException e) {
			e.printStackTrace();
			return "ioexception";
		}
		//���ļ�����·��
		String filePath2 =  filePathDir.getPath().substring(filePathDir.getPath().indexOf(simpleDir.replace("\\", "/"))) + "/" + fileFileName;
//		String filePath2 =  filePathDir.getPath().substring(filePathDir.getPath().indexOf(simpleDir)) + "/" + fileFileName;
		//ת��·���ָ���
		String filePath3 = filePath2.replace('\\', '/');
		return filePath3;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
}
