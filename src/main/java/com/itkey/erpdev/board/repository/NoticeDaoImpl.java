package com.itkey.erpdev.board.repository;

import com.itkey.erpdev.admin.dto.FileDto;
import com.itkey.erpdev.board.domain.Notice;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@AllArgsConstructor
@Slf4j
public class NoticeDaoImpl implements NoticeDao{

    SqlSessionTemplate sql;

    @Override
    public List<Notice> selectNotice() throws Exception {
        return sql.selectList("mapper.notice.selectNotice");
    }

    @Override
    public void updateInqCnt(Notice notice) throws Exception {
        sql.update("mapper.notice.updateInqCnt", notice);
    }

    @Override
    public Notice noticeDetail(Notice notice) throws Exception {
        return sql.selectOne("mapper.notice.noticeDetail", notice);
    }

    @Override
    public void modiNotice(Notice notice) throws Exception {
        sql.update("mapper.notice.modiNotice", notice);
    }

    @Override
    public void deleteNotice(Notice notice) throws Exception {
        sql.delete("mapper.notice.deleteNotice", notice);
    }

    @Override
    public void insertNotice(Notice notice) throws Exception {
        sql.insert("mapper.notice.insertNotice", notice);
    }

    @Override
    public void saveFile(FileDto fileDto) {
        sql.insert("mapper.totalAdmin.saveFile", fileDto);
    }


    @Override
    public void updateFile(FileDto fileDto) throws Exception {
        sql.update("mapper.totalAdmin.updateFile", fileDto);
    }
}
