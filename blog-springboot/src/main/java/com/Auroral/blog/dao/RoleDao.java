package com.Auroral.blog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.Auroral.blog.dto.RoleDTO;
import com.Auroral.blog.dto.UrlRoleDTO;
import com.Auroral.blog.entity.Role;
import com.Auroral.blog.vo.ConditionVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: Auroral
 * @date: 2020-12-27
 **/
@Repository
public interface RoleDao extends BaseMapper<Role> {

    /**
     * 查询路由角色列表
     *
     * @return 角色标签
     */
    List<UrlRoleDTO> listUrlRoles();

    /**
     * 根据用户id获取角色列表
     *
     * @param userInfoId 用户id
     * @return 角色标签
     */
    List<String> listRolesByUserInfoId(Integer userInfoId);

    /**
     * 查询角色列表
     *
     * @param conditionVO 条件
     * @return 角色列表
     */
    List<RoleDTO> listRoles(@Param("conditionVO") ConditionVO conditionVO);

}
