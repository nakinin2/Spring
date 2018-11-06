package je.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardFile {
	
	private int f_no;
	private String f_original_name;
	private String f_stored_name;
	private int f_size;
	private String f_del_yn;
	private int brd_no;
	private List<MultipartFile> files;
	private List<String> filedellist;

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_original_name() {
		return f_original_name;
	}

	public void setF_original_name(String f_original_name) {
		this.f_original_name = f_original_name;
	}

	public String getF_stored_name() {
		return f_stored_name;
	}

	public void setF_stored_name(String f_stored_name) {
		this.f_stored_name = f_stored_name;
	}

	public int getF_size() {
		return f_size;
	}

	public void setF_size(int f_size) {
		this.f_size = f_size;
	}

	public String getF_del_yn() {
		return f_del_yn;
	}

	public void setF_del_yn(String f_del_yn) {
		this.f_del_yn = f_del_yn;
	}

	public int getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}
	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	public List<String> getFiledellist() {
		return filedellist;
	}

	public void setFiledellist(List<String> filedellist) {
		this.filedellist = filedellist;
	}
	
}
