package com.rin.bus.service;

import java.util.List;

import com.rin.bus.domain.Customer;
import com.rin.bus.vo.CustomerVo;
import com.rin.sys.utils.DataGridView;

/**
 * 客户管理的服务接口
 * @author Rin
 *
 */
public interface CustomerService {
	/**
	 * 查询所有客户
	 * @param customerVo
	 * @return
	 */
	public DataGridView queryAllCustomer(CustomerVo customerVo);
	/**
	 * 添加客户
	 * @param customerVo
	 */
	public void addCustomer(CustomerVo customerVo);
	/**
	 * 修改客户
	 * @param customerVo
	 */
	public void updateCustomer(CustomerVo customerVo);
	/**
	 * 根据id删除客户
	 * @param customerid
	 */
	public void deleteCustomer(String identity);
	/**
	 * 批量删除客户
	 * @param customerVo
	 */
	public void deleteBatchCustomer(String [] identitys);
	
	/**
	 * 根据身份证号查询客户信息
	 * @param identity
	 * @return
	 */
	public Customer queryCustomerByIdentity(String identity);
	
	/**
	 * 查询客户数据返回集合
	 * @param customerVo
	 * @return
	 */
	public List<Customer> queryAllCustomerForList(CustomerVo customerVo);
	
	
	/**
	 * 重置客户密码
	 * @param identity
	 */
	public void resetCustomerPwd(String identity);
	

}
