package com.Auroral.blog.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.Auroral.blog.dto.MessageBackDTO;
import com.Auroral.blog.dto.PageDTO;
import com.Auroral.blog.vo.ConditionVO;
import com.Auroral.blog.vo.MessageVO;
import com.Auroral.blog.dto.MessageDTO;
import com.Auroral.blog.entity.Message;
import com.Auroral.blog.dao.MessageDao;
import com.Auroral.blog.service.MessageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.Auroral.blog.utils.BeanCopyUtil;
import com.Auroral.blog.utils.IpUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author Auroral
 * @since 2020-05-18
 */
@Service
public class MessageServiceImpl extends ServiceImpl<MessageDao, Message> implements MessageService {
    @Autowired
    private MessageDao messageDao;
    @Resource
    private HttpServletRequest request;


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveMessage(MessageVO messageVO) {
        // 获取用户ip
        String ipAddr = IpUtil.getIpAddr(request);
        String ipSource = IpUtil.getIpSource(ipAddr);
        Message message = Message.builder()
                .nickname(messageVO.getNickname())
                .avatar(messageVO.getAvatar())
                .messageContent(messageVO.getMessageContent())
                .time(messageVO.getTime())
                .createTime(new Date())
                .ipAddress(IpUtil.getIpAddr(request))
                .ipSource(ipSource).build();
        messageDao.insert(message);
    }

    @Override
    public List<MessageDTO> listMessages() {
        // 查询留言列表
        List<Message> messageList = messageDao.selectList(new LambdaQueryWrapper<Message>()
                .select(Message::getId, Message::getNickname, Message::getAvatar, Message::getMessageContent, Message::getTime));
        return BeanCopyUtil.copyList(messageList, MessageDTO.class);
    }

    @Override
    public PageDTO<MessageBackDTO> listMessageBackDTO(ConditionVO condition) {
        // 分页查询留言列表
        Page<Message> page = new Page<>(condition.getCurrent(), condition.getSize());
        LambdaQueryWrapper<Message> messageLambdaQueryWrapper = new LambdaQueryWrapper<Message>()
                .select(Message::getId, Message::getNickname, Message::getAvatar, Message::getIpAddress, Message::getIpSource, Message::getMessageContent, Message::getCreateTime)
                .like(StringUtils.isNotBlank(condition.getKeywords()), Message::getNickname, condition.getKeywords())
                .orderByDesc(Message::getCreateTime);
        Page<Message> messagePage = messageDao.selectPage(page, messageLambdaQueryWrapper);
        // 转换DTO
        List<MessageBackDTO> messageBackDTOList = BeanCopyUtil.copyList(messagePage.getRecords(), MessageBackDTO.class);
        return new PageDTO<>(messageBackDTOList, (int) messagePage.getTotal());
    }

}
