package com.itkey.erpdev.common.page;

import com.github.pagehelper.PageInfo;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;

/**
 *packageName    : com.itkey.erpdev.common.page
 * fileName       : Paging
 * author         : AHN
 * date           : 2023-02-09
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-02-09        AHN       최초 생성
 */

@Slf4j
public class Paging {

  public static Map<String, Object> pageUtil(List<?> list, Integer pageNum, Integer pageSize) {

    PageInfo page = new PageInfo(list);
    Map<String, Object> map = new HashMap<>();


    //총 게시물 수
    int totalCount = (int) page.getTotal();
    //총 페이지
    int totalPage = totalCount / pageSize;


    if(totalCount % pageSize > 0){
      totalPage++;
    }
    if(totalPage < pageNum){
      pageNum = totalPage;
    }

    int startPage = ((pageNum -1)/ pageSize) * pageSize + 1;
    int endPage = startPage + pageSize -1;

    if(endPage > totalPage){
      endPage = totalPage;
    }


    map.put("totalCount", totalCount);
    map.put("totalPage", totalPage);
    map.put("pageNum", pageNum);
    map.put("startPage", startPage);
    map.put("endPage", endPage);

    return map;
  }
}

