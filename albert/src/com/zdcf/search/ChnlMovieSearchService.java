package com.zdcf.search;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.SearchQuery;
import org.springframework.stereotype.Service;

import com.zdcf.search.entity.ChnlMovieSearch;
import com.zdcf.search.param.MovieSearchParam;
import com.zdcf.search.param.ZhihuSearchParam;
import com.zdcf.search.repository.ChnlMovieRepository;

@Service("chnlMovieSearchService")
public class ChnlMovieSearchService extends BaseSearchService implements IChnlMovieSearchService {
	@Autowired
	private ChnlMovieRepository chnlMovieRepository;
	
	@Autowired
	private ElasticsearchTemplate elasticsearchTemplate;
	
	//前台用户的搜索
	public List<ChnlMovieSearch> search(MovieSearchParam param) {
		SearchQuery searchQuery = new NativeSearchQueryBuilder()
			    .withQuery(createQuery(param))
			    .withFilter(createFilter(param))
			    .withSort(addSort(param))
			    .withPageable(new PageRequest(param.getI() - 1, param.getS()))
			    .build();
		
		Page<ChnlMovieSearch> page = elasticsearchTemplate.queryForPage(searchQuery, ChnlMovieSearch.class);
		
		param.setTotalNum((int)page.getTotalElements());
		
		return page.getContent();
	}
	
	protected QueryBuilder createQuery(MovieSearchParam param){
		BoolQueryBuilder builder = QueryBuilders.boolQuery();
		
		boolean name = addTitleQuery(param.getName(), builder);
		
		if(name){
			return builder;
		}
		
		return QueryBuilders.matchAllQuery();
	}
	
	public void index(ChnlMovieSearch search){
		chnlMovieRepository.index(search);
	}
	
	public void del(int id){
		chnlMovieRepository.delete(id);
	}
	
	public void save(ChnlMovieSearch search){
		chnlMovieRepository.save(search);
	}

	protected boolean addTitleQuery(String title, BoolQueryBuilder builder){
		if(StringUtils.isNotBlank(title)){
//			title =title.replaceAll("[^a-zA-Z0-9\\u4E00-\\u9FA5]", "");//只查英文、汉字和数字
			String titleStr =title.replaceAll("[^\u4E00-\u9FA5]", "");//只查汉字;
//			String titleStr =title;
			for(int i=0;i<titleStr.length();i++){
				builder.must(QueryBuilders.wildcardQuery("name", "*"+titleStr.charAt(i)+"*"));
			}
			
			return true;
		}
		
		return false;
	}
	
	
	private BoolQueryBuilder createFilter(MovieSearchParam param){
		BoolQueryBuilder builder = QueryBuilders.boolQuery();
	
		this.addTitleQuery(param.getName(), builder);
		
		return builder;
	}
	
	private void addIDFilter(int id, BoolQueryBuilder builder){
		if(id != 0){
			builder.must(QueryBuilders.termQuery("id", id));
		}
	}
	
	private BoolQueryBuilder createIDFilter(ZhihuSearchParam param){
		BoolQueryBuilder builder = QueryBuilders.boolQuery();
		addIDFilter(param.getId()==null?0:param.getId(), builder);
		
		return builder;
	}
	
	//查询单个餐饮
//	public ChnlFoodSearch searchById(ZhihuSearchParam param) {
//		SearchQuery searchQuery = new NativeSearchQueryBuilder()
//			    .withFilter(createIDFilter(param))
//			    .withSort(addSort(param))
//			    .withPageable(new PageRequest(param.getI()-1, param.getS()))
//			    .build();
//
//		Page<ChnlFoodSearch> page = elasticsearchTemplate.queryForPage(searchQuery, ChnlFoodSearch.class);
//		
//		param.setTotalNum((int)page.getTotalElements());
//		
//		if(null!=page&&page.getTotalElements()>0){
//			return page.getContent().get(0);
//		}else{
//			return null;
//		}
//		
//	}
}
