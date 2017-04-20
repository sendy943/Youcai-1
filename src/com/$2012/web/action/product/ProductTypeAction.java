package com.$2012.web.action.product;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.$2012.entity.product.ProductType;
import com.$2012.service.product.ProductTypeService;
import com.$2012.vo.PageContext;
import com.$2012.vo.QueryResult;
import com.opensymphony.xwork2.ActionSupport;

@Component  //��ʵ�ϸ��ʺϱ�ע��@Controller
@Scope("prototype")
public class ProductTypeAction extends ActionSupport {
	private static final long serialVersionUID = -1271770418471621275L;
	private ProductTypeService productTypeService;
	private ProductType type;
	//���Դ�ֵ����ģ�ʹ�ֵ��ʱ���ø�ǡ��,��Ϊ��������̫���ˣ�
	//��������Ҳ��ʧΪһ��ѡ���ҿɱ����ָ���쳣�������Դ�null��
	private Integer parentId;
	private String parentName;
	private String query;//��ѯ��־
	
	private PageContext<ProductType> pageCtx;
	
	private List<ProductType> types = new ArrayList<ProductType>();
	
	public String list() {
		pageCtx = new PageContext<ProductType>(12, pageCtx.getCurrentPage());
		StringBuilder whereql = new StringBuilder("o.visible=?");
		List<Object> params = new ArrayList<Object>();
		params.add(true);
		if ("true".equals(query)) {//ִ�в�ѯ
			String name = type.getName();//��ʵ������ֻ������type������ԣ���������ȫ����ѯ
			if (name != null && !"".equals(name.trim())) {
				whereql.append(" and o.name like ?");
				params.add("%" + name + "%");
			}
		} else {
			if (parentId != null && parentId > 0) {
				whereql.append(" and o.parent.typeId=?");
				params.add(parentId);
			} else {
				whereql.append(" and o.parent is null");
			}
		}
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("typeId", "desc");
		QueryResult<ProductType> qr = productTypeService.getScrollData(pageCtx.getFirstResult(), pageCtx.getMaxResults(), whereql.toString(), params, orderby);
		types = qr.getResultList();
		pageCtx.setQueryResult(qr);
		return SUCCESS;
	}
	
	public String add() {
		ProductType subType = new ProductType();
		subType.setName(type.getName());
		subType.setNote(type.getNote());
		if (parentId != null && parentId > 0) {
			ProductType parentType = new ProductType();
			parentType.setTypeId(parentId);
			parentType.setName(parentName);
			subType.setParent(parentType);
		}
		productTypeService.save(subType);
		return SUCCESS;
	}
	
	public String update() {
		ProductType type = productTypeService.find(this.type.getTypeId());
		type.setName(this.type.getName());
		type.setNote(this.type.getNote());
		productTypeService.update(type);
		return SUCCESS;
	}

	public ProductTypeService getProductTypeService() {
		return productTypeService;
	}
	@Resource
	public void setProductTypeService(ProductTypeService productTypeService) {
		this.productTypeService = productTypeService;
	}

	public List<ProductType> getTypes() {
		return types;
	}

	public void setTypes(List<ProductType> types) {
		this.types = types;
	}

	public ProductType getType() {
		return type;
	}

	public void setType(ProductType type) {
		this.type = type;
	}

	public PageContext<ProductType> getPageCtx() {
		return pageCtx;
	}
	@Resource  
	public void setPageCtx(PageContext<ProductType> pageCtx) {
		this.pageCtx = pageCtx;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

}
