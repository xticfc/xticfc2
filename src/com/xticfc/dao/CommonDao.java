package com.xticfc.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.Type;
import org.springframework.jdbc.core.JdbcTemplate;



public class CommonDao{


    
	SessionFactory sessionFactory;
	JdbcTemplate jdbcTemplate;
	
	public Session getSession() {
        //事务必须是开启的(Required)，否则获取不到
        return sessionFactory.getCurrentSession();
    }
	
	/**
	 * 根据主键，返回实体
	 * @param id 主键
	 * @return	实体或空（如果没有查到）
	 */
	@SuppressWarnings("unchecked")
	public Object get(Class entityClass, Serializable id) {
        return getSession().get(entityClass, id);
    }
	
	
	/**
	 * 保存实体对象，返回主键
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Serializable save(Object model) {
		return getSession().save(model);
	}
	
	/**
	 * 更新实体对象，不返回值
	 * @param entity
	 */
	public void update(Object model){
		getSession().update(model);
	}
	
	/**
	 * 执行更新或插入语句，返回受影响的行数
	 * @param sql	纯sql语句
	 * @param param
	 * @return
	 */
	public int update(String sql , Object... param){
        return jdbcTemplate.update(sql, param);
	}
	
	
	/**
	 * 删除指定对象，不返回值
	 * @param model
	 */
	public void delete(Object model){
		getSession().delete(model);
	}
	
	/**
	 * 删除对象列表，不返回值
	 * @param list
	 */
	@SuppressWarnings("unchecked")
	public void deleteAll(List list){
		if(null != list && list.size() > 0){
			for(Iterator<Object> iter = list.iterator(); iter.hasNext();){
				delete(iter.next());
			}
		}
	}
	
	/**
	 * 删除对象列表，不返回值
	 * @param objectArray
	 */
	public void deleteAll(Object[] objectArray){
		if(null != objectArray){
			for(int i=0; i<objectArray.length; i++){
				delete(objectArray[i]);
			}
		}
	}
	/**
	 * 根据主键删除
	 * @param id
	 */
	@SuppressWarnings("unchecked")
	public void delete(Class entityClass, Serializable id) {
        getSession().delete(this.get(entityClass, id));

    }
	
	/**
	 * 保存或更新
	 * @param model 实体类
	 */
    public void saveOrUpdate(Object model) {
        getSession().saveOrUpdate(model);
    }
    
    public void merge(Object model) {
        getSession().merge(model);
    }
	
    /**
     * 根据查询条件返回唯一一条记录
     * 如果查询出多条，返回第一条
     * @param hql
     * @param paramlist
     * @return 如果查不到东西返回null
     */
    @SuppressWarnings("unchecked")
    public Object unique(final String hql, final Object... paramlist) {
        Query query = getSession().createQuery(hql);
        setParameters(query, paramlist);
        return query.setMaxResults(1).uniqueResult();
    }
    
    /**
     * 分页查询方法
     * @param hql	普通hql语句
     * @param param	参数
     * @return
     */
    @SuppressWarnings("unchecked")
	public List list(String hql, Object[] param){
    	return list(hql, param, -1, -1, null);
    }
    
    /**
     * 分页查询方法
     * @param entity	任意实体
     * @param start		分页起始数，第1页应为0
     * @param size		每个分页大小
     * @param order		排序语句,本方法会自动加上" order by "关键字
     * @return			封装有所查询实体类的列表,可能返回null
     */
    @SuppressWarnings("unchecked")
	public List list(Class entity, int start, int size, String order){
    	String sql = " from " + entity.getSimpleName();
    	return list(sql,null,start,size,order);
    }
    
    /**
     * 分页查询
     * @param entity	任意实体
     * @param hql		查询条件
     * @param param		参数
     * @param start		分布起始数，第1页应为0
     * @param size		每个分页大小
     * @param order		排序语句,本方法会自动加上" order by "关键字
     * @return			封装有所查询实体类的列表,可能返回null
     */
    @SuppressWarnings("unchecked")
	public List list(Class entity, String hql, Object[] param, int start, int size, String order){
    	String sql = " from " + entity.getSimpleName() + " where " +hql;
    	return list(sql,param,start,size,order);
    }
    
    
    
    
    
