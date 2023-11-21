package com.itkey.erpdev.admin.service;

import com.itkey.erpdev.admin.dao.TotalAdminDAO;
import com.itkey.erpdev.admin.domain.MenuEntity;
import com.itkey.erpdev.admin.dto.Banner;
import com.itkey.erpdev.admin.dto.FileDto;
import com.itkey.erpdev.admin.dto.TotalAdminDTO;
import com.itkey.erpdev.admin.dto.Visitor;
import com.itkey.erpdev.board.domain.Board;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@AllArgsConstructor
public class TotalAdminServiceImpl implements TotalAdminService {

    TotalAdminDAO totalAdminDAO;

    @Override
    public TotalAdminDTO getAdminInfo(TotalAdminDTO adminDTO) {
        return totalAdminDAO.getAdminInfo(adminDTO);
    }

    @Override
    public List<Board> getAdminBoardList() {
        return totalAdminDAO.getAdminBoardList();
    }

    @Override
    public List<Board> getBoardList() {
        return totalAdminDAO.getBoardList();
    }

    @Override
    public List<Board> boardTypeCnt() {
        return totalAdminDAO.boardTypeCnt();
    }

    @Override
    public void adminWriteBoard(Board board) {
        totalAdminDAO.adminWriteBoard(board);
    }

    @Override
    public List<Visitor> mostVisitURL() {
        return totalAdminDAO.mostVisitURL();
    }

    @Override
    public List<Visitor> mostVisitIP() {
        return totalAdminDAO.mostVisitIP();
    }

    @Override
    public List<Visitor> mostVisitDate() {
        return totalAdminDAO.mostVisitDate();
    }


    @Transactional
    @Override
    public int updMenuMgmtAjax(List<MenuEntity> menuEntityList) {
        try {
            // 삭제 대상 메뉴를 담을 리스트
            List<MenuEntity> menusToDelete = new ArrayList<>();

            for (MenuEntity menuEntity : menuEntityList) {
                if ("N".equals(menuEntity.getMenuUseYn())) {
                    menusToDelete.add(menuEntity);
                }
            }

            // log.info("menusToDeleteSize : " + menusToDelete.size());
            // 삭제하는 메뉴가 있는 경우 해당 게시판의 글 삭제
            if(menusToDelete.size() > 0) {
                totalAdminDAO.delBoardAjax(menusToDelete);
            }

            return totalAdminDAO.updMenuMgmtAjax(menuEntityList);
        } catch (Exception e) {
            throw new RuntimeException("Transaction failed", e);
        }
    }

    @Override
    public int getMenuListCntAjax(){
        return totalAdminDAO.getMenuListCntAjax();
    }

    @Override
    public List<Banner> getBannerList() throws Exception {
        return totalAdminDAO.getBannerList();
    }

    @Override
    public void saveBanner(Banner banner, MultipartFile[] file) throws Exception {

        String[] bannerNames = banner.getBannerName().split(",");
        String[] bannerUrls = banner.getBannerUrl().split(",");
        String[] bannerOrders = banner.getBannerOrder().split(",");

        for (int i = 0; i < bannerNames.length; i++) {
            FileDto fileDto = new FileDto();

            if (file != null && file.length > 0) {
                MultipartFile multipartFile = file[i];
                if (!multipartFile.isEmpty()) {
                    String originalFileName = multipartFile.getOriginalFilename();
                    String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

                    String newFileName = UUID.randomUUID().toString() + fileExtension;

                    String rootPath = System.getProperty("user.dir");
                    File staticDir = new File(rootPath, "src/main/resources/static/images");

                    if (!staticDir.exists()) {
                        staticDir.mkdirs();
                    }

                    File newFile = new File(staticDir, newFileName);

                    Path filePath = Paths.get(newFile.getAbsolutePath());

                    String fileUrl = "/images/" + newFileName;

                    Files.write(filePath, multipartFile.getBytes());

                    if (banner.getFileIdx() != null) {
                        fileDto.setFileIdx(String.valueOf(banner.getFileIdx()));
                        fileDto.setSaveNm(newFileName);
                        fileDto.setOriNm(originalFileName);
                        fileDto.setFilePath(fileUrl);
                        totalAdminDAO.updateFile(fileDto);
                    } else {
                        fileDto.setSaveNm(newFileName);
                        fileDto.setOriNm(originalFileName);
                        fileDto.setFilePath(fileUrl);
                        totalAdminDAO.saveFile(fileDto);
                    }

                }
            }

            if (banner.getBannerSeq() != null) {
                String[] bannerSeqs = banner.getBannerSeq().split(",");
                Banner newBanner = new Banner();
                newBanner.setBannerSeq(String.valueOf(bannerSeqs));
                newBanner.setBannerName(bannerNames[i]);
                newBanner.setBannerUrl(bannerUrls[i]);
                newBanner.setBannerOrder(bannerOrders[i]);
                totalAdminDAO.updateBanner(newBanner);
            } else {
                Banner newBanner = new Banner();
                newBanner.setBannerName(bannerNames[i]);
                newBanner.setBannerUrl(bannerUrls[i]);
                newBanner.setBannerOrder(bannerOrders[i]);
                newBanner.setFileIdx(fileDto.getFileIdx());
                totalAdminDAO.saveBanner(newBanner);
            }



        }
    }
}