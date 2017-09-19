package com.oa.deskTop.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oa.common.BaseDao;
import com.oa.deskTop.dao.MemoDao;
import com.oa.deskTop.entity.Memo;

public class MemoDaoImpl extends BaseDao implements MemoDao {
	/**
	 * ����ĳ�û������б�ǩ
	 */
	public List<Memo> findAll(int uId) {
		String sql = "select * from memo where uId=?";
		List<Memo> memoList = new ArrayList<Memo>();
		ResultSet rs = super.executeQuery(sql, uId);
		try {
			while(rs.next()){
				Memo memo = new Memo();
				memo.setMemoId(rs.getInt("memoId"));
				memo.setUid(rs.getInt("uId"));
				memo.setTitle(rs.getString("title"));
				memo.setContents(rs.getString("contents"));
				memo.setCreateTime(rs.getDate("createTime"));
				memoList.add(memo);
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
		return memoList;
	}
	/**
	 * ��ҳ����ĳ�û������б�ǩ
	 */
	public List<Memo> findAll(int pageSize , int pageNo,int uId) {
		String sql="select top "+ pageSize+" * from memo where uId="+uId+" and memoId not in(select top "+ ((pageNo-1)*pageSize) +" memoId from memo order by createTime desc) order by createTime desc";
		//System.out.println(sql);
		List<Memo> memoList = new ArrayList<Memo>();
		ResultSet rs = super.executeQuery(sql);
		try {
			while(rs.next()){
				Memo memo = new Memo();
				memo.setMemoId(rs.getInt("memoId"));
				memo.setUid(rs.getInt("uId"));
				memo.setTitle(rs.getString("title"));
				memo.setContents(rs.getString("contents"));
				memo.setCreateTime(rs.getDate("createTime"));
				memoList.add(memo);
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
		return memoList;
	}
	/**
	 * ����memo��Id����
	 */
	public Memo findByMemoId(int memoId) {
		String sql = "select * from memo where memoId=?";
		Memo memo=null;
		ResultSet rs = super.executeQuery(sql, memoId);
		try {
			while(rs.next()){
				 memo = new Memo();
				memo.setMemoId(rs.getInt("memoId"));
				memo.setUid(rs.getInt("uId"));
				memo.setTitle(rs.getString("title"));
				memo.setContents(rs.getString("contents"));
				memo.setCreateTime(rs.getDate("createTime"));
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
		return memo;
	}

	/**
	 * ɾ��memo
	 */
	public int delete(int memoId) {
		String sql = "delete from memo where memoId=?";
		int ret =0;
		ret=super.executeUpdate(sql, memoId);
		return ret;
	}
	/**
	 * ����memo
	 */
	public int insert(Memo memo) {
		String sql = "insert into memo values(?,?,?,?)";
		List params = new ArrayList();
		params.add(memo.getTitle());
		params.add(memo.getContents());
		params.add(memo.getCreateTime());
		params.add(memo.getUid());
		int ret = 0;
		ret = super.executeUpdate(sql, params);
		return ret;
	}
	/**
	 * ����ĳ�û��ı�ǩҳ��
	 * @param pageSize
	 * @param uId
	 * @return
	 */
	public int computePageCount(int pageSize,int uId) {
		// TODO Auto-generated method stub
		String sql = "select count(memoId) as 'total' from memo where uId=?";
		ResultSet rs = super.executeQuery(sql,uId);
		int total =0;
		try {
			if(rs.next()){
				//rs.getInt(1);����һ
				total=rs.getInt("total");
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
		
		return (total%pageSize==0?total/pageSize:total/pageSize+1);	
	}
	public int update(Memo memo){
		String sql="update memo set title=?,contents=? where memoId=?";
		List params=new ArrayList();
		params.add(memo.getTitle());
		params.add(memo.getContents());
		params.add(memo.getMemoId());
		return super.executeUpdate(sql, params);
		
	}
}