    /**
     * 返回个数
     * @param entity	任意实体
     * @return
     */
    @SuppressWarnings("unchecked")
	public int count(Class entity){
    	String sql = " select count(*) from " + entity.getSimpleName();
    	return count(sql, null);
    }
    
    /**
     * 返回个数
     * @param hql   符合HQL语法的count语句
     * @param param	参数
     * @return		查询的结果,如果出错,返回0
     */
    public int count(String hql, Object[] param){
    	Query query = getSession().createQuery(hql);
    	setParameters(query, param);
    	Object o = query.setMaxResults(0).uniqueResult();
    	int count = 0;
    	try {
			count = Integer.parseInt(o.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
    	return count;
    }
    
    
    /**
     * 分页查询方法
     * @param hql	要求为hibernate query language语句
     * @param param	参数
     * @param start	分页起始数，第1页应为0
     * @param size	每个分页大小
     * @param order	排序语句,本方法会自动加上" order by "关键字
     * @return		封装有所查询实体类的列表,可能返回null
     */
    @SuppressWarnings("unchecked")
	public List list(String hql, Object[] param, int start, int size, String order){
    	if(null != order && order.length() > 0){
    		hql += " order by " + order;
    	}
    	Query query = getSession().createQuery(hql);
    	setParameters(query, param);
    	if(start >= 0){				//开始页数不小于0才进行分页
    		if(size > 0){			//每页限制数量大于0才进行分页,不然无意义
    			query.setFirstResult(start*size);
    			query.setMaxResults(size);
    		}else{					//每页限制数量不大于0时,分页无意义
    			query.setFirstResult(0);
    		}
    	}
    	return query.list();
    }
    
    /**
     * 纯sql的分页
     * @param sql		纯sql语句
     * @param param		参数
     * @param start		分页起始数
     * @param size		每页个数
     * @param order		排序语句,本方法会自动加上" order by "关键字
     * @return			以Map<String,Object>组成的列表,可能返回null
     */
    public List<Map<String,Object>> listByNative(String sql, Object[] param, int start, int size, String order){
    	if(null != order && order.trim().length() > 0){
    		sql += " order by " + order;
    	}
    	sql = getLimitString(sql, start, size);
    	return jdbcTemplate.queryForList(sql, param);
    }
    
    /**
     * 纯sql的count方法
     * @param sql		纯sql语句
     * @param param		参数
     * @return			正常的个数,如果出错或为空,返回0
     */
    public int countByNative (String sql, Object... param){
    	return jdbcTemplate.queryForInt(sql, param);
    }
    
    
    /**
     * 把普通sql语句,处理成分页语句</br>
     * 在一个系统中,换数据库的情况应该非常少,所以没有动态判断应该提供哪个数据库的sql</br>
     * 在具体使用时,请根据实际情况来放开对应的代码.</br>
     * @param sql		纯sql语句
     * @param start		起始页码
     * @param size		每页个数
     * @return
     */
    public String getLimitString(String sql, int start, int size){
    	//mysql 写法
    	//只有在页数不为负且每页为正的时候,才进行分页
    	if(start >= 0){
    		if(size > 0){
    			sql = sql + " limit " + start*size +" " + size;
    		}
    	}
    	return sql;
    	
    	//oracle 写法
//    	StringBuffer oracleBuffer = new StringBuffer();
//    	if(size > 0){
//    		if(start == 0){
//    				oracleBuffer.append("select * from ( ");
//    				oracleBuffer.append(sql);
//    				oracleBuffer.append(" ) where rownum <= ").append(size);
//    		}else if(start > 0){
//    				oracleBuffer.append("select * from ( select row_.*, rownum rownum_ from ( ");
//    				oracleBuffer.append(sql);
//    				oracleBuffer.append(" ) row_ ) where rownum_ <= ");
//    				oracleBuffer.append((start+1)*size).append(" and rownum_ > ").append(start*size+1);
//    		}else{			//如果起始页数为负,不分页
//    			return sql;
//    		}
//    	}else{//如果每页数量不为正,不分页
//    		return sql;
//    	}
//    	return oracleBuffer.toString();
    	
    	//sqlServer 写法
    	//本写法没有经过测试,使用前请务必先测试正确性
//    	if (sql.toLowerCase().startsWith("select distinct")){
//            return "select distinct top " + size*start + sql.substring("select distinct".length());
//        }else{
//            return "select top " + size*start + sql.substring("select".length());
//        }
    }
    
    
    /**
     * 根据hql里的查询对象不同，返回不同的东西。
     * 比如返回count值。
     * @param hql
     * @param paramlist
     * @return 没查到东西会返回null
     */
    @SuppressWarnings("unchecked")
    public Object aggregate(final String hql, final Object... paramlist) {
        Query query = getSession().createQuery(hql);
        setParameters(query, paramlist);

        return query.uniqueResult();

    }
    
    /**
     * 根据hql里的查询对象不同，返回不同的东西。
     * 比如返回count值。
     * 除了将paramlist里的东西放入语句中外，还会把map里的东西放进去
     * @param hql
     * @param map
     * @param paramlist
     * @return 没查到东西会返回null
     */
    @SuppressWarnings("unchecked")
    public Object aggregate(final String hql, final Map<String, Collection<?>> map, final Object... paramlist) {
        Query query = getSession().createQuery(hql);
        if (paramlist != null) {
            setParameters(query, paramlist);
            for (Entry<String, Collection<?>> e : map.entrySet()) {
                query.setParameterList(e.getKey(), e.getValue());
            }
        }

        return query.uniqueResult();
    }
    
    /**
     * 执行更新或删除操作
     * @param hql
     * @param paramlist
     * @return
     */
    public int execteBulk(final String hql, final Object... paramlist) {
        Query query = getSession().createQuery(hql);
        setParameters(query, paramlist);
        return query.executeUpdate();
    }
    
    /**
     * 删除操作
     * @param hql	HQL语句
     * @param param
     */
    public void delete(final String hql, Object[] param){
    	Query query = getSession().createQuery(hql);
        setParameters(query, param);
        query.executeUpdate();
    }
    
    /**
     * 
     * @param natvieSQL
     * @param paramlist
     * @return
     */
    public int execteNativeBulk(final String natvieSQL, final Object... paramlist) {
        Query query = getSession().createSQLQuery(natvieSQL);
        setParameters(query, paramlist);
        Object result = query.executeUpdate();
        return result == null ? 0 : ((Integer) result).intValue();
    }
    
    
    
    
    
    
    /**
     * 
     * @param natvieSQL
     * @param scalarList
     * @param paramlist
     * @return
     */
    @SuppressWarnings("unchecked")
    public Object aggregateByNative(final String natvieSQL, final List<Entry<String, Type>> scalarList, final Object... paramlist) {
        SQLQuery query = getSession().createSQLQuery(natvieSQL);
        if (scalarList != null) {
            for (Entry<String, Type> entity : scalarList) {
                query.addScalar(entity.getKey(), entity.getValue());
            }
        }

        setParameters(query, paramlist);

        Object result = query.uniqueResult();
        return result;
    }
    
    
    
    /**
     * 查出所有相关实体的信息
     * @param entityClass
     * @return
     */
    @SuppressWarnings("unchecked")
	public List list(Class entityClass){
    	Criteria criteria = getSession().createCriteria(entityClass);
    	List list = criteria.list();
    	return list;
    	
    }
    

    
    
	
	protected void setParameters(Query query, Object[] paramlist) {
        if (paramlist != null) {
            for (int i = 0; i < paramlist.length; i++) {
                if(paramlist[i] instanceof Date) {
                    //TODO 难道这是bug 使用setParameter不行？？
                    query.setTimestamp(i, (Date)paramlist[i]);
                } else {
                    query.setParameter(i, paramlist[i]);
                }
            }
        }
    }
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
}
