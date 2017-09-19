package com.oa.documents.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.documents.dao.DocumentsDao;
import com.oa.documents.entity.Documents;

public class DocumentsDaoImpl extends BaseDao implements DocumentsDao {

	public int delete(int docId) {
		String sql="delete from documents where docId=?";
		return super.executeUpdate(sql,docId);

	}
	/**
	 * 根据uId查找文档
	 */
	public List<Documents> findByUid(int uId) {
		String sql="select * from  documents where uId=? order by docId desc";
		List<Documents> docList = new ArrayList<Documents>();
		ResultSet rs = super.executeQuery(sql, uId);
		try {
			while(rs.next()){
				Documents documents = new Documents();
				documents.setDocId(rs.getInt("docId"));
				documents.setVirtualPath(rs.getString("virtualPath"));
				documents.setTitle(rs.getString("title"));
				documents.setNote(rs.getString("note"));
				documents.setCreateTime(rs.getDate("createTime"));
				documents.setUid(rs.getInt("uId"));
				documents.setParentId(rs.getInt("parentId"));
				docList.add(documents);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return docList;
	}

	public int insert(Documents documents) {
		String sql="insert into documents values(?,?,?,?,?,?)";
		List params=new ArrayList();
		params.add(documents.getVirtualPath());
		params.add(documents.getTitle());
		params.add(documents.getNote());
		params.add(documents.getCreateTime());
		params.add(documents.getUid());
		params.add(documents.getParentId());
		
		return super.executeUpdate(sql,params);

	}
	public int findMaxId(){
		String sql="select top 1 docId from documents order by docId desc";
		ResultSet rs=super.executeQuery(sql);
		try {
			while(rs.next())
			{
				return rs.getInt("docId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			super.close();
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
   public List<Documents> findByCondition(int uId,String title,String note){
	   String sql="select * from documents where uId="+uId+" and title like ? and note like ?";
	   List params=new ArrayList();
	   if(title==null)
	   {
		params.add("%");   
	   }
	   if(title!=null)
	   {
		   params.add("%"+title+"%");
	   }
	   if(note==null)
	   {
		params.add("%");   
	   }
	   if(note!=null)
	   {
		   params.add("%"+note+"%");
	   }
	   List<Documents> docList = new ArrayList<Documents>();
		ResultSet rs = super.executeQuery(sql, params);
		try {
			while(rs.next()){
				Documents documents = new Documents();
				documents.setDocId(rs.getInt("docId"));
				documents.setVirtualPath(rs.getString("virtualPath"));
				documents.setTitle(rs.getString("title"));
				documents.setNote(rs.getString("note"));
				documents.setCreateTime(rs.getDate("createTime"));
				documents.setUid(rs.getInt("uId"));
				documents.setParentId(rs.getInt("parentId"));
				docList.add(documents);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return docList;
	   
   }
   
  

}
