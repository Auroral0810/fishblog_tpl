package com.Auroral.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.Auroral.blog.dto.FriendLinkBackDTO;
import com.Auroral.blog.dto.FriendLinkDTO;
import com.Auroral.blog.dto.PageDTO;
import com.Auroral.blog.entity.FriendLink;
import com.Auroral.blog.dao.FriendLinkDao;
import com.Auroral.blog.service.FriendLinkService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.Auroral.blog.utils.BeanCopyUtil;
import com.Auroral.blog.vo.ConditionVO;
import com.Auroral.blog.vo.FriendLinkVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author Auroral
 * @since 2020-05-18
 */
@Service
public class FriendLinkServiceImpl extends ServiceImpl<FriendLinkDao, FriendLink> implements FriendLinkService {
    @Autowired
    private FriendLinkDao friendLinkDao;

    @Override
    public List<FriendLinkDTO> listFriendLinks() {
        // 查询友链列表
        List<FriendLink> friendLinkList = friendLinkDao.selectList(new LambdaQueryWrapper<FriendLink>()
                .select(FriendLink::getId, FriendLink::getLinkName, FriendLink::getLinkAvatar, FriendLink::getLinkAddress, FriendLink::getLinkIntro));
        return BeanCopyUtil.copyList(friendLinkList, FriendLinkDTO.class);
    }

    @Override
    public PageDTO<FriendLinkBackDTO> listFriendLinkDTO(ConditionVO condition) {
        // 分页查询友链列表
        Page<FriendLink> page = new Page<>(condition.getCurrent(), condition.getSize());
        Page<FriendLink> friendLinkPage = friendLinkDao.selectPage(page, new LambdaQueryWrapper<FriendLink>()
                .select(FriendLink::getId, FriendLink::getLinkName, FriendLink::getLinkAvatar, FriendLink::getLinkAddress, FriendLink::getLinkIntro, FriendLink::getCreateTime)
                .like(StringUtils.isNotBlank(condition.getKeywords()), FriendLink::getLinkName, condition.getKeywords()));
        // 转换DTO
        List<FriendLinkBackDTO> friendLinkBackDTOList = BeanCopyUtil.copyList(friendLinkPage.getRecords(), FriendLinkBackDTO.class);
        return new PageDTO<>(friendLinkBackDTOList, (int) friendLinkPage.getTotal());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateFriendLink(FriendLinkVO friendLinkVO) {
        FriendLink friendLink = FriendLink.builder()
                .id(friendLinkVO.getId())
                .linkName(friendLinkVO.getLinkName())
                .linkAvatar(friendLinkVO.getLinkAvatar())
                .linkAddress(friendLinkVO.getLinkAddress())
                .linkIntro(friendLinkVO.getLinkIntro())
                .createTime(Objects.isNull(friendLinkVO.getId()) ? new Date() : null)
                .build();
        this.saveOrUpdate(friendLink);
    }

}
