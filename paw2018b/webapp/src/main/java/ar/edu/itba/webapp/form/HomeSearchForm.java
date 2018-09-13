package ar.edu.itba.webapp.form;

import javax.validation.constraints.Size;


public class HomeSearchForm {

	@Size(min = 0,max = 20)
	private String search;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	

}
