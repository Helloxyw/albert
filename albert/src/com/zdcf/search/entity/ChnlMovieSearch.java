package com.zdcf.search.entity;

import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldIndex;
import org.springframework.data.elasticsearch.annotations.FieldType;

@Document(indexName = "chnl", type = "movie")
public class ChnlMovieSearch extends SearchBase{

	@Field(
			type = FieldType.String,
			index = FieldIndex.analyzed,
			searchAnalyzer = "standard",
			analyzer = "standard",
			store = true
			)
	private String name;
	
	@Field(type = FieldType.String, index = FieldIndex.no, store = true)
	private String img;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
}
