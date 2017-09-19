package com.oa.documents.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.documents.dao.DirectoryDao;
import com.oa.documents.entity.Directory;

public class DirectoryDaoImpl extends BaseDao implements DirectoryDao {
	/**
	 * 删除目录
	 */
	public int delete(int dirId) {
		String sql = "delete from directory where dirId=?";
		int ret=0;
		ret=super.executeUpdate(sql, dirId);
		return ret;
	}

	/**
	 * 根据父节点id查找查找目录name
	 */
	public String findByParentId(int parentId) {
		String sql = "select dirName from directory where parentId=?";
		String dirName="";
		ResultSet rs = super.executeQuery(sql, parentId);
		try {
			while(rs.next()){
				dirName=rs.getString("dirName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				super.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return dirName;
	}
	/**
	 * 增加目录
	 */
	public int insert(Directory directory) {
		String sql = "insert into directory values(?,?,?)";
		List params = new ArrayList();
		params.add(directory.getParentId());
		params.add(directory.getDirName());
		params.add(directory.getUid());
		int ret=0;
		ret = super.executeUpdate(sql, params);
		return ret;
	}

}
