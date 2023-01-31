package com.me7eorite.bbs.controller.tool;

import com.fasterxml.jackson.databind.ser.Serializers;
import com.me7eorite.bbs.controller.BaseController;
import com.me7eorite.bbs.util.FileUtil;
import com.me7eorite.bbs.util.Uploader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * @ClassName: FIleController
 * @Description: TODO
 * @Author: me7eorite
 * @date: 2023/1/26 15:39
 * @Version: V1.0
 */
@Controller("toolFileController")
@RequestMapping(value = "/file")
public class FIleController extends BaseController {
    @RequestMapping(value = "/upload")
    public ResponseEntity<String> upload(HttpServletRequest request, @RequestParam("cmfile")CommonsMultipartFile cmfile,Integer fileSize) {
        if (cmfile != null && !cmfile.isEmpty()) {
            if (cmfile.getSize() < 10 * 1024 * 1024) {
                String filename = cmfile.getOriginalFilename();
                String suffix = filename.substring(filename.lastIndexOf("."));
                String newPath = "";
                Uploader uploader = new Uploader(request);
                String folder = uploader.getFolder("upload");
                if ((".gif.png.jpg.jpeg.bmp").indexOf(suffix) >= 0) {
                    newPath = folder + "/" + FileUtil.newFileName(filename);
                } else {
                    return renderMsg(false, "只能上传图片");
                }
                try {

                    File file = new File(request.getServletContext().getRealPath("/") + newPath);
                    if (!file.exists()) {
                        file.createNewFile();
                        cmfile.getFileItem().write(file);
                        return renderData(true, "上传成功!",new UploadFile(cmfile.getSize(), filename,suffix,newPath));
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                return renderMsg(false, "文件大小不能超过10MB");
            }

        }
        return renderMsg(false,"上传失败");
    }
}

class  UploadFile{
    Long filesize;
    String filename;
    String suffix;
    String filePath;
    String suoImgUrl;

    public UploadFile() {
    }

    public UploadFile(Long filesize, String filename, String suffix, String filePath) {
        this.filesize = filesize;
        this.filename = filename;
        this.suffix = suffix;
        this.filePath = filePath;
    }

    public Long getFilesize() {
        return filesize;
    }

    public void setFilesize(Long filesize) {
        this.filesize = filesize;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getSuoImgUrl() {
        return suoImgUrl;
    }

    public void setSuoImgUrl(String suoImgUrl) {
        this.suoImgUrl = suoImgUrl;
    }
}