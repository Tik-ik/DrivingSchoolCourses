package com.base.controller.common;

import com.alibaba.fastjson.JSONObject;
import com.base.bean.CodeMsg;
import com.base.util.StringUtil;
import com.base.bean.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

/**
 * 公用的上传类
 * @author Administrator
 *
 */
@RequestMapping("/upload")
@Controller
public class UploadController {

	@Value("${ylrc.upload.photo.sufix}")
	private String uploadPhotoSufix;
	
	@Value("${ylrc.upload.photo.maxsize}")
	private long uploadPhotoMaxSize;
	
	@Value("${ylrc.upload.photo.path}")
	private String uploadPhotoPath;//文件保存位置
	

	@Value("${ylrc.upload.video.sufix}")
	private String uploadVideoSuffix;

	@Value("${ylrc.upload.video.maxsize}")
	private long uploadVideoMaxSize;

	@Value("${ylrc.upload.video.path}")
	private String uploadVideoPath;//文件保存位置

	private Logger log = LoggerFactory.getLogger(UploadController.class);

	/**
	 * 图片统一上传类
	 * @param photo
	 * @return
	 */
	@RequestMapping(value="/upload_photo",method=RequestMethod.POST)
	@ResponseBody
	public Result<String> uploadPhoto(@RequestParam(name="photo",required=true)MultipartFile photo){
		//判断文件类型是否是图片
		String originalFilename = photo.getOriginalFilename();
		//获取文件后缀
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
		if(!uploadPhotoSufix.contains(suffix.toLowerCase())){
			return Result.error(CodeMsg.UPLOAD_PHOTO_SUFFIX_ERROR);
		}
		if(photo.getSize()/1024 > uploadPhotoMaxSize){
			CodeMsg codeMsg = CodeMsg.UPLOAD_PHOTO_ERROR;
			codeMsg.setMsg("图片大小不能超过" + (uploadPhotoMaxSize/1024) + "M");
			return Result.error(codeMsg);
		}
		//准备保存文件
		File filePath = new File(uploadPhotoPath);
		if(!filePath.exists()){
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		filePath = new File(uploadPhotoPath + "/" + StringUtil.getFormatterDate(new Date(), "yyyyMMdd"));
		//判断当天日期的文件夹是否存在，若不存在，则创建
		if(!filePath.exists()){
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		String filename = StringUtil.getFormatterDate(new Date(), "yyyyMMdd") + "/" + System.currentTimeMillis() + suffix;
		try {
			photo.transferTo(new File(uploadPhotoPath+"/"+filename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("图片上传成功，保存位置：" + uploadPhotoPath + filename);
		return Result.success(filename);
	}

	@RequestMapping(value="/home_upload_photo",method=RequestMethod.POST)
	@ResponseBody
	public Result<String> homeUploadPhoto(@RequestParam(name="file")MultipartFile photo){
		//判断文件类型是否是图片
		String originalFilename = photo.getOriginalFilename();
		//获取文件后缀
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
		if(!uploadPhotoSufix.contains(suffix.toLowerCase())){
			return Result.error(CodeMsg.UPLOAD_PHOTO_SUFFIX_ERROR);
		}
		if(photo.getSize()/1024 > uploadPhotoMaxSize){
			CodeMsg codeMsg = CodeMsg.UPLOAD_PHOTO_ERROR;
			codeMsg.setMsg("图片大小不能超过" + (uploadPhotoMaxSize/1024) + "M");
			return Result.error(codeMsg);
		}
		//准备保存文件
		File filePath = new File(uploadPhotoPath);
		if(!filePath.exists()){
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		filePath = new File(uploadPhotoPath + "/" + StringUtil.getFormatterDate(new Date(), "yyyyMMdd"));
		//判断当天日期的文件夹是否存在，若不存在，则创建
		if(!filePath.exists()){
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		String filename = StringUtil.getFormatterDate(new Date(), "yyyyMMdd") + "/" + System.currentTimeMillis() + "-" + UUID.randomUUID().toString() + suffix;
		try {
			photo.transferTo(new File(uploadPhotoPath+"/"+filename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("图片上传成功，保存位置：" + uploadPhotoPath + filename);
		return Result.success(filename);
	}


	/**
	 * 视频统一上传类
	 * @param video
	 * @return
	 */
	@RequestMapping(value="/upload_video",method=RequestMethod.POST)
	@ResponseBody
	public Result<String> uploadVideo(@RequestParam(name="video",required=true)MultipartFile video){
		//判断文件类型是否是图片
		String originalFilename = video.getOriginalFilename();
		//获取文件后缀
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());
		if(!uploadVideoSuffix.contains(suffix.toLowerCase())){
			return Result.error(CodeMsg.UPLOAD_VIDEO_SUFFIX_ERROR);
		}
		if(video.getSize()/1024 > uploadVideoMaxSize){
			CodeMsg codeMsg = CodeMsg.UPLOAD_PHOTO_ERROR;
			codeMsg.setMsg("视频大小不能超过" + (uploadVideoMaxSize/1024)  + "M");
			return Result.error(codeMsg);
		}
		//准备保存文件
		File filePath = new File(uploadVideoPath);
		if(!filePath.exists()){
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		filePath = new File(uploadVideoPath + "/" + StringUtil.getFormatterDate(new Date(), "yyyyMMdd"));
		//判断当天日期的文件夹是否存在，若不存在，则创建
		if(!filePath.exists()){
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		String filename = StringUtil.getFormatterDate(new Date(), "yyyyMMdd") + "/" + System.currentTimeMillis() + suffix;
		try {
			video.transferTo(new File(uploadVideoPath+"/"+filename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("视频上传成功，保存位置：" + uploadVideoPath + filename);
		return Result.success(filename);
	}


	/**
	 * 富文本kindedit的图片上传
	 * @param request
	 * @param response
	 * @param imgFile
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public void uploadFile(HttpServletRequest request, HttpServletResponse response, @RequestParam("imgFile") MultipartFile imgFile) throws IOException {
		PrintWriter out = response.getWriter();
		//判断文件类型是否是图片
		String originalFilename = imgFile.getOriginalFilename();
		//获取文件后缀
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
		if (!uploadPhotoSufix.contains(suffix.toLowerCase())) {
			out.write("图片格式不正确！");
		}
		if (imgFile.getSize() / 1024 > uploadPhotoMaxSize) {
			CodeMsg codeMsg = CodeMsg.UPLOAD_PHOTO_ERROR;
			codeMsg.setMsg("图片大小不能超过" + (uploadPhotoMaxSize / 1024) + "M");
			out.write(String.valueOf(codeMsg));
		}
		//准备保存文件
		File filePath = new File(uploadPhotoPath);
		if (!filePath.exists()) {
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		filePath = new File(uploadPhotoPath + "/" + StringUtil.getFormatterDate(new Date(), "yyyyMMdd"));
		//判断当天日期的文件夹是否存在，若不存在，则创建
		if (!filePath.exists()) {
			//若不存在文件夹，则创建一个文件夹
			filePath.mkdir();
		}
		String filename = StringUtil.getFormatterDate(new Date(), "yyyyMMdd") + "/" + System.currentTimeMillis() + suffix;
		try {
			imgFile.transferTo(new File(uploadPhotoPath + "/" + filename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("图片上传成功，保存位置：" + uploadPhotoPath + filename);
		response.setContentType("application/json; charset=UTF-8");
		JSONObject obj = new JSONObject();
		obj.put("error", 0);
		obj.put("url", "/photo/view?filename=" +  "/" + filename);
		out.println(obj.toJSONString());
	}

}
