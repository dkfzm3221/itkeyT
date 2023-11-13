package com.itkey.erpdev.admin.dao;


import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import lombok.AllArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@AllArgsConstructor
public class TotalAdminDAOImpl implements TotalAdminDAO {

	SqlSessionTemplate sql;

	@Override
	public TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO) {
		return sql.selectOne("mapper.totalAdmin.getAdminInfo", adminDTO);
	}
}